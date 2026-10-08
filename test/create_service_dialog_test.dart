import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/service_apply_result.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pbgrpc.dart';
import 'package:fungi_app/ui/widgets/create_service_dialog.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grpc/grpc.dart';

import 'service_apply_client_test.dart' show ApplyDaemon;

// GetStorage keeps its file open and exposes no dispose method. Track that
// handle so the fixture can close it before deleting its directory on Windows.
class _StorageFile implements File {
  _StorageFile(this.file, this.onOpen);

  final File file;
  final void Function(RandomAccessFile) onOpen;

  @override
  bool existsSync() => file.existsSync();

  @override
  Future<RandomAccessFile> open({FileMode mode = FileMode.read}) async {
    final handle = await file.open(mode: mode);
    onOpen(handle);
    return handle;
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class DialogController extends FungiController {
  int applyCount = 0;
  bool? requestedStart;
  String? requestedName;
  String? requestedPeer;
  Completer<ServiceApplyResult>? pendingApply;
  ServiceApplyResult result = const ServiceApplyResult(
    disposition: ServiceApplyDisposition.complete,
  );

  @override
  // Keep this UI test independent of daemon and desktop plugin startup.
  // ignore: must_call_super
  void onInit() {}

  @override
  Future<List<RecipeSummary>> listServiceRecipes({bool refresh = false}) async {
    return [RecipeSummary(id: 'filebrowser', name: 'File Browser')];
  }

  @override
  Future<RecipeDetail> getServiceRecipeDetail({
    required String recipeId,
    bool refresh = false,
  }) async => RecipeDetail(
    summary: RecipeSummary(id: recipeId, name: 'File Browser'),
  );

  @override
  Future<ResolveRecipeResponse> resolveServiceRecipe({
    required String recipeId,
    String? serviceName,
    String? peerId,
    bool refresh = false,
  }) async {
    requestedName = serviceName;
    requestedPeer = peerId;
    return ResolveRecipeResponse(manifestYaml: 'resolved service');
  }

  @override
  Future<ServiceApplyResult> createLocalServiceFromResolvedRecipe(
    ResolveRecipeResponse resolved, {
    bool startAfterApply = false,
  }) async {
    applyCount++;
    requestedStart = startAfterApply;
    return pendingApply == null ? result : await pendingApply!.future;
  }

  @override
  Future<ServiceApplyResult> createRemoteServiceFromResolvedRecipe({
    required String peerId,
    required ResolveRecipeResponse resolved,
    bool startAfterApply = false,
  }) async {
    requestedPeer = peerId;
    return createLocalServiceFromResolvedRecipe(
      resolved,
      startAfterApply: startAfterApply,
    );
  }
}

class BlockedRefreshDaemon extends ApplyDaemon {
  final refreshEntered = Completer<void>();
  final releaseRefresh = Completer<void>();
  DateTime? refreshDeadline;
  bool failApply = false;

  @override
  void checkApply(ServiceCall call) {
    if (failApply) throw GrpcError.internal('apply rejected');
    super.checkApply(call);
  }

  Future<void> waitForRefresh(ServiceCall call) async {
    if (!refreshEntered.isCompleted) {
      refreshDeadline = call.deadline;
      refreshEntered.complete();
    }
    await releaseRefresh.future;
    if (failApply) throw GrpcError.unavailable('list refresh failed');
  }

  @override
  Future<ListServicesResponse> listServices(
    ServiceCall call,
    Empty request,
  ) async {
    await waitForRefresh(call);
    return ListServicesResponse(servicesJson: '[${instance(phaseAfterApply)}]');
  }

  @override
  Future<ServiceAccessesResponse> listServiceAccesses(
    ServiceCall call,
    ListServiceAccessesRequest request,
  ) async {
    await waitForRefresh(call);
    return ServiceAccessesResponse(serviceAccessesJson: '[]');
  }
}

class RefreshTrackingController extends FungiController {
  final refreshFinished = Completer<void>();

  @override
  Future<void> refreshLocalServicesData() async {
    await super.refreshLocalServicesData();
    refreshFinished.complete();
  }

  @override
  Future<void> refreshAvailableServicesData({
    String? peerId,
    bool cached = false,
    bool showLoading = true,
  }) async {
    await super.refreshAvailableServicesData(
      peerId: peerId,
      cached: cached,
      showLoading: showLoading,
    );
    if (!cached) refreshFinished.complete();
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory storageDirectory;
  final storageHandles = <RandomAccessFile>[];
  setUpAll(() async {
    storageDirectory = await Directory.systemTemp.createTemp(
      'fungi-dialog-test-',
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (_) async => storageDirectory.path,
        );
    final storageFile = File(
      '${storageDirectory.path}${Platform.pathSeparator}GetStorage.gs',
    );
    await storageFile.writeAsString('{}');
    await IOOverrides.runZoned(
      () => GetStorage('GetStorage', storageDirectory.path).initStorage,
      createFile: (path) {
        if (path != storageFile.path) {
          throw StateError('Unexpected storage file: $path');
        }
        return _StorageFile(storageFile, storageHandles.add);
      },
    );
  });
  tearDownAll(() async {
    for (final handle in storageHandles) {
      await handle.close();
    }
    await storageDirectory.delete(recursive: true);
  });
  late DialogController controller;
  setUp(() {
    Get.testMode = true;
    controller = DialogController();
    Get.put<FungiController>(controller);
  });
  tearDown(() => Get.reset());

  for (final remote in [false, true]) {
    for (final failed in [false, true]) {
      test(
        '${remote ? 'remote' : 'local'} ${failed ? 'failed' : 'partial'} apply returns while refresh is pending',
        () async {
          final daemon = BlockedRefreshDaemon()
            ..partialApply = !failed
            ..failApply = failed;
          final server = Server.create(services: [daemon]);
          await server.serve(address: '127.0.0.1', port: 0);
          final channel = ClientChannel(
            '127.0.0.1',
            port: server.port!,
            options: const ChannelOptions(
              credentials: ChannelCredentials.insecure(),
            ),
          );
          final applyController = RefreshTrackingController()
            ..fungiClient = FungiDaemonClient(channel)
            ..addressBook.add(DeviceInfo(peerId: 'peer-7'));
          final resolved = ResolveRecipeResponse(manifestYaml: 'manifest');
          final resultFuture = remote
              ? applyController.createRemoteServiceFromResolvedRecipe(
                  peerId: 'peer-7',
                  resolved: resolved,
                )
              : applyController.createLocalServiceFromResolvedRecipe(resolved);
          try {
            await daemon.refreshEntered.future.timeout(
              const Duration(seconds: 5),
            );
            final result = await resultFuture.timeout(
              const Duration(seconds: 2),
            );
            expect(
              result.disposition,
              failed
                  ? ServiceApplyDisposition.failed
                  : ServiceApplyDisposition.partial,
            );
            expect(
              result.message,
              contains(failed ? 'apply rejected' : 'Address already in use'),
            );
            expect(daemon.refreshDeadline, isNotNull);
            expect(applyController.refreshFinished.isCompleted, isFalse);
          } finally {
            daemon.releaseRefresh.complete();
            try {
              await resultFuture;
              await applyController.refreshFinished.future.timeout(
                const Duration(seconds: 5),
              );
              if (!remote) {
                expect(applyController.localServicesLoading.value, isFalse);
                if (failed) {
                  expect(
                    applyController.localServicesError.value,
                    contains('list refresh failed'),
                  );
                } else {
                  expect(applyController.localServices.single.name, 'files');
                }
              } else if (!failed) {
                expect(
                  applyController.peerRemoteServices['peer-7'],
                  hasLength(1),
                );
              }
            } finally {
              await channel.shutdown();
              await server.shutdown();
            }
          }
        },
      );
    }
  }

  Future<void> openDialog(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(
      GetMaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => TextButton(
              onPressed: () => showCreateServiceDialog(context),
              child: const Text('Open'),
            ),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Open'));
    await tester.pumpAndSettle();
  }

  testWidgets('optional startup and busy state prevent duplicate submissions', (
    tester,
  ) async {
    controller.pendingApply = Completer<ServiceApplyResult>();
    await openDialog(tester);
    await tester.tap(find.widgetWithText(ChoiceChip, 'Recipe'));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(CheckboxListTile));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Apply & Start'));
    await tester.pump();
    await tester.pump();
    expect(controller.applyCount, 1);
    expect(controller.requestedStart, isTrue);
    final button = tester.widget<FilledButton>(find.byType(FilledButton));
    expect(button.onPressed, isNull);
    await tester.binding.handlePopRoute();
    await tester.pump();
    expect(find.text('Apply Service'), findsOneWidget);
    controller.pendingApply!.complete(
      const ServiceApplyResult(disposition: ServiceApplyDisposition.complete),
    );
    await tester.pumpAndSettle();
    expect(find.text('Apply Service'), findsNothing);
  });

  testWidgets('partial success keeps the dialog open with verified state', (
    tester,
  ) async {
    controller.result = const ServiceApplyResult(
      disposition: ServiceApplyDisposition.partial,
      errorMessage: 'startup failed: module unavailable',
      outcome: ServiceApplyOutcome(
        manifestChange: 'created',
        workloadAction: 'none',
        finalPhase: 'stopped',
      ),
    );
    await openDialog(tester);
    await tester.tap(find.widgetWithText(ChoiceChip, 'Recipe'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(FilledButton, 'Apply Here'));
    await tester.pumpAndSettle();
    expect(find.text('Apply Service'), findsOneWidget);
    expect(find.textContaining('definition applied, but'), findsOneWidget);
    expect(find.textContaining('Final state: stopped.'), findsOneWidget);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNotNull,
    );
  });

  testWidgets('ordinary apply forwards the entered instance name and target', (
    tester,
  ) async {
    final peer = DeviceInfo(peerId: 'peer-7', name: 'Desk');
    controller.addressBook.add(peer);
    await openDialog(tester);
    await tester.tap(find.widgetWithText(ChoiceChip, 'Remote'));
    await tester.pumpAndSettle();
    await tester.tap(find.widgetWithText(ChoiceChip, 'Recipe'));
    await tester.pumpAndSettle();
    expect(tester.widget<TextField>(find.byType(TextField)).readOnly, isFalse);
    await tester.enterText(find.byType(TextField), 'my-files');
    for (final chip in tester.widgetList<ChoiceChip>(find.byType(ChoiceChip))) {
      expect(chip.onSelected, isNotNull);
    }
    await tester.tap(find.widgetWithText(FilledButton, 'Apply to Device'));
    await tester.pumpAndSettle();
    expect(controller.requestedName, 'my-files');
    expect(controller.requestedPeer, 'peer-7');
    expect(controller.requestedStart, isFalse);
    expect(controller.applyCount, 1);
  });
}

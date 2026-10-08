import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fungi_app/app/models/daemon_compatibility.dart';
import 'package:fungi_app/app/models/service_apply_result.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pbgrpc.dart';
import 'package:fungi_app/ui/utils/service_apply_client.dart';
import 'package:grpc/grpc.dart';

class ApplyDaemon extends FungiDaemonServiceBase {
  final calls = <String>[];
  String manifestChange = 'created';
  String phaseAfterApply = 'stopped';
  String phaseAfterStart = 'running';
  String snapshotSource = 'live';
  String snapshotError = '';
  String? startFailure;
  bool inspectFailure = false;
  bool partialApply = false;
  bool malformedOutcome = false;
  PullServiceRequest? localRequest;
  RemotePullServiceRequest? remoteRequest;

  Map<String, dynamic> get outcome => {
    'manifest_change': manifestChange,
    'workload_action': 'none',
    'final_status': {'phase': phaseAfterApply},
    if (partialApply)
      'failure': {
        'stage': 'endpoint_listeners',
        'message': 'Address already in use',
      },
  };

  String instance(String phase) => jsonEncode({
    'id': 'wasmtime:files',
    'name': 'files',
    'runtime': 'wasmtime',
    'status': {'phase': phase},
  });

  void checkApply(ServiceCall call) {
    if (!partialApply) return;
    call.trailers!['grpc-status-details-bin'] = base64Encode(
      utf8.encode(
        jsonEncode({
          'ok': false,
          'service': {'name': 'files'},
          'apply_outcome': outcome,
          'error': {
            'code': 'partial_apply',
            'message': 'apply partly succeeded',
          },
        }),
      ),
    );
    throw GrpcError.internal('apply partly succeeded');
  }

  @override
  Future<ServiceInstanceResponse> pullService(
    ServiceCall call,
    PullServiceRequest request,
  ) async {
    calls.add('apply');
    localRequest = request;
    checkApply(call);
    return ServiceInstanceResponse(
      instanceJson: instance(phaseAfterApply),
      applyOutcomeJson: malformedOutcome ? '{broken' : jsonEncode(outcome),
    );
  }

  @override
  Future<RemoteServiceControlResponse> remotePullService(
    ServiceCall call,
    RemotePullServiceRequest request,
  ) async {
    calls.add('remote apply');
    remoteRequest = request;
    checkApply(call);
    return RemoteServiceControlResponse(
      serviceName: 'files',
      applyOutcomeJson: jsonEncode(outcome),
    );
  }

  @override
  Future<Empty> startService(
    ServiceCall call,
    ServiceNameRequest request,
  ) async {
    calls.add('start:${request.name}');
    if (startFailure != null) throw GrpcError.internal(startFailure!);
    return Empty();
  }

  @override
  Future<RemoteServiceControlResponse> remoteStartService(
    ServiceCall call,
    RemoteServiceNameRequest request,
  ) async {
    calls.add('remote start:${request.peerId}:${request.name}');
    if (startFailure != null) throw GrpcError.internal(startFailure!);
    return RemoteServiceControlResponse(serviceName: request.name);
  }

  @override
  Future<ServiceInstanceResponse> inspectService(
    ServiceCall call,
    ServiceNameRequest request,
  ) async {
    calls.add('inspect:${request.name}');
    if (inspectFailure) throw GrpcError.unavailable('inspection unavailable');
    return ServiceInstanceResponse(instanceJson: instance(phaseAfterStart));
  }

  @override
  Future<DeviceServiceSnapshotResponse> getDeviceServiceSnapshot(
    ServiceCall call,
    DeviceServiceSnapshotRequest request,
  ) async {
    calls.add('snapshot:${request.deviceId}:${request.refresh}');
    return DeviceServiceSnapshotResponse(
      source: snapshotSource,
      error: snapshotError,
      snapshotJson: jsonEncode({
        'services': [jsonDecode(instance(phaseAfterStart))],
      }),
    );
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  test('daemon compatibility is explicitly limited to 0.8.x', () {
    for (final version in ['0.8.0', 'v0.8.2', '0.8.0-nightly+abc']) {
      expect(DaemonCompatibility.supports(version), isTrue, reason: version);
    }
    for (final version in ['0.7.9', '0.9.0', '1.8.0', '0.8', 'unknown']) {
      expect(DaemonCompatibility.supports(version), isFalse, reason: version);
    }
  });

  late ApplyDaemon daemon;
  late Server server;
  late ClientChannel channel;
  late FungiDaemonClient client;
  setUp(() async {
    daemon = ApplyDaemon();
    server = Server.create(services: [daemon]);
    await server.serve(address: '127.0.0.1', port: 0);
    channel = ClientChannel(
      '127.0.0.1',
      port: server.port!,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    client = FungiDaemonClient(channel);
  });
  tearDown(() async {
    await channel.shutdown();
    await server.shutdown();
  });

  Future<ServiceApplyResult> apply({bool start = false, bool remote = false}) =>
      applyServiceManifest(
        client: client,
        manifestYaml: 'service manifest',
        manifestBaseDir: '/recipes/files',
        peerId: remote ? 'peer-1' : null,
        startAfterApply: start,
      );

  test(
    'apply alone preserves stopped state and manifest base directory',
    () async {
      final result = await apply();
      expect(result.isComplete, isTrue);
      expect(daemon.calls, ['apply']);
      expect(daemon.localRequest!.manifestBaseDir, '/recipes/files');
      expect(result.outcome!.finalPhase, 'stopped');
      expect(result.message, contains('Service created.'));
    },
  );

  test('apply and start verifies the final local state', () async {
    final result = await apply(start: true);
    expect(daemon.calls, ['apply', 'start:files', 'inspect:files']);
    expect(result.isComplete, isTrue);
    expect(result.outcome!.workloadAction, 'started');
    expect(result.outcome!.finalPhase, 'running');
  });

  test('unchanged running instance is not reported as restarted', () async {
    daemon.manifestChange = 'unchanged';
    daemon.phaseAfterApply = 'running';
    final result = await apply(start: true);
    expect(result.message, contains('definition unchanged'));
    expect(result.outcome!.workloadAction, 'none');
  });

  test('partial apply JSON survives the actual binary gRPC trailer', () async {
    daemon.partialApply = true;
    final result = await apply(start: true);
    expect(result.disposition, ServiceApplyDisposition.partial);
    expect(result.outcome!.failureStage, 'endpoint_listeners');
    expect(result.message, contains('Address already in use'));
    expect(daemon.calls, ['apply']);
  });

  test('remote partial apply also preserves the structured failure', () async {
    daemon.partialApply = true;
    final result = await apply(start: true, remote: true);
    expect(result.disposition, ServiceApplyDisposition.partial);
    expect(result.outcome!.failureMessage, 'Address already in use');
    expect(daemon.calls, ['remote apply']);
  });

  test('remote startup requires a fresh live snapshot', () async {
    final result = await apply(start: true, remote: true);
    expect(result.isComplete, isTrue);
    expect(daemon.remoteRequest!.peerId, 'peer-1');
    expect(daemon.remoteRequest!.manifestYaml, 'service manifest');
    expect(daemon.calls, [
      'remote apply',
      'remote start:peer-1:files',
      'snapshot:peer-1:true',
    ]);
  });

  for (final error in ['', 'device offline']) {
    test(
      'cached running snapshot cannot verify startup (error=$error)',
      () async {
        daemon.snapshotSource = 'cache';
        daemon.snapshotError = error;
        final result = await apply(start: true, remote: true);
        expect(result.disposition, ServiceApplyDisposition.partial);
        expect(result.outcome!.finalPhase, 'unknown');
        expect(result.message, contains('could not be verified'));
      },
    );
  }

  for (final remote in [false, true]) {
    test(
      'start failure retains apply and inspects state (remote=$remote)',
      () async {
        daemon.startFailure = 'module could not be started';
        daemon.phaseAfterStart = 'stopped';
        final result = await apply(start: true, remote: remote);
        expect(result.disposition, ServiceApplyDisposition.partial);
        expect(result.outcome!.manifestChange, 'created');
        expect(result.outcome!.finalPhase, 'stopped');
        expect(result.message, contains('startup failed'));
        expect(daemon.calls, hasLength(3));
      },
    );
  }

  test('successful start RPC without running state is partial', () async {
    daemon.phaseAfterStart = 'exited';
    final result = await apply(start: true);
    expect(result.disposition, ServiceApplyDisposition.partial);
    expect(result.message, contains('not running'));
  });

  test('failed inspection does not invent a running state', () async {
    daemon.inspectFailure = true;
    final result = await apply(start: true);
    expect(result.disposition, ServiceApplyDisposition.partial);
    expect(result.outcome!.finalPhase, 'unknown');
  });

  test(
    'invalid optional outcome falls back to generic successful apply',
    () async {
      daemon.malformedOutcome = true;
      final result = await apply();
      expect(result.isComplete, isTrue);
      expect(result.outcome, isNull);
      expect(result.message, 'Service applied.');
    },
  );

  test('invalid binary error details leave ordinary errors intact', () {
    final error = GrpcError.internal('original error', null, {
      'grpc-status-details-bin': 'not-base64!',
    });
    expect(decodePartialServiceApply(error), isNull);
    expect(serviceApplyErrorMessage(error), 'original error');
  });
}

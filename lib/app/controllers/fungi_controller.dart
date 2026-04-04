import 'dart:async';
import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fungi_app/app/foreground_task.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:fungi_app/ui/utils/daemon_client.dart';
import 'package:fungi_app/ui/utils/daemon_service_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart' as p;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

enum ThemeOption { light, dark, system }

extension ThemeOptionExtension on ThemeOption {
  String get name {
    switch (this) {
      case ThemeOption.light:
        return 'Light';
      case ThemeOption.dark:
        return 'Dark';
      case ThemeOption.system:
        return 'Follow System';
    }
  }

  ThemeMode get themeMode {
    switch (this) {
      case ThemeOption.light:
        return ThemeMode.light;
      case ThemeOption.dark:
        return ThemeMode.dark;
      case ThemeOption.system:
        return ThemeMode.system;
    }
  }
}

enum DaemonConnectionState { disabled, connecting, connected, failed }

extension DaemonConnectionStateExtension on DaemonConnectionState {
  bool get isDisabled => this == DaemonConnectionState.disabled;
  bool get isConnecting => this == DaemonConnectionState.connecting;
  bool get isConnected => this == DaemonConnectionState.connected;
  bool get isFailed => this == DaemonConnectionState.failed;
}

class FileTransferServerState {
  bool enabled;
  String? error;
  String? rootDir;

  FileTransferServerState({required this.enabled, this.error, this.rootDir});
}

class FungiController extends GetxController {
  FungiDaemonClient fungiClient;
  late final DaemonServiceManager daemonManager;

  final daemonConnectionState = DaemonConnectionState.disabled.obs;
  final daemonError = ''.obs;

  final peerId = ''.obs;
  final hostname = ''.obs;
  final configFilePath = ''.obs;
  final logDirPath = ''.obs;
  final isDaemonEnabled = false.obs;

  final _storage = GetStorage();
  final _themeKey = 'theme_option';
  final _daemonDisabledKey = 'daemon_disabled';

  final currentTheme = ThemeOption.system.obs;
  final preventClose = false.obs;
  final incomingAllowedPeers = <PeerInfo>[].obs;
  final addressBook = <PeerInfo>[].obs;
  final fileTransferServerState = FileTransferServerState(enabled: false).obs;
  final fileTransferClients = <FileTransferClient>[].obs;

  // TCP Tunneling state
  final tcpTunnelingConfig = TcpTunnelingConfigResponse().obs;
  final runtimeConfig = RuntimeConfigResponse().obs;
  final localServices = <LocalServiceView>[].obs;
  final peerCatalogServices = <String, List<RemoteServiceListEntryView>>{}.obs;
  final peerConnections = <String, List<ConnectionSnapshot>>{}.obs;

  final localServicesLoading = false.obs;
  final availableServicesLoading = false.obs;
  final nodeManagementLoading = false.obs;
  final localServicePendingActions = <String, String>{}.obs;

  final localServicesError = ''.obs;
  final availableServicesError = ''.obs;

  final ftpProxy = FtpProxyResponse(enabled: false, host: "", port: 0).obs;
  final webdavProxy = WebdavProxyResponse().obs;

  FungiController() : fungiClient = fungiDaemonClientPlaceholder() {
    daemonManager = DaemonServiceManager.create();
  }

  @override
  void onInit() {
    super.onInit();
    loadThemeOption();

    if (Platform.isAndroid) {
      FlutterForegroundTask.addTaskDataCallback(onReceiveTaskData);
      setDaemonProcessExitCallback(_onDaemonProcessExit);
    } else {
      setDesktopDaemonProcessExitCallback(_onDaemonProcessExit);
    }

    _initializeAndStartDaemon();
  }

  Future<void> _initializeAndStartDaemon() async {
    await loadDaemonEnabledState();

    if (isDaemonEnabled.value && !daemonManager.isRunning) {
      await startDaemon();
    } else if (isDaemonEnabled.value) {
      await initFungi();
    }
  }

  @override
  void onClose() {
    if (Platform.isAndroid) {
      FlutterForegroundTask.removeTaskDataCallback(onReceiveTaskData);
      setDaemonProcessExitCallback(null);
    } else {
      setDesktopDaemonProcessExitCallback(null);
    }
    super.onClose();
  }

  void _onDaemonProcessExit(int exitCode) {
    if (!isDaemonEnabled.value) {
      return;
    }

    unawaited(_handleDaemonProcessCrash(exitCode));
  }

  Future<void> _handleDaemonProcessCrash(int exitCode) async {
    await daemonManager.stop();
    isDaemonEnabled.value = false;
    saveDaemonEnabledState(false);
    daemonConnectionState.value = DaemonConnectionState.failed;
    daemonError.value = 'Daemon process crashed (exit code: $exitCode)';

    Get.snackbar(
      'Daemon crashed',
      'Daemon process exited with code $exitCode',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
    );
  }

  Future<void> toggleDaemon() async {
    if (isDaemonEnabled.value) {
      await stopDaemon();
    } else {
      await startDaemon();
    }
  }

  Future<void> startDaemon() async {
    try {
      // For Android, check notification permission before starting
      if (Platform.isAndroid) {
        final hasPermission = await _checkAndRequestNotificationPermission();
        if (!hasPermission) {
          // User cancelled or denied permission
          return;
        }
      }

      final success = await daemonManager.start();
      isDaemonEnabled.value = success;
      saveDaemonEnabledState(success);

      if (success) {
        await initFungi();
      } else {
        _setDaemonError('Failed to start daemon service');
      }
    } catch (e) {
      debugPrint('Failed to start daemon: $e');
      _setDaemonError(e.toString());
    }
  }

  /// Check and request notification permission for Android
  /// Returns true if permission is granted or user confirmed to proceed
  /// Returns false if user cancelled
  Future<bool> _checkAndRequestNotificationPermission() async {
    final notificationPermission =
        await FlutterForegroundTask.checkNotificationPermission();

    // If already granted, proceed directly
    if (notificationPermission == NotificationPermission.granted) {
      return true;
    }

    // Show dialog to inform user about notification permission
    bool? userConfirmed = await SmartDialog.show<bool>(
      builder: (context) {
        return AlertDialog(
          title: const Text('Notification Permission Required'),
          content: const Text(
            'Background service requires notification permission to run properly. '
            'Without this permission, the service may not work correctly.\n\n'
            'Please grant notification permission when prompted.',
          ),
          actions: [
            TextButton(
              onPressed: () => SmartDialog.dismiss(result: false),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => SmartDialog.dismiss(result: true),
              child: const Text('Continue'),
            ),
          ],
        );
      },
    );

    // User cancelled
    if (userConfirmed != true) {
      return false;
    }

    // Request permission
    await FlutterForegroundTask.requestNotificationPermission();

    // Return true to proceed even if permission is denied
    // The service might still work without notification
    return true;
  }

  void _setDaemonError(String error) {
    daemonConnectionState.value = DaemonConnectionState.failed;
    daemonError.value = error;
  }

  Future<void> stopDaemon() async {
    try {
      await daemonManager.stop();
      isDaemonEnabled.value = false;
      saveDaemonEnabledState(false);
      _clearDaemonState();
    } catch (e) {
      debugPrint('Failed to stop daemon: $e');
    }
  }

  void _clearDaemonState() {
    daemonConnectionState.value = DaemonConnectionState.disabled;
    daemonError.value = '';
    peerId.value = '';
    hostname.value = '';
    configFilePath.value = '';
    logDirPath.value = '';
  }

  String _deriveLogDirPath(String configPath) {
    if (configPath.isEmpty) {
      return '';
    }

    return p.join(File(configPath).parent.path, 'logs');
  }

  void saveDaemonEnabledState(bool enabled) {
    _storage.write(_daemonDisabledKey, !enabled);
  }

  Future<void> loadDaemonEnabledState() async {
    final savedState = _storage.read(_daemonDisabledKey);
    final isDisabled = savedState is bool ? savedState : false;
    final userWantsEnabled = !isDisabled;

    if (daemonManager is MobileDaemonServiceManager) {
      final manager = daemonManager as MobileDaemonServiceManager;
      final isRunning = await manager.isRunningAsync;

      // If service is running, enable it regardless of saved state
      // Otherwise, use the user's saved preference
      isDaemonEnabled.value = isRunning || userWantsEnabled;

      // Update daemon connection state based on service running state
      daemonConnectionState.value = isRunning
          ? DaemonConnectionState.connecting
          : DaemonConnectionState.disabled;
    } else {
      // Desktop platform
      isDaemonEnabled.value = userWantsEnabled;
    }
  }

  void loadThemeOption() {
    final savedTheme = _storage.read(_themeKey);
    if (savedTheme != null) {
      currentTheme.value = ThemeOption.values[savedTheme];
    }
  }

  void changeTheme(ThemeOption option) {
    currentTheme.value = option;
    Get.changeThemeMode(option.themeMode);
    _storage.write(_themeKey, option.index);
  }

  Future<void> updateIncomingAllowedPeers() async {
    incomingAllowedPeers.value = (await fungiClient.getIncomingAllowedPeers(
      Empty(),
    )).peers;
  }

  Future<void> updateAddressBook() async {
    addressBook.value = (await fungiClient.listAddressBookPeers(Empty())).peers;
  }

  Future<void> addIncomingAllowedPeer(PeerInfo peerInfo) async {
    await fungiClient.addIncomingAllowedPeer(
      AddIncomingAllowedPeerRequest()..peerId = peerInfo.peerId,
    );
    await updateIncomingAllowedPeers();
    // Also add to address books

    // Update the address books list to reflect the new peer
    await updateAddressBookPeer(peerInfo);
  }

  Future<void> removeIncomingAllowedPeer(String peerId) async {
    await fungiClient.removeIncomingAllowedPeer(
      RemoveIncomingAllowedPeerRequest()..peerId = peerId,
    );
    await updateIncomingAllowedPeers();
  }

  Future<void> updateAddressBookPeer(PeerInfo peerInfo) async {
    await fungiClient.updateAddressBookPeer(
      UpdateAddressBookPeerRequest()..peerInfo = peerInfo,
    );
    await updateAddressBook();
  }

  Future<PeerInfo?> getAddressBookPeer(String peerId) async {
    return (await fungiClient.getAddressBookPeer(
      GetAddressBookPeerRequest()..peerId = peerId,
    )).peerInfo;
  }

  Future<void> removeAddressBookPeer(String peerId) async {
    await fungiClient.removeAddressBookPeer(
      RemoveAddressBookPeerRequest()..peerId = peerId,
    );
    await updateAddressBook();
  }

  Future<void> startFileTransferServer(String rootDir) async {
    try {
      if (Platform.isAndroid) {
        final status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) {
          Get.snackbar(
            'Permission required',
            'Please try again and grant "Manage External Storage" permission to use File Transfer Server.',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.withValues(alpha: 0.1),
            colorText: Colors.red,
          );
          return;
        }
      }

      await fungiClient.startFileTransferService(
        StartFileTransferServiceRequest()..rootDir = rootDir,
      );
      fileTransferServerState.value.enabled = true;
      fileTransferServerState.value.error = null;
      debugPrint('File Transfer Server started');
    } catch (e) {
      fileTransferServerState.value.enabled = false;
      fileTransferServerState.value.error = e.toString();
      debugPrint('Failed to start File Transfer Server: $e');
    }
    fileTransferServerState.value.rootDir = rootDir;
    fileTransferServerState.refresh();
  }

  Future<void> stopFileTransferServer() async {
    try {
      await fungiClient.stopFileTransferService(Empty());
      fileTransferServerState.value.enabled = false;
      fileTransferServerState.value.error = null;
      debugPrint('File Transfer Server stopped');
    } catch (e) {
      fileTransferServerState.value.error = e.toString();
      debugPrint('Failed to stop File Transfer Server: $e');
    }
    fileTransferServerState.refresh();
  }

  Future<void> addFileTransferClient({
    required bool enabled,
    required PeerInfo peerInfo,
  }) async {
    await fungiClient.addFileTransferClient(
      AddFileTransferClientRequest()
        ..enabled = enabled
        ..name = peerInfo.alias
        ..peerId = peerInfo.peerId,
    );
    fileTransferClients.add(
      FileTransferClient(
        enabled: enabled,
        peerId: peerInfo.peerId,
        name: peerInfo.alias,
      ),
    );
    // add to address books
    await updateAddressBookPeer(peerInfo);
  }

  Future<void> enableFileTransferClient({
    required FileTransferClient client,
    required bool enabled,
  }) async {
    await fungiClient.enableFileTransferClient(
      EnableFileTransferClientRequest()
        ..peerId = client.peerId
        ..enabled = enabled,
    );

    final newClient = FileTransferClient(
      enabled: enabled,
      peerId: client.peerId,
      name: client.name,
    );

    final index = fileTransferClients.indexWhere(
      (c) => c.peerId == client.peerId,
    );
    if (index != -1) {
      fileTransferClients[index] = newClient;
    }
    debugPrint('File Transfer Client ${client.peerId} enabled: $enabled');
    fileTransferClients.refresh();
  }

  Future<void> removeFileTransferClient(String peerId) async {
    await fungiClient.removeFileTransferClient(
      RemoveFileTransferClientRequest()..peerId = peerId,
    );
    fileTransferClients.removeWhere((client) => client.peerId == peerId);
  }

  Future<void> initFungi() async {
    if (!isDaemonEnabled.value) {
      daemonConnectionState.value = DaemonConnectionState.disabled;
      daemonError.value = '';
      return;
    }

    daemonConnectionState.value = DaemonConnectionState.connecting;
    daemonError.value = '';

    for (int i = 0; i < 5; i++) {
      try {
        fungiClient = await getFungiClient();
        daemonConnectionState.value = DaemonConnectionState.connected;
        break;
      } catch (e) {
        if (i < 4) {
          debugPrint('Connection attempt ${i + 1} failed, retrying...');
          await Future.delayed(Duration(seconds: i + 1));
          continue;
        }
        debugPrint('Failed to connect to daemon after 5 attempts: $e');
        daemonConnectionState.value = DaemonConnectionState.failed;
        daemonError.value = e.toString();
        await _handleStartupFailureAndStopService(e.toString());
        return;
      }
    }

    if (daemonConnectionState.value != DaemonConnectionState.connected) {
      return;
    }

    try {
      peerId.value = (await fungiClient.peerId(Empty())).peerId;
      debugPrint('Peer ID: ${peerId.value}');

      hostname.value = (await fungiClient.hostname(Empty())).hostname;

      configFilePath.value = (await fungiClient.configFilePath(
        Empty(),
      )).configFilePath;
      logDirPath.value = _deriveLogDirPath(configFilePath.value);

      try {
        fileTransferServerState.value.enabled =
            (await fungiClient.getFileTransferServiceEnabled(Empty())).enabled;
        final dir = (await fungiClient.getFileTransferServiceRootDir(
          Empty(),
        )).rootDir;
        if (dir.isNotEmpty) {
          fileTransferServerState.value.rootDir = dir;
        } else {
          fileTransferServerState.value.rootDir = null;
        }
      } catch (e) {
        debugPrint('Failed to get file transfer server state: $e');
        fileTransferServerState.value.error = e.toString();
      }
      fileTransferServerState.refresh();

      try {
        final clients = (await fungiClient.getAllFileTransferClients(
          Empty(),
        )).clients;
        fileTransferClients.value = clients.toList();
      } catch (e) {
        debugPrint('Failed to get file transfer clients: $e');
        fileTransferClients.value = [];
      }

      try {
        ftpProxy.value = await fungiClient.getFtpProxy(Empty());
        webdavProxy.value = await fungiClient.getWebdavProxy(Empty());
      } catch (e) {
        debugPrint('Failed to get proxy infos: $e');
      }
      await updateIncomingAllowedPeers();
      await updateAddressBook();
      // Load TCP tunneling config
      await refreshTcpTunnelingConfig();
      await Future.wait([
        refreshLocalServicesData(),
        refreshAvailableServicesData(),
        refreshNodeManagementData(),
        refreshRuntimeConfig(),
      ]);
    } catch (e) {
      daemonConnectionState.value = DaemonConnectionState.failed;
      daemonError.value = e.toString();
      peerId.value = 'error';
      debugPrint('Failed to init, error: $e');
    }
  }

  Future<void> _handleStartupFailureAndStopService(String error) async {
    if (!Platform.isAndroid) return;

    try {
      await stopDaemon();
      Get.snackbar(
        'Daemon startup failed',
        'Foreground service has been stopped automatically.\n$error',
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 5),
      );
    } catch (e) {
      debugPrint('Failed to stop foreground service after startup failure: $e');
    }
  }

  Future<void> retryConnection() async {
    await initFungi();
  }

  // TCP Tunneling methods
  Future<void> refreshTcpTunnelingConfig() async {
    try {
      final config = await fungiClient.getTcpTunnelingConfig(Empty());
      tcpTunnelingConfig.value = config;
    } catch (e) {
      debugPrint('Failed to get TCP tunneling config: $e');
    }
  }

  Future<void> addTcpForwardingRule({
    required String localHost,
    required int localPort,
    required int remotePort,
    required PeerInfo peerInfo,
  }) async {
    try {
      await fungiClient.addTcpForwardingRule(
        AddTcpForwardingRuleRequest()
          ..localHost = localHost
          ..localPort = localPort
          ..peerId = peerInfo.peerId
          ..remotePort = remotePort,
      );
      await refreshTcpTunnelingConfig();

      // add to address books
      await updateAddressBookPeer(peerInfo);
      Get.snackbar(
        'Success',
        'Forwarding rule added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add forwarding rule: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> removeTcpForwardingRule({
    required String localHost,
    required int localPort,
    required String peerId,
    required int remotePort,
  }) async {
    try {
      await fungiClient.removeTcpForwardingRule(
        RemoveTcpForwardingRuleRequest()
          ..localHost = localHost
          ..localPort = localPort
          ..peerId = peerId
          ..remotePort = remotePort,
      );
      await refreshTcpTunnelingConfig();
      Get.snackbar(
        'Success',
        'Forwarding rule removed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to remove forwarding rule: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> addTcpListeningRule({
    required String localHost,
    required int localPort,
    required List<String> allowedPeers,
  }) async {
    try {
      await fungiClient.addTcpListeningRule(
        AddTcpListeningRuleRequest()
          ..localHost = localHost
          ..localPort = localPort
          ..allowedPeers.addAll(allowedPeers),
      );
      await refreshTcpTunnelingConfig();
      Get.snackbar(
        'Success',
        'Listening rule added successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add listening rule: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> removeTcpListeningRule({
    required String localHost,
    required int localPort,
  }) async {
    try {
      await fungiClient.removeTcpListeningRule(
        RemoveTcpListeningRuleRequest()
          ..localHost = localHost
          ..localPort = localPort,
      );
      await refreshTcpTunnelingConfig();
      Get.snackbar(
        'Success',
        'Listening rule removed successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withValues(alpha: 0.1),
        colorText: Colors.green,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to remove listening rule: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withValues(alpha: 0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> refreshRuntimeConfig() async {
    try {
      runtimeConfig.value = await fungiClient.getRuntimeConfig(Empty());
    } catch (e) {
      debugPrint('Failed to get runtime config: $e');
    }
  }

  Future<void> refreshLocalServicesPageData() async {
    await Future.wait([
      refreshLocalServicesData(),
      refreshRuntimeConfig(),
      updateIncomingAllowedPeers(),
    ]);
  }

  Future<void> refreshLocalServicesData() async {
    localServicesLoading.value = true;
    localServicesError.value = '';

    try {
      final response = await fungiClient.listServices(Empty());
      localServices.value = decodeJsonStringList(
        response.servicesJson,
        LocalServiceView.fromJson,
      );
    } catch (e) {
      localServicesError.value = 'Failed to load local services: $e';
      debugPrint(localServicesError.value);
    } finally {
      localServicesLoading.value = false;
    }
  }

  Future<void> refreshAvailableServicesData() async {
    availableServicesLoading.value = true;
    availableServicesError.value = '';

    try {
      final accessResponse = await fungiClient.listServiceAccesses(
        ListServiceAccessesRequest(),
      );
      final attachedAccesses = decodeJsonStringList(
        accessResponse.serviceAccessesJson,
        (json) => json,
      );
      final accessByService = <String, Map<String, dynamic>>{};
      for (final access in attachedAccesses) {
        final peerId = access['peer_id'] as String? ?? '';
        final serviceId = access['service_id'] as String? ?? '';
        if (peerId.isEmpty || serviceId.isEmpty) {
          continue;
        }
        accessByService['$peerId::$serviceId'] = access;
      }

      final next = <String, List<RemoteServiceListEntryView>>{};
      for (final peer in addressBook) {
        try {
          final catalogResponse = await fungiClient.listPeerCatalog(
            ListPeerCatalogRequest()..peerId = peer.peerId,
          );
          final services = decodeJsonStringList(catalogResponse.servicesJson, (
            serviceJson,
          ) {
            final serviceId = serviceJson['service_id'] as String? ?? '';
            final access = accessByService['${peer.peerId}::$serviceId'];

            return RemoteServiceListEntryView.fromJson({
              'display_name': serviceJson['display_name'],
              'service_name': serviceJson['service_name'],
              'runtime': serviceJson['runtime']?.toString(),
              'transport': serviceJson['transport'],
              'usage': serviceJson['usage'],
              'state':
                  (serviceJson['status'] as Map<String, dynamic>?)?['state'],
              'running':
                  (serviceJson['status'] as Map<String, dynamic>?)?['running'],
              'published': true,
              'service_id': serviceId,
              'access_attached': access != null,
              'catalog_id': serviceJson['catalog_id'],
              'icon_url': serviceJson['icon_url'],
              'published_endpoints': serviceJson['endpoints'] ?? const [],
              'local_access_endpoints': access?['endpoints'] ?? const [],
            });
          });
          next[peer.peerId] = services;
        } catch (e) {
          debugPrint('Failed to load peer catalog for ${peer.peerId}: $e');
          next[peer.peerId] = const [];
        }
      }
      peerCatalogServices.value = next;
    } catch (e) {
      availableServicesError.value = 'Failed to load available services: $e';
      debugPrint(availableServicesError.value);
    } finally {
      availableServicesLoading.value = false;
    }
  }

  Future<void> refreshNodeManagementData() async {
    nodeManagementLoading.value = true;

    try {
      await updateAddressBook();
      final response = await fungiClient.listConnections(
        ListConnectionsRequest(),
      );
      final grouped = <String, List<ConnectionSnapshot>>{};
      for (final connection in response.connections) {
        grouped.putIfAbsent(connection.peerId, () => []).add(connection);
      }
      peerConnections.value = grouped;
      await refreshAvailableServicesData();
    } catch (e) {
      debugPrint('Failed to refresh node management data: $e');
    } finally {
      nodeManagementLoading.value = false;
    }
  }

  List<PeerServicesSectionView> get availableServiceSections {
    return addressBook
        .map(
          (peer) => PeerServicesSectionView(
            peerId: peer.peerId,
            alias: peer.alias,
            hostname: peer.hostname,
            services: peerCatalogServices[peer.peerId] ?? const [],
          ),
        )
        .where((section) => section.services.isNotEmpty)
        .toList(growable: false);
  }

  List<RemoteServiceListEntryView> servicesForPeer(String peerId) {
    return peerCatalogServices[peerId] ?? const [];
  }

  RemoteServiceListEntryView? catalogServiceForPeer(
    String peerId,
    String serviceId,
  ) {
    final services = servicesForPeer(peerId);
    for (final service in services) {
      if (service.serviceId == serviceId) {
        return service;
      }
    }
    return null;
  }

  Future<void> attachCatalogServiceAccess({
    required String peerId,
    required String serviceId,
  }) async {
    try {
      await fungiClient.attachServiceAccess(
        AttachServiceAccessRequest()
          ..peerId = peerId
          ..serviceId = serviceId,
      );
      await refreshAvailableServicesData();
      Get.snackbar('Success', 'Local access attached');
    } catch (e) {
      Get.snackbar('Attach failed', '$e');
    }
  }

  Future<void> detachCatalogServiceAccess({
    required String peerId,
    required String serviceId,
  }) async {
    try {
      await fungiClient.detachServiceAccess(
        DetachServiceAccessRequest()
          ..peerId = peerId
          ..serviceId = serviceId,
      );
      await refreshAvailableServicesData();
      Get.snackbar('Success', 'Local access detached');
    } catch (e) {
      Get.snackbar('Detach failed', '$e');
    }
  }

  Future<void> openCatalogWebService({
    required String peerId,
    required String serviceId,
  }) async {
    try {
      var service = catalogServiceForPeer(peerId, serviceId);
      if (service == null) {
        throw Exception('Service not found in current catalog');
      }
      if (!service.isWeb) {
        throw Exception('Only web services can be opened in the browser');
      }

      if (!service.accessAttached) {
        await fungiClient.attachServiceAccess(
          AttachServiceAccessRequest()
            ..peerId = peerId
            ..serviceId = serviceId,
        );
        await refreshAvailableServicesData();
        service = catalogServiceForPeer(peerId, serviceId);
        if (service == null) {
          throw Exception('Failed to refresh local access state');
        }
      }

      final uri = catalogWebLaunchUri(service);
      if (uri == null) {
        throw Exception('No local web endpoint available');
      }

      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        throw Exception('Browser launch request was rejected');
      }
    } catch (e) {
      Get.snackbar('Open failed', '$e');
    }
  }

  Uri? catalogWebLaunchUri(RemoteServiceListEntryView service) {
    if (!service.isWeb || service.localAccessEndpoints.isEmpty) {
      return null;
    }

    final endpoint = service.localAccessEndpoints.first;
    final path = service.usagePath;
    final normalizedPath = path == null || path.isEmpty
        ? '/'
        : (path.startsWith('/') ? path : '/$path');

    return Uri(
      scheme: 'http',
      host: endpoint.localHost,
      port: endpoint.localPort,
      path: normalizedPath,
    );
  }

  List<ConnectionSnapshot> connectionsForPeer(String peerId) {
    return peerConnections[peerId] ?? const [];
  }

  int? bestLatencyForPeer(String peerId) {
    final values = connectionsForPeer(peerId)
        .where((connection) => connection.hasLastRttMs())
        .map((connection) => connection.lastRttMs.toInt())
        .toList();
    if (values.isEmpty) {
      return null;
    }
    values.sort();
    return values.first;
  }

  Future<void> pullLocalServiceFromPath(String manifestPath) async {
    try {
      final file = File(manifestPath);
      if (!await file.exists()) {
        throw Exception('Manifest file not found: $manifestPath');
      }

      final manifestYaml = await file.readAsString();
      await fungiClient.pullService(
        PullServiceRequest()
          ..manifestYaml = manifestYaml
          ..manifestBaseDir = file.parent.path,
      );
      await refreshLocalServicesPageData();
      await refreshNodeManagementData();
      Get.snackbar('Success', 'Service pulled successfully');
    } catch (e) {
      Get.snackbar('Pull failed', '$e');
    }
  }

  Future<void> addRuntimeAllowedHostPath(String path) async {
    try {
      await fungiClient.addRuntimeAllowedHostPath(
        RuntimeAllowedHostPathRequest()..path = path,
      );
      await refreshRuntimeConfig();
      Get.snackbar('Success', 'Allowed path added');
    } catch (e) {
      Get.snackbar('Update failed', '$e');
    }
  }

  Future<void> removeRuntimeAllowedHostPath(String path) async {
    try {
      await fungiClient.removeRuntimeAllowedHostPath(
        RuntimeAllowedHostPathRequest()..path = path,
      );
      await refreshRuntimeConfig();
      Get.snackbar('Success', 'Allowed path removed');
    } catch (e) {
      Get.snackbar('Update failed', '$e');
    }
  }

  Future<void> addRuntimeAllowedPort(int port) async {
    try {
      await fungiClient.addRuntimeAllowedPort(
        RuntimeAllowedPortRequest()..port = port,
      );
      await refreshRuntimeConfig();
      Get.snackbar('Success', 'Allowed port added');
    } catch (e) {
      Get.snackbar('Update failed', '$e');
    }
  }

  Future<void> removeRuntimeAllowedPort(int port) async {
    try {
      await fungiClient.removeRuntimeAllowedPort(
        RuntimeAllowedPortRequest()..port = port,
      );
      await refreshRuntimeConfig();
      Get.snackbar('Success', 'Allowed port removed');
    } catch (e) {
      Get.snackbar('Update failed', '$e');
    }
  }

  Future<void> addRuntimeAllowedPortRange(int start, int end) async {
    try {
      await fungiClient.addRuntimeAllowedPortRange(
        RuntimeAllowedPortRangeRequest()
          ..start = start
          ..end = end,
      );
      await refreshRuntimeConfig();
      Get.snackbar('Success', 'Allowed port range added');
    } catch (e) {
      Get.snackbar('Update failed', '$e');
    }
  }

  Future<void> removeRuntimeAllowedPortRange(int start, int end) async {
    try {
      await fungiClient.removeRuntimeAllowedPortRange(
        RuntimeAllowedPortRangeRequest()
          ..start = start
          ..end = end,
      );
      await refreshRuntimeConfig();
      Get.snackbar('Success', 'Allowed port range removed');
    } catch (e) {
      Get.snackbar('Update failed', '$e');
    }
  }

  Future<void> startLocalService(String name) async {
    localServicePendingActions[name] = 'start';
    localServicePendingActions.refresh();
    try {
      await fungiClient.startService(ServiceNameRequest()..name = name);
      await refreshLocalServicesPageData();
      await refreshTcpTunnelingConfig();
      Get.snackbar('Success', 'Service started');
    } catch (e) {
      Get.snackbar('Start failed', '$e');
    } finally {
      localServicePendingActions.remove(name);
      localServicePendingActions.refresh();
    }
  }

  Future<void> stopLocalService(String name) async {
    localServicePendingActions[name] = 'stop';
    localServicePendingActions.refresh();
    try {
      await fungiClient.stopService(ServiceNameRequest()..name = name);
      await refreshLocalServicesPageData();
      await refreshTcpTunnelingConfig();
      Get.snackbar('Success', 'Service stopped');
    } catch (e) {
      Get.snackbar('Stop failed', '$e');
    } finally {
      localServicePendingActions.remove(name);
      localServicePendingActions.refresh();
    }
  }

  Future<void> removeLocalService(String name) async {
    localServicePendingActions[name] = 'remove';
    localServicePendingActions.refresh();
    try {
      await fungiClient.removeService(ServiceNameRequest()..name = name);
      await refreshLocalServicesPageData();
      await refreshTcpTunnelingConfig();
      Get.snackbar('Success', 'Service removed');
    } catch (e) {
      Get.snackbar('Remove failed', '$e');
    } finally {
      localServicePendingActions.remove(name);
      localServicePendingActions.refresh();
    }
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fungi_app/app/build_info.dart';
import 'package:fungi_app/app/foreground_task.dart';
import 'package:fungi_app/app/launch_at_login_manager.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pbgrpc.dart';
import 'package:fungi_app/ui/pages/settings/relay_settings_dialog.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:fungi_app/ui/utils/daemon_client.dart';
import 'package:fungi_app/ui/utils/daemon_service_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path/path.dart' as p;
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

enum StartupPrivacyNoticeAction { continueLaunch, openRelaySettings }

class ExistingDaemonCheckResult {
  const ExistingDaemonCheckResult._({
    required this.isFound,
    required this.isCompatible,
    this.version = '',
  });

  const ExistingDaemonCheckResult.absent()
    : this._(isFound: false, isCompatible: false);

  const ExistingDaemonCheckResult.compatible(String version)
    : this._(isFound: true, isCompatible: true, version: version);

  const ExistingDaemonCheckResult.incompatible(String version)
    : this._(isFound: true, isCompatible: false, version: version);

  final bool isFound;
  final bool isCompatible;
  final String version;
}

class FungiController extends GetxController {
  static const documentationUrl = 'https://fungi.rs/docs/intro';
  static const daemonDisabledStorageKey = 'daemon_disabled';
  static const _recipeRequestTimeout = Duration(seconds: 20);
  static const _peerCatalogRequestTimeout = Duration(seconds: 10);
  static const _remotePeerServicesRequestTimeout = Duration(seconds: 8);

  FungiDaemonClient fungiClient;
  late final DaemonServiceManager daemonManager;

  final daemonConnectionState = DaemonConnectionState.disabled.obs;
  final daemonError = ''.obs;
  final connectedDaemonVersion = ''.obs;
  final connectedDaemonBuildDetails = ''.obs;
  final appVersion = '0.6.1'.obs;
  final appBuildVersion = ''.obs;
  final appBuildDetails = ''.obs;

  final peerId = ''.obs;
  final hostname = ''.obs;
  final configFilePath = ''.obs;
  final logDirPath = ''.obs;
  final isDaemonEnabled = false.obs;
  final daemonManagedExternally = false.obs;

  final _storage = GetStorage();
  final _themeKey = 'theme_option';
  final _daemonDisabledKey = daemonDisabledStorageKey;
  final _launchAtLoginHideToTrayKey = LaunchAtLoginManager.hideToTrayStorageKey;
  final _startupNoticeVersionKey = 'startup_notice_version';
  static const _startupNoticeCurrentVersion = 'relay-privacy-v1';
  static const _defaultAppVersion = '0.6.1';

  final currentTheme = ThemeOption.system.obs;
  final preventClose = false.obs;
  final launchAtLoginSupported = false.obs;
  final launchAtLoginEnabled = false.obs;
  final launchAtLoginRequiresApproval = false.obs;
  final launchAtLoginHideToTray = true.obs;
  final launchAtLoginLoading = false.obs;
  final trustedDevices = <DeviceInfo>[].obs;
  final addressBook = <DeviceInfo>[].obs;
  final runtimeConfig = RuntimeConfigResponse().obs;
  final localServices = <LocalServiceView>[].obs;
  final peerCatalogServices = <String, List<RemoteServiceListEntryView>>{}.obs;
  final peerManagedServices = <String, List<LocalServiceView>>{}.obs;
  final peerManagedServicesLoading = <String, bool>{}.obs;
  final peerManagedServicesErrors = <String, String>{}.obs;
  final peerConnections = <String, List<ConnectionSnapshot>>{}.obs;

  final localServicesLoading = false.obs;
  final availableServicesLoading = false.obs;
  final nodeManagementLoading = false.obs;
  final localServicePendingActions = <String, String>{}.obs;
  final remoteServicePendingActions = <String, String>{}.obs;

  final localServicesError = ''.obs;
  final availableServicesError = ''.obs;
  final relayConfig = const RelayConfigView.empty().obs;
  final relayConfigLoading = false.obs;
  final relayConfigError = ''.obs;
  final relayConfigNotice = ''.obs;

  FungiController() : fungiClient = fungiDaemonClientPlaceholder() {
    daemonManager = DaemonServiceManager.create();
  }

  @override
  void onInit() {
    super.onInit();
    loadThemeOption();
    loadLaunchAtLoginHideToTray();

    if (Platform.isAndroid) {
      FlutterForegroundTask.addTaskDataCallback(onReceiveTaskData);
      setDaemonProcessExitCallback(_onDaemonProcessExit);
    } else {
      setDesktopDaemonProcessExitCallback(_onDaemonProcessExit);
    }

    _initializeAppVersionAndDaemon();
    unawaited(loadLaunchAtLoginStatus());
  }

  Future<void> _initializeAppVersionAndDaemon() async {
    await _loadAppVersion();
    await _initializeAndStartDaemon();
  }

  Future<void> _initializeAndStartDaemon() async {
    await loadDaemonEnabledState();

    if (isDaemonEnabled.value && !daemonManager.isRunning) {
      await startDaemon();
    } else if (isDaemonEnabled.value) {
      await initFungi();
    } else {
      await refreshRelayConfig();
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
      if (daemonManagedExternally.value) {
        await disconnectDaemonSession();
        return;
      }
      await stopDaemon();
    } else {
      await startDaemon(showPrivacyNotice: true);
    }
  }

  Future<void> startDaemon({bool showPrivacyNotice = false}) async {
    try {
      daemonError.value = '';

      final existingDaemon = await _checkExistingDaemonCompatibility();
      if (existingDaemon.isCompatible) {
        isDaemonEnabled.value = true;
        saveDaemonEnabledState(true);
        daemonManagedExternally.value = true;
        connectedDaemonVersion.value = existingDaemon.version;
        await initFungi();
        return;
      }

      if (existingDaemon.isFound) {
        final message = _buildIncompatibleDaemonMessage(existingDaemon.version);
        isDaemonEnabled.value = false;
        saveDaemonEnabledState(false);
        daemonManagedExternally.value = false;
        daemonConnectionState.value = DaemonConnectionState.disabled;
        daemonError.value = message;
        if (showPrivacyNotice) {
          await _showIncompatibleDaemonDialog(existingDaemon.version);
        }
        return;
      }

      if (showPrivacyNotice) {
        final shouldContinue = await _maybeShowStartupPrivacyNotice();
        if (!shouldContinue) {
          return;
        }
      }

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
      daemonManagedExternally.value = false;
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
      if (daemonManagedExternally.value) {
        await disconnectDaemonSession();
        return;
      }

      await daemonManager.stop();
      isDaemonEnabled.value = false;
      saveDaemonEnabledState(false);
      daemonManagedExternally.value = false;
      _clearDaemonState();
      await refreshRelayConfig();
    } catch (e) {
      debugPrint('Failed to stop daemon: $e');
    }
  }

  Future<void> disconnectDaemonSession() async {
    isDaemonEnabled.value = false;
    saveDaemonEnabledState(false);
    daemonManagedExternally.value = false;
    _clearDaemonState();
    await refreshRelayConfig();
  }

  Future<void> restartDaemon() async {
    if (daemonManagedExternally.value) {
      Get.snackbar(
        'Restart required',
        'Connected daemon is managed outside the app. Please restart it manually.',
      );
      return;
    }

    final wasEnabled = isDaemonEnabled.value;
    if (!wasEnabled) {
      return;
    }

    await stopDaemon();
    isDaemonEnabled.value = true;
    saveDaemonEnabledState(true);
    await startDaemon();
  }

  void _clearDaemonState() {
    daemonConnectionState.value = DaemonConnectionState.disabled;
    daemonError.value = '';
    connectedDaemonVersion.value = '';
    connectedDaemonBuildDetails.value = '';
    peerId.value = '';
    hostname.value = '';
    configFilePath.value = '';
    logDirPath.value = '';
  }

  String get daemonLifecycleLabel {
    if (!isDaemonEnabled.value || daemonConnectionState.value.isDisabled) {
      return 'Disconnected';
    }
    return daemonManagedExternally.value
        ? 'User-managed daemon'
        : 'App-managed daemon';
  }

  String get daemonSessionSummary {
    if (daemonManagedExternally.value) {
      final version = connectedDaemonVersion.value.trim();
      return version.isEmpty
          ? 'Connected to a daemon started outside the app.'
          : 'Connected to an external daemon ($version).';
    }

    return 'The app starts and stops this daemon session.';
  }

  String get minimumCompatibleDaemonVersion {
    final version = appVersion.value.trim();
    if (version.isEmpty) {
      return _defaultAppVersion;
    }

    return version.split('+').first;
  }

  bool get canStopDaemon =>
      isDaemonEnabled.value && !daemonManagedExternally.value;

  bool get canDisconnectDaemonSession =>
      isDaemonEnabled.value && daemonManagedExternally.value;

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

  void loadLaunchAtLoginHideToTray() {
    final saved = _storage.read(_launchAtLoginHideToTrayKey);
    launchAtLoginHideToTray.value = saved is bool ? saved : true;
  }

  Future<void> setLaunchAtLoginHideToTray(bool enabled) async {
    launchAtLoginHideToTray.value = enabled;
    await _storage.write(_launchAtLoginHideToTrayKey, enabled);

    if (Platform.isWindows && launchAtLoginEnabled.value) {
      await setLaunchAtLoginEnabled(true);
    }
  }

  Future<void> loadLaunchAtLoginStatus() async {
    if (!LaunchAtLoginManager.isSupportedPlatform) {
      launchAtLoginSupported.value = false;
      launchAtLoginEnabled.value = false;
      launchAtLoginRequiresApproval.value = false;
      return;
    }

    launchAtLoginLoading.value = true;

    try {
      final status = await LaunchAtLoginManager.getStatus();
      launchAtLoginSupported.value = status.supported;
      launchAtLoginEnabled.value = status.enabled;
      launchAtLoginRequiresApproval.value = status.requiresApproval;
    } catch (e) {
      launchAtLoginSupported.value = false;
      launchAtLoginEnabled.value = false;
      launchAtLoginRequiresApproval.value = false;
      debugPrint('Failed to load launch-at-login status: $e');
    } finally {
      launchAtLoginLoading.value = false;
    }
  }

  Future<void> setLaunchAtLoginEnabled(bool enabled) async {
    if (!LaunchAtLoginManager.isSupportedPlatform ||
        launchAtLoginLoading.value) {
      return;
    }

    launchAtLoginLoading.value = true;

    try {
      final status = await LaunchAtLoginManager.setEnabled(
        enabled,
        hideToTray: launchAtLoginHideToTray.value,
      );
      launchAtLoginSupported.value = status.supported;
      launchAtLoginEnabled.value = status.enabled;
      launchAtLoginRequiresApproval.value = status.requiresApproval;

      if (enabled && status.requiresApproval) {
        SmartDialog.showToast(
          'macOS requires approval in System Settings > General > Login Items.',
        );
      }
    } catch (e) {
      debugPrint('Failed to update launch-at-login status: $e');
      SmartDialog.showToast('Failed to update launch at login: $e');
      await loadLaunchAtLoginStatus();
    } finally {
      launchAtLoginLoading.value = false;
    }
  }

  Future<void> updateTrustedDevices() async {
    trustedDevices.value = (await fungiClient.listTrustedDevices(
      Empty(),
    )).devices;
  }

  Future<void> updateAddressBook() async {
    addressBook.value = (await fungiClient.listDevices(Empty())).devices;
  }

  Future<void> addTrustedDevice(DeviceInfo peerInfo) async {
    await fungiClient.trustDevice(
      TrustDeviceRequest()..peerId = peerInfo.peerId,
    );

    try {
      // Persist the chosen device metadata before refreshing the trusted list
      // so the UI snapshots the latest saved name/hostname in one pass.
      await persistDeviceMetadata(peerInfo);
    } catch (e) {
      await updateTrustedDevices();
      Get.snackbar(
        'Trusted with incomplete details',
        'Device trust succeeded, but saving its details failed: $e',
      );
      return;
    }

    try {
      await Future.wait([updateAddressBook(), updateTrustedDevices()]);
    } catch (e) {
      Get.snackbar(
        'Trusted device saved',
        'Device was trusted and its details were saved, but refreshing the lists failed: $e',
      );
    }
  }

  Future<void> removeTrustedDevice(String peerId) async {
    await fungiClient.untrustDevice(UntrustDeviceRequest()..peerId = peerId);
    await updateTrustedDevices();
  }

  Future<void> persistDeviceMetadata(DeviceInfo peerInfo) async {
    await fungiClient.updateDevice(UpdateDeviceRequest()..device = peerInfo);
  }

  Future<void> updateAddressBookPeer(DeviceInfo peerInfo) async {
    await persistDeviceMetadata(peerInfo);
    await updateAddressBook();
  }

  Future<void> saveAddressBookPeer(DeviceInfo peerInfo) async {
    try {
      await updateAddressBookPeer(peerInfo);
      await refreshNodeManagementData();
      Get.snackbar('Success', 'Node saved');
    } catch (e) {
      Get.snackbar('Save failed', '$e');
    }
  }

  Future<DeviceInfo?> getAddressBookPeer(String peerId) async {
    return (await fungiClient.getDevice(
      GetDeviceRequest()..peerId = peerId,
    )).device;
  }

  Future<void> removeAddressBookPeer(String peerId) async {
    await fungiClient.removeDevice(RemoveDeviceRequest()..peerId = peerId);
    await updateAddressBook();
  }

  Future<void> deletePeer(String peerId) async {
    try {
      await refreshPeerManagedServicesData(peerId: peerId);
      final managedServices = managedServicesForPeer(peerId);
      if (managedServices.isNotEmpty) {
        throw Exception('Peer still has ${managedServices.length} service(s)');
      }

      await removeAddressBookPeer(peerId);
      final nextManagedServices = Map<String, List<LocalServiceView>>.from(
        peerManagedServices,
      )..remove(peerId);
      peerManagedServices.value = nextManagedServices;

      final nextManagedServicesLoading = Map<String, bool>.from(
        peerManagedServicesLoading,
      )..remove(peerId);
      peerManagedServicesLoading.value = nextManagedServicesLoading;

      final nextManagedServicesErrors = Map<String, String>.from(
        peerManagedServicesErrors,
      )..remove(peerId);
      peerManagedServicesErrors.value = nextManagedServicesErrors;

      final nextConnections = Map<String, List<ConnectionSnapshot>>.from(
        peerConnections,
      )..remove(peerId);
      peerConnections.value = nextConnections;

      await refreshAvailableServicesData();
      Get.snackbar('Success', 'Peer deleted');
    } catch (e) {
      Get.snackbar('Delete failed', '$e');
      rethrow;
    }
  }

  Future<List<DeviceInfo>> listMdnsPeers() async {
    final response = await fungiClient.listMdnsDevices(Empty());
    return response.devices;
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
        final daemonVersionResponse = await fungiClient.version(Empty());
        final daemonVersion = daemonVersionResponse.version;
        if (!_isCompatibleDaemonVersion(daemonVersion)) {
          throw StateError(_buildIncompatibleDaemonMessage(daemonVersion));
        }
        connectedDaemonVersion.value = daemonVersion;
        connectedDaemonBuildDetails.value = _buildDaemonDetailsLabel(
          daemonVersionResponse,
        );
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
      await updateTrustedDevices();
      await updateAddressBook();
      await refreshRelayConfig();
      await Future.wait([
        refreshLocalServicesData(),
        refreshAvailableServicesData(cached: true),
        refreshPeerManagedServicesData(cached: true),
        refreshNodeManagementData(refreshManagedServices: false),
        refreshRuntimeConfig(),
      ]);
      _refreshPeerManagedServicesInBackground();
    } catch (e) {
      daemonConnectionState.value = DaemonConnectionState.failed;
      daemonError.value = e.toString();
      peerId.value = 'error';
      debugPrint('Failed to init, error: $e');
    }
  }

  Future<void> refreshRelayConfig() async {
    relayConfigLoading.value = true;
    relayConfigError.value = '';
    relayConfigNotice.value = '';

    try {
      if (daemonConnectionState.value.isConnected) {
        try {
          final response = await fungiClient.getRelayConfig(Empty());
          relayConfig.value = RelayConfigView(
            relayEnabled: response.relayEnabled,
            useCommunityRelays: response.useCommunityRelays,
            customRelayAddresses: response.customRelayAddresses.toList(
              growable: false,
            ),
            effectiveRelayAddresses: response.effectiveRelayAddresses
                .map(
                  (entry) => RelayEffectiveAddressView(
                    address: entry.address,
                    source: entry.source,
                  ),
                )
                .toList(growable: false),
          );
        } catch (error) {
          if (!_isUnimplementedGrpcError(error)) {
            rethrow;
          }

          relayConfig.value = await _readRelayConfigFromCli();
          relayConfigNotice.value =
              'This daemon does not expose relay settings over gRPC yet. Showing local config only.';
        }
      } else {
        relayConfig.value = await _readRelayConfigFromCli();
      }
    } catch (e) {
      relayConfigError.value = _friendlyRelayFailureMessage(e);
      debugPrint(relayConfigError.value);
    } finally {
      relayConfigLoading.value = false;
    }
  }

  Future<void> setRelayEnabled(bool enabled) async {
    await _applyRelayConfigChange(
      onlineAction: () =>
          fungiClient.setRelayEnabled(RelayEnabledRequest()..enabled = enabled),
      offlineArgs: [
        enabled ? 'relay' : 'relay',
        enabled ? 'enable' : 'disable',
      ],
      successMessage: enabled ? 'Relay enabled' : 'Relay disabled',
    );
  }

  Future<void> setUseCommunityRelays(bool enabled) async {
    await _applyRelayConfigChange(
      onlineAction: () => fungiClient.setUseCommunityRelays(
        UseCommunityRelaysRequest()..enabled = enabled,
      ),
      offlineArgs: ['relay', 'use-community', enabled ? 'on' : 'off'],
      successMessage: enabled
          ? 'Community relay enabled'
          : 'Community relay disabled',
    );
  }

  Future<void> addCustomRelayAddress(String address) async {
    await _applyRelayConfigChange(
      onlineAction: () => fungiClient.addCustomRelayAddress(
        RelayAddressRequest()..address = address,
      ),
      offlineArgs: ['relay', 'add', address],
      successMessage: 'Custom relay added',
    );
  }

  Future<void> removeCustomRelayAddress(String address) async {
    await _applyRelayConfigChange(
      onlineAction: () => fungiClient.removeCustomRelayAddress(
        RelayAddressRequest()..address = address,
      ),
      offlineArgs: ['relay', 'remove', address],
      successMessage: 'Custom relay removed',
    );
  }

  Future<void> _applyRelayConfigChange({
    required Future<dynamic> Function() onlineAction,
    required List<String> offlineArgs,
    required String successMessage,
  }) async {
    try {
      var usedCliFallback = false;
      if (daemonConnectionState.value.isConnected) {
        try {
          await onlineAction();
        } catch (error) {
          if (!_isUnimplementedGrpcError(error)) {
            rethrow;
          }

          usedCliFallback = true;
          await _runRelayCliCommand(offlineArgs);
        }
      } else {
        await _runRelayCliCommand(offlineArgs);
      }
      await refreshRelayConfig();
      Get.snackbar(
        successMessage,
        usedCliFallback
            ? 'Relay config saved through the local config file. Restart the daemon to apply changes.'
            : 'Relay config updated. Restart daemon to fully apply changes.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar('Relay update failed', _friendlyRelayFailureMessage(e));
    }
  }

  Future<void> openRelaySettingsDialog() async {
    await refreshRelayConfig();
  }

  Future<ExistingDaemonCheckResult> _checkExistingDaemonCompatibility() async {
    final client = await tryGetFungiClient();
    if (client == null) {
      return const ExistingDaemonCheckResult.absent();
    }

    try {
      final version = (await client.version(Empty())).version;
      if (_isCompatibleDaemonVersion(version)) {
        return ExistingDaemonCheckResult.compatible(version);
      }

      return ExistingDaemonCheckResult.incompatible(version);
    } catch (_) {
      return const ExistingDaemonCheckResult.absent();
    }
  }

  Future<bool> _maybeShowStartupPrivacyNotice() async {
    final shownVersion = _storage.read(_startupNoticeVersionKey) as String?;
    if (shownVersion == _startupNoticeCurrentVersion) {
      return true;
    }

    final completer = Completer<bool>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final action = await Get.dialog<StartupPrivacyNoticeAction>(
        AlertDialog(
          title: const Text('Network Relay Notice'),
          content: const Text(
            'Fungi may use community relay servers to improve connectivity across NATs and restricted networks. \n\nRelay servers may observe your local addresses and network metadata. \n\nYou can change this in Settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(
                result: StartupPrivacyNoticeAction.openRelaySettings,
              ),
              child: const Text('Open Relay Settings'),
            ),
            FilledButton(
              onPressed: () =>
                  Get.back(result: StartupPrivacyNoticeAction.continueLaunch),
              child: const Text('Continue'),
            ),
          ],
        ),
        barrierDismissible: true,
      );

      _storage.write(_startupNoticeVersionKey, _startupNoticeCurrentVersion);

      if (action == StartupPrivacyNoticeAction.openRelaySettings) {
        await openRelaySettingsDialog();
        final context = Get.context;
        if (context != null && context.mounted) {
          await showRelaySettingsDialog(context);
        }
        completer.complete(false);
        return;
      }

      await refreshRelayConfig();
      completer.complete(true);
    });

    return completer.future;
  }

  Future<void> resetStartupPrivacyNoticeForDebug() async {
    await _storage.remove(_startupNoticeVersionKey);
    Get.snackbar(
      'Startup notice reset',
      'The relay notice will appear again the next time you manually start the daemon.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> _loadAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final version = packageInfo.version.trim();
      if (version.isNotEmpty) {
        appVersion.value = version;
      }
      appBuildVersion.value = _buildAppVersionLabel(packageInfo);
      appBuildDetails.value = _buildAppDetailsLabel(packageInfo);
    } catch (error) {
      debugPrint('Failed to load app version: $error');
      appVersion.value = _defaultAppVersion;
      appBuildVersion.value =
          '${AppBuildInfo.channelLabel} $_defaultAppVersion';
      appBuildDetails.value =
          'App\n'
          'Name: ${AppBuildInfo.appName}\n'
          'Channel: ${AppBuildInfo.channelLabel}\n'
          'Version: $_defaultAppVersion\n'
          'Commit: ${AppBuildInfo.commitLabel}\n'
          'Built: ${AppBuildInfo.buildTimeLabel}';
    }
  }

  String _buildAppVersionLabel(PackageInfo packageInfo) {
    final version = packageInfo.version.trim().isEmpty
        ? _defaultAppVersion
        : packageInfo.version.trim();
    final buildNumber = packageInfo.buildNumber.trim();
    final versionWithBuild = buildNumber.isEmpty
        ? version
        : '$version+$buildNumber';
    return '${AppBuildInfo.channelLabel} $versionWithBuild';
  }

  String _buildAppDetailsLabel(PackageInfo packageInfo) {
    final version = packageInfo.version.trim().isEmpty
        ? _defaultAppVersion
        : packageInfo.version.trim();
    final buildNumber = packageInfo.buildNumber.trim();
    final packageName = packageInfo.packageName.trim();

    return [
      'App',
      'Name: ${AppBuildInfo.appName}',
      'Channel: ${AppBuildInfo.channelLabel}',
      'Version: $version',
      if (buildNumber.isNotEmpty) 'Build: $buildNumber',
      if (packageName.isNotEmpty) 'App ID: $packageName',
      'Commit: ${AppBuildInfo.commitLabel}',
      'Built: ${AppBuildInfo.buildTimeLabel}',
    ].join('\n');
  }

  String get versionDetails {
    final daemonDetails = connectedDaemonBuildDetails.value.trim();
    if (daemonDetails.isEmpty) {
      return '${appBuildDetails.value}\n\n${_buildDaemonUnavailableLabel()}';
    }
    return '${appBuildDetails.value}\n\n$daemonDetails';
  }

  String _buildDaemonDetailsLabel(VersionResponse response) {
    final values = [
      'Daemon',
      'Name: fungi',
      'Channel: ${_buildInfoValue(response.channel)}',
      'Version: ${_buildInfoValue(response.version)}',
      'Commit: ${_buildInfoValue(response.commit)}',
      'Built: ${_buildInfoValue(response.buildTime)}',
      'Default config: ${_buildInfoValue(response.defaultFungiDir)}',
      'Default gRPC: ${_buildInfoValue(response.defaultRpcAddress)}',
    ];
    return values.join('\n');
  }

  String _buildDaemonUnavailableLabel() {
    final state = daemonConnectionState.value;
    if (state.isDisabled) {
      return 'Daemon\nStatus: Not connected';
    }
    if (state.isConnecting) {
      return 'Daemon\nStatus: Connecting';
    }
    if (state.isFailed) {
      final error = daemonError.value.trim();
      return [
        'Daemon',
        'Status: Failed',
        if (error.isNotEmpty) 'Error: $error',
      ].join('\n');
    }
    return 'Daemon\nStatus: Connected\nVersion details: unavailable';
  }

  String _buildInfoValue(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? 'unknown' : trimmed;
  }

  bool _isCompatibleDaemonVersion(String version) {
    return _compareSemver(version, minimumCompatibleDaemonVersion) >= 0;
  }

  int _compareSemver(String left, String right) {
    final leftParts = _parseSemver(left);
    final rightParts = _parseSemver(right);
    if (leftParts == null || rightParts == null) {
      return left.trim() == right.trim() ? 0 : -1;
    }

    for (var index = 0; index < 3; index++) {
      final comparison = leftParts[index].compareTo(rightParts[index]);
      if (comparison != 0) {
        return comparison;
      }
    }

    return 0;
  }

  List<int>? _parseSemver(String version) {
    final match = RegExp(r'(\d+)\.(\d+)\.(\d+)').firstMatch(version);
    if (match == null) {
      return null;
    }

    return [
      int.parse(match.group(1)!),
      int.parse(match.group(2)!),
      int.parse(match.group(3)!),
    ];
  }

  String _buildIncompatibleDaemonMessage(String version) {
    final detectedVersion = version.trim().isEmpty ? 'unknown' : version.trim();
    return 'Detected daemon $detectedVersion, but this app requires daemon $minimumCompatibleDaemonVersion or newer. Stop the old daemon or upgrade it before connecting.';
  }

  bool _isUnimplementedGrpcError(Object error) {
    return error is grpc.GrpcError &&
        error.code == grpc.StatusCode.unimplemented;
  }

  String _friendlyRelayFailureMessage(Object error) {
    if (_isUnimplementedGrpcError(error)) {
      return 'This daemon does not support relay settings yet. Upgrade the daemon to $minimumCompatibleDaemonVersion or newer.';
    }

    if (error is ProcessException) {
      final stderr = error.message.trim();
      return stderr.isEmpty ? 'Failed to update relay config.' : stderr;
    }

    return 'Failed to load relay config: $error';
  }

  Future<RelayConfigView> _readRelayConfigFromCli() async {
    final result = await runFungiCommand(['relay', 'show']);
    if (result.exitCode != 0) {
      throw ProcessException(
        result.stderr?.toString() ?? 'fungi relay show',
        const ['relay', 'show'],
        result.stderr.toString(),
        result.exitCode,
      );
    }

    return RelayConfigView.fromCliShowOutput(result.stdout.toString());
  }

  Future<void> _runRelayCliCommand(List<String> args) async {
    final result = await runFungiCommand(args);
    if (result.exitCode != 0) {
      throw ProcessException(
        args.first,
        args,
        result.stderr.toString(),
        result.exitCode,
      );
    }
  }

  Future<void> _showIncompatibleDaemonDialog(String version) async {
    final detectedVersion = version.trim().isEmpty ? 'unknown' : version.trim();
    await Get.dialog<void>(
      AlertDialog(
        title: const Text('Daemon Upgrade Required'),
        content: Text(
          'An older fungi daemon is already running on this device ($detectedVersion). This app requires daemon $minimumCompatibleDaemonVersion or newer. Stop the old daemon or upgrade it, then try again.',
        ),
        actions: [
          FilledButton(
            onPressed: () => Get.back<void>(),
            child: const Text('Close'),
          ),
        ],
      ),
      barrierDismissible: true,
    );
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
      updateTrustedDevices(),
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

  Future<void> refreshAvailableServicesData({
    String? peerId,
    bool cached = false,
    bool showLoading = true,
  }) async {
    if (showLoading) {
      availableServicesLoading.value = true;
    }
    if (peerId == null) {
      availableServicesError.value = '';
    }

    try {
      final accessResponse = await fungiClient.listServiceAccesses(
        ListServiceAccessesRequest()..peerId = peerId ?? '',
      );
      final attachedAccesses = decodeJsonStringList(
        accessResponse.serviceAccessesJson,
        (json) => json,
      );
      final accessByService = <String, Map<String, dynamic>>{};
      for (final access in attachedAccesses) {
        final peerId = access['peer_id'] as String? ?? '';
        final serviceName = access['service_name'] as String? ?? '';
        if (peerId.isEmpty || serviceName.isEmpty) {
          continue;
        }
        accessByService['$peerId::$serviceName'] = access;
      }

      final next = peerId == null
          ? <String, List<RemoteServiceListEntryView>>{}
          : Map<String, List<RemoteServiceListEntryView>>.from(
              peerCatalogServices,
            );
      final peerIds = peerId == null
          ? addressBook.map((peer) => peer.peerId).toList(growable: false)
          : <String>[peerId];
      for (final currentPeerId in peerIds) {
        if (!addressBook.any((peer) => peer.peerId == currentPeerId)) {
          next.remove(currentPeerId);
          continue;
        }
        try {
          final catalogResponse = await fungiClient.listDevicePublishedServices(
            ListDeviceServicesRequest()
              ..deviceId = currentPeerId
              ..cached = cached,
            options: grpc.CallOptions(timeout: _peerCatalogRequestTimeout),
          );
          final services = decodeJsonStringList(catalogResponse.servicesJson, (
            serviceJson,
          ) {
            final serviceName = serviceJson['service_name'] as String? ?? '';
            final access = accessByService['$currentPeerId::$serviceName'];

            return RemoteServiceListEntryView.fromJson({
              'display_name': serviceName,
              'service_name': serviceName,
              'runtime': serviceJson['runtime']?.toString(),
              'transport': serviceJson['transport'],
              'usage': serviceJson['usage'],
              'state':
                  (serviceJson['status'] as Map<String, dynamic>?)?['state'],
              'running':
                  (serviceJson['status'] as Map<String, dynamic>?)?['running'],
              'published': true,
              'service_id': serviceName,
              'access_attached': access != null,
              'catalog_id': serviceJson['catalog_id'],
              'icon_url': serviceJson['icon_url'],
              'published_endpoints': serviceJson['endpoints'] ?? const [],
              'local_access_endpoints': access?['endpoints'] ?? const [],
            });
          });
          next[currentPeerId] = services;
        } catch (e) {
          debugPrint('Failed to load peer catalog for $currentPeerId: $e');
          next.putIfAbsent(currentPeerId, () => const []);
        }
      }
      peerCatalogServices.value = next;
    } catch (e) {
      if (peerId == null) {
        availableServicesError.value = 'Failed to load available services: $e';
        debugPrint(availableServicesError.value);
      } else {
        debugPrint('Failed to load available services for $peerId: $e');
      }
    } finally {
      if (showLoading) {
        availableServicesLoading.value = false;
      }
    }
  }

  Future<void> refreshNodeManagementData({
    bool refreshManagedServices = true,
  }) async {
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
      if (refreshManagedServices) {
        await refreshPeerManagedServicesData(cached: false);
      }
    } catch (e) {
      debugPrint('Failed to refresh node management data: $e');
    } finally {
      nodeManagementLoading.value = false;
    }
  }

  Future<void> refreshPeerManagedServicesData({
    String? peerId,
    bool cached = false,
  }) async {
    final peers = peerId == null
        ? addressBook.map((peer) => peer.peerId).toList(growable: false)
        : <String>[peerId];

    await Future.wait(
      peers.map((peerId) {
        return _refreshPeerManagedServicesForPeer(peerId, cached: cached);
      }),
    );
  }

  void _refreshPeerManagedServicesInBackground({String? peerId}) {
    unawaited(refreshPeerManagedServicesData(peerId: peerId, cached: false));
  }

  Future<void> _refreshPeerManagedServicesForPeer(
    String peerId, {
    required bool cached,
  }) async {
    _setPeerManagedServicesLoading(peerId, true);
    _setPeerManagedServicesError(peerId, '');

    try {
      final response = await fungiClient.listDeviceManagedServices(
        ListDeviceServicesRequest()
          ..deviceId = peerId
          ..cached = cached,
        options: grpc.CallOptions(timeout: _remotePeerServicesRequestTimeout),
      );
      final services = decodeJsonStringList(
        response.servicesJson,
        LocalServiceView.fromJson,
      )..sort((left, right) => left.name.compareTo(right.name));
      _setPeerManagedServices(peerId, services);
    } catch (e) {
      debugPrint('Failed to load managed services for $peerId: $e');
      if (!peerManagedServices.containsKey(peerId)) {
        _setPeerManagedServices(peerId, const []);
      }
      _setPeerManagedServicesError(peerId, e.toString());
    } finally {
      _setPeerManagedServicesLoading(peerId, false);
    }
  }

  void _setPeerManagedServices(String peerId, List<LocalServiceView> services) {
    final next = Map<String, List<LocalServiceView>>.from(peerManagedServices);
    next[peerId] = services;
    peerManagedServices.value = next;
  }

  void _setPeerManagedServicesLoading(String peerId, bool loading) {
    final next = Map<String, bool>.from(peerManagedServicesLoading);
    if (loading) {
      next[peerId] = true;
    } else {
      next.remove(peerId);
    }
    peerManagedServicesLoading.value = next;
  }

  void _setPeerManagedServicesError(String peerId, String error) {
    final next = Map<String, String>.from(peerManagedServicesErrors);
    if (error.isEmpty) {
      next.remove(peerId);
    } else {
      next[peerId] = error;
    }
    peerManagedServicesErrors.value = next;
  }

  List<PeerServicesSectionView> get availableServiceSections {
    return addressBook
        .map(
          (peer) => PeerServicesSectionView(
            peerId: peer.peerId,
            alias: peer.name,
            hostname: peer.hostname,
            services: peerCatalogServices[peer.peerId] ?? const [],
          ),
        )
        .where((section) => section.services.isNotEmpty)
        .toList(growable: false);
  }

  List<LocalServiceView> managedServicesForPeer(String peerId) {
    return peerManagedServices[peerId] ?? const [];
  }

  bool isPeerManagedServicesLoading(String peerId) {
    return peerManagedServicesLoading[peerId] ?? false;
  }

  String peerManagedServicesError(String peerId) {
    return peerManagedServicesErrors[peerId] ?? '';
  }

  Iterable<String> remoteServiceReferenceCandidates(String peerId) sync* {
    yield peerId;

    for (final peer in addressBook) {
      if (peer.peerId != peerId) {
        continue;
      }

      if (peer.name.isNotEmpty) {
        yield peer.name;
      }
      if (peer.hostname.isNotEmpty) {
        yield peer.hostname;
      }
      break;
    }
  }

  RemoteServiceListEntryView? _matchCatalogServiceForPeer(
    String peerId,
    String serviceName,
  ) {
    final normalizedServiceName = serviceName.trim();
    if (normalizedServiceName.isEmpty) {
      return null;
    }

    final services = peerCatalogServices[peerId] ?? const [];
    for (final service in services) {
      if (service.serviceName == normalizedServiceName ||
          service.serviceId == normalizedServiceName) {
        return service;
      }

      for (final candidate in remoteServiceReferenceCandidates(peerId)) {
        if (service.qualifiedName(candidate) == normalizedServiceName) {
          return service;
        }
      }
    }

    return null;
  }

  String normalizeRemoteServiceName(String peerId, String serviceName) {
    final matched = _matchCatalogServiceForPeer(peerId, serviceName);
    return matched?.serviceName ?? serviceName.trim();
  }

  RemoteServiceListEntryView? catalogServiceForPeer(
    String peerId,
    String serviceName,
  ) {
    return _matchCatalogServiceForPeer(peerId, serviceName);
  }

  Future<void> attachCatalogServiceAccess({
    required String peerId,
    required String serviceName,
  }) async {
    final normalizedServiceName = normalizeRemoteServiceName(
      peerId,
      serviceName,
    );
    try {
      await fungiClient.attachServiceAccess(
        AttachServiceAccessRequest()
          ..peerId = peerId
          ..serviceName = normalizedServiceName,
      );
      await refreshAvailableServicesData(
        peerId: peerId,
        cached: true,
        showLoading: false,
      );
      _refreshPeerManagedServicesInBackground(peerId: peerId);
      Get.snackbar('Success', 'Connected locally');
    } catch (e) {
      Get.snackbar('Connect failed', '$e');
    }
  }

  Future<void> detachCatalogServiceAccess({
    required String peerId,
    required String serviceName,
  }) async {
    final normalizedServiceName = normalizeRemoteServiceName(
      peerId,
      serviceName,
    );
    try {
      await fungiClient.detachServiceAccess(
        DetachServiceAccessRequest()
          ..peerId = peerId
          ..serviceName = normalizedServiceName,
      );
      await refreshAvailableServicesData(
        peerId: peerId,
        cached: true,
        showLoading: false,
      );
      _refreshPeerManagedServicesInBackground(peerId: peerId);
      Get.snackbar('Success', 'Disconnected');
    } catch (e) {
      Get.snackbar('Disconnect failed', '$e');
    }
  }

  Future<void> openCatalogWebService({
    required String peerId,
    required String serviceName,
  }) async {
    final normalizedServiceName = normalizeRemoteServiceName(
      peerId,
      serviceName,
    );
    try {
      var service = catalogServiceForPeer(peerId, normalizedServiceName);
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
            ..serviceName = normalizedServiceName,
        );
        await refreshAvailableServicesData(
          peerId: peerId,
          cached: true,
          showLoading: false,
        );
        service = catalogServiceForPeer(peerId, normalizedServiceName);
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

  Future<bool> pullRemoteServiceFromPath({
    required String peerId,
    required String manifestPath,
  }) async {
    try {
      final file = File(manifestPath);
      if (!await file.exists()) {
        throw Exception('Service file not found: $manifestPath');
      }

      final manifestYaml = await file.readAsString();
      await fungiClient.remotePullService(
        RemotePullServiceRequest()
          ..peerId = peerId
          ..manifestYaml = manifestYaml,
      );
      await refreshPeerManagedServicesData(peerId: peerId);
      await refreshAvailableServicesData(
        peerId: peerId,
        cached: false,
        showLoading: false,
      );
      Get.snackbar('Success', 'Service applied to device');
      return true;
    } catch (e) {
      Get.snackbar('Remote apply failed', '$e');
      return false;
    }
  }

  Future<List<RecipeSummary>> listServiceRecipes({bool refresh = false}) async {
    final response = await fungiClient.listRecipes(
      ListRecipesRequest()..refresh = refresh,
      options: grpc.CallOptions(timeout: _recipeRequestTimeout),
    );
    return response.recipes;
  }

  Future<RecipeDetail> getServiceRecipeDetail({
    required String recipeId,
    bool refresh = false,
  }) async {
    final response = await fungiClient.getRecipe(
      GetRecipeRequest()
        ..recipeId = recipeId
        ..refresh = refresh,
      options: grpc.CallOptions(timeout: _recipeRequestTimeout),
    );
    if (!response.hasDetail()) {
      throw Exception('Recipe detail was missing from the daemon response');
    }
    return response.detail;
  }

  Future<ResolveRecipeResponse> resolveServiceRecipe({
    required String recipeId,
    String? serviceName,
    String? peerId,
    bool refresh = false,
  }) async {
    final response = await fungiClient.resolveRecipe(
      ResolveRecipeRequest()
        ..recipeId = recipeId
        ..serviceName = serviceName ?? ''
        ..peerId = peerId ?? ''
        ..refresh = refresh,
      options: grpc.CallOptions(timeout: _recipeRequestTimeout),
    );
    if (!response.hasDetail()) {
      throw Exception('Recipe detail was missing from the daemon response');
    }
    if (!response.hasManifestYaml()) {
      throw Exception(
        'Resolved recipe manifest was missing from the daemon response',
      );
    }
    return response;
  }

  Future<bool> createLocalServiceFromResolvedRecipe(
    ResolveRecipeResponse resolved,
  ) async {
    try {
      await fungiClient.pullService(
        PullServiceRequest()
          ..manifestYaml = resolved.manifestYaml
          ..manifestBaseDir = resolved.manifestBaseDir,
      );
      await refreshLocalServicesPageData();
      await refreshNodeManagementData();
      Get.snackbar('Success', 'Service applied');
      return true;
    } catch (e) {
      Get.snackbar('Recipe apply failed', '$e');
      return false;
    }
  }

  Future<bool> createRemoteServiceFromResolvedRecipe({
    required String peerId,
    required ResolveRecipeResponse resolved,
  }) async {
    try {
      await fungiClient.remotePullService(
        RemotePullServiceRequest()
          ..peerId = peerId
          ..manifestYaml = resolved.manifestYaml,
      );
      await refreshPeerManagedServicesData(peerId: peerId);
      await refreshAvailableServicesData(
        peerId: peerId,
        cached: false,
        showLoading: false,
      );
      Get.snackbar('Success', 'Service applied to device');
      return true;
    } catch (e) {
      Get.snackbar('Remote recipe apply failed', '$e');
      return false;
    }
  }

  String remoteServiceActionKey(String peerId, String serviceName) {
    return '$peerId::$serviceName';
  }

  Future<void> startRemoteService({
    required String peerId,
    required String serviceName,
  }) async {
    final actionKey = remoteServiceActionKey(peerId, serviceName);
    remoteServicePendingActions[actionKey] = 'start';
    remoteServicePendingActions.refresh();
    try {
      await fungiClient.remoteStartService(
        RemoteServiceNameRequest()
          ..peerId = peerId
          ..name = serviceName,
      );
      await refreshPeerManagedServicesData(peerId: peerId);
      await refreshAvailableServicesData(
        peerId: peerId,
        cached: false,
        showLoading: false,
      );
      Get.snackbar('Success', 'Remote service started');
    } catch (e) {
      Get.snackbar('Remote start failed', '$e');
    } finally {
      remoteServicePendingActions.remove(actionKey);
      remoteServicePendingActions.refresh();
    }
  }

  Future<void> stopRemoteService({
    required String peerId,
    required String serviceName,
  }) async {
    final actionKey = remoteServiceActionKey(peerId, serviceName);
    remoteServicePendingActions[actionKey] = 'stop';
    remoteServicePendingActions.refresh();
    try {
      await fungiClient.remoteStopService(
        RemoteServiceNameRequest()
          ..peerId = peerId
          ..name = serviceName,
      );
      await refreshPeerManagedServicesData(peerId: peerId);
      await refreshAvailableServicesData(
        peerId: peerId,
        cached: false,
        showLoading: false,
      );
      Get.snackbar('Success', 'Remote service stopped');
    } catch (e) {
      Get.snackbar('Remote stop failed', '$e');
    } finally {
      remoteServicePendingActions.remove(actionKey);
      remoteServicePendingActions.refresh();
    }
  }

  Future<void> removeRemoteService({
    required String peerId,
    required String serviceName,
  }) async {
    final actionKey = remoteServiceActionKey(peerId, serviceName);
    remoteServicePendingActions[actionKey] = 'remove';
    remoteServicePendingActions.refresh();
    try {
      await fungiClient.remoteRemoveService(
        RemoteServiceNameRequest()
          ..peerId = peerId
          ..name = serviceName,
      );
      await refreshPeerManagedServicesData(peerId: peerId, cached: true);
      _refreshPeerManagedServicesInBackground(peerId: peerId);
      await refreshAvailableServicesData(
        peerId: peerId,
        cached: false,
        showLoading: false,
      );
      Get.snackbar('Success', 'Remote service removed');
    } catch (e) {
      Get.snackbar('Remote remove failed', '$e');
    } finally {
      remoteServicePendingActions.remove(actionKey);
      remoteServicePendingActions.refresh();
    }
  }

  Future<void> openDocumentation() async {
    final uri = Uri.parse(documentationUrl);
    final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      Get.snackbar('Open failed', 'Could not open documentation');
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

  Uri? localServiceLaunchUri(LocalServiceView service) {
    if (service.localEndpoints.isEmpty) {
      return null;
    }

    LocalServicePortView? webEndpoint;
    for (final endpoint in service.localEndpoints) {
      final label = [
        endpoint.name ?? '',
        endpoint.protocol,
      ].join(' ').toLowerCase();
      if (label.contains('web') || label.contains('http')) {
        webEndpoint = endpoint;
        break;
      }
    }

    final endpoint = webEndpoint ?? service.localEndpoints.first;
    if (endpoint.localPort <= 0) {
      return null;
    }

    return Uri(
      scheme: 'http',
      host: endpoint.localHost,
      port: endpoint.localPort,
      path: '/',
    );
  }

  Future<void> openLocalService(String serviceName) async {
    try {
      final service = localServices.firstWhere(
        (service) => service.name == serviceName || service.id == serviceName,
      );
      final uri = localServiceLaunchUri(service);
      if (uri == null) {
        throw Exception('No local endpoint is available');
      }
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        throw Exception('Open request was rejected');
      }
    } catch (e) {
      Get.snackbar('Open failed', '$e');
    }
  }

  String peerDisplayLabel(String peerId) {
    for (final peer in addressBook) {
      if (peer.peerId != peerId) {
        continue;
      }
      if (peer.name.isNotEmpty) {
        return peer.name;
      }
      if (peer.hostname.isNotEmpty) {
        return peer.hostname;
      }
      break;
    }
    return peerId;
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

  Future<bool> pullLocalServiceFromPath(String manifestPath) async {
    try {
      final file = File(manifestPath);
      if (!await file.exists()) {
        throw Exception('Service file not found: $manifestPath');
      }

      final manifestYaml = await file.readAsString();
      await fungiClient.pullService(
        PullServiceRequest()
          ..manifestYaml = manifestYaml
          ..manifestBaseDir = file.parent.path,
      );
      await refreshLocalServicesPageData();
      await refreshNodeManagementData();
      Get.snackbar('Success', 'Service applied');
      return true;
    } catch (e) {
      Get.snackbar('Apply failed', '$e');
      return false;
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
    Get.snackbar(
      'Unavailable',
      'Allowed ports are no longer exposed by the current daemon API.',
    );
  }

  Future<void> removeRuntimeAllowedPort(int port) async {
    Get.snackbar(
      'Unavailable',
      'Allowed ports are no longer exposed by the current daemon API.',
    );
  }

  Future<void> addRuntimeAllowedPortRange(int start, int end) async {
    Get.snackbar(
      'Unavailable',
      'Allowed port ranges are no longer exposed by the current daemon API.',
    );
  }

  Future<void> removeRuntimeAllowedPortRange(int start, int end) async {
    Get.snackbar(
      'Unavailable',
      'Allowed port ranges are no longer exposed by the current daemon API.',
    );
  }

  Future<void> startLocalService(String name) async {
    localServicePendingActions[name] = 'start';
    localServicePendingActions.refresh();
    try {
      await fungiClient.startService(ServiceNameRequest()..name = name);
      await refreshLocalServicesPageData();
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
      Get.snackbar('Success', 'Service removed');
    } catch (e) {
      Get.snackbar('Remove failed', '$e');
    } finally {
      localServicePendingActions.remove(name);
      localServicePendingActions.refresh();
    }
  }
}

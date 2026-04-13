import 'dart:io';

import 'package:flutter/services.dart';

class LaunchAtLoginStatus {
  const LaunchAtLoginStatus({
    required this.supported,
    required this.enabled,
    this.requiresApproval = false,
  });

  final bool supported;
  final bool enabled;
  final bool requiresApproval;

  factory LaunchAtLoginStatus.fromMap(Map<Object?, Object?> map) {
    return LaunchAtLoginStatus(
      supported: map['supported'] as bool? ?? false,
      enabled: map['enabled'] as bool? ?? false,
      requiresApproval: map['requiresApproval'] as bool? ?? false,
    );
  }
}

class LaunchAtLoginManager {
  static const MethodChannel _channel = MethodChannel(
    'fungi_app/launch_at_login',
  );
  static const String launchToTrayArgument = '--launch-to-tray';
  static const String hideToTrayStorageKey = 'launch_at_login_hide_to_tray';

  static bool get isSupportedPlatform => Platform.isMacOS || Platform.isWindows;

  static bool shouldLaunchToTrayFromArguments(List<String> arguments) {
    return arguments.contains(launchToTrayArgument);
  }

  static Future<LaunchAtLoginStatus> getStatus() async {
    if (!isSupportedPlatform) {
      return const LaunchAtLoginStatus(supported: false, enabled: false);
    }

    final response = await _channel.invokeMapMethod<Object?, Object?>(
      'getStatus',
    );

    return LaunchAtLoginStatus.fromMap(response ?? const {});
  }

  static Future<LaunchAtLoginStatus> setEnabled(
    bool enabled, {
    required bool hideToTray,
  }) async {
    if (!isSupportedPlatform) {
      return const LaunchAtLoginStatus(supported: false, enabled: false);
    }

    final response = await _channel.invokeMapMethod<Object?, Object?>(
      'setEnabled',
      {'enabled': enabled, 'hideToTray': hideToTray},
    );

    return LaunchAtLoginStatus.fromMap(response ?? const {});
  }

  static Future<bool> shouldLaunchToTrayOnStartup(
    List<String> arguments,
    bool hideToTrayOnLaunchAtLogin,
  ) async {
    if (shouldLaunchToTrayFromArguments(arguments)) {
      return true;
    }

    if (!Platform.isMacOS || !hideToTrayOnLaunchAtLogin) {
      return false;
    }

    final shouldLaunchToTray = await _channel.invokeMethod<bool>(
      'shouldLaunchToTrayOnStartup',
    );
    return shouldLaunchToTray ?? false;
  }
}

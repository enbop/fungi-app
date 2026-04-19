import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fungi_app/app/build_info.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/controllers/log_viewer_controller.dart';
import 'package:fungi_app/ui/pages/home/drive_page.dart';
import 'package:fungi_app/ui/pages/settings/relay_settings_dialog.dart';
import 'package:fungi_app/ui/pages/settings/log_viewer_dialog.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class Settings extends GetView<FungiController> {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SettingsList(
        platform: _settingsPlatform,
        lightTheme: _settingsTheme(context),
        darkTheme: _settingsTheme(context),
        sections: [
          SettingsSection(
            title: Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Language'),
                value: Text('English'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.menu_book),
                title: Text('Documentation'),
                value: Text('fungi.rs/docs'),
                onPressed: (context) async {
                  await controller.openDocumentation();
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.format_paint),
                title: Text('Theme'),
                value: Obx(() => Text(controller.currentTheme.value.name)),
                onPressed: (context) {
                  _showThemeDialog();
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.info_outline),
                title: Text('App version'),
                value: Text(controller.appBuildVersion.value),
                onPressed: (context) {
                  _showAppVersionDialog(context);
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.file_open),
                title: Text('Config file path'),
                value: Text(controller.configFilePath.value),
                onPressed: (context) {
                  Clipboard.setData(
                    ClipboardData(text: controller.configFilePath.value),
                  );
                  SmartDialog.showToast('Path copied to clipboard');
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.folder_open),
                title: Text('Log file path'),
                value: Text(controller.logDirPath.value),
                onPressed: (context) {
                  if (controller.logDirPath.value.isEmpty) {
                    SmartDialog.showToast('Log path is not available yet');
                    return;
                  }

                  Clipboard.setData(
                    ClipboardData(text: controller.logDirPath.value),
                  );
                  SmartDialog.showToast('Path copied to clipboard');
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.memory),
                title: Text('Daemon session'),
                value: Obx(() => Text(controller.daemonLifecycleLabel)),
                description: Obx(() => Text(controller.daemonSessionSummary)),
                trailing: Obx(() {
                  if (controller.canDisconnectDaemonSession) {
                    return TextButton(
                      onPressed: controller.disconnectDaemonSession,
                      child: const Text('Disconnect'),
                    );
                  }

                  if (controller.canStopDaemon) {
                    return TextButton(
                      onPressed: controller.stopDaemon,
                      child: const Text('Stop'),
                    );
                  }

                  return const SizedBox.shrink();
                }),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.article),
                title: Text('Open daemon log viewer'),
                onPressed: (context) {
                  final logViewerTag = UniqueKey().toString();
                  Get.put(
                    LogViewerController(
                      logsDirPath: controller.logDirPath.value,
                    ),
                    tag: logViewerTag,
                  );

                  showDialog(
                    context: context,
                    builder: (_) => LogViewerDialog(
                      logsDirPath: controller.logDirPath.value,
                      controllerTag: logViewerTag,
                    ),
                  ).whenComplete(() {
                    if (Get.isRegistered<LogViewerController>(
                      tag: logViewerTag,
                    )) {
                      Get.delete<LogViewerController>(
                        tag: logViewerTag,
                        force: true,
                      );
                    }
                  });
                },
              ),
            ],
          ),
          SettingsSection(
            title: Text('Network'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.hub),
                title: Text('Relay Configuration'),
                onPressed: (context) async {
                  await controller.openRelaySettingsDialog();
                  if (context.mounted) {
                    await showRelaySettingsDialog(context);
                  }
                },
              ),
            ],
          ),
          if (_supportsDesktopLaunchAtLogin)
            SettingsSection(
              title: Text('Desktop'),
              tiles: <SettingsTile>[
                SettingsTile.switchTile(
                  initialValue: controller.launchAtLoginEnabled.value,
                  enabled:
                      controller.launchAtLoginSupported.value &&
                      !controller.launchAtLoginLoading.value,
                  leading: Icon(Icons.power_settings_new),
                  title: Text('Launch at login'),
                  description: Text(_launchAtLoginDescription),
                  onToggle: (value) async {
                    await controller.setLaunchAtLoginEnabled(value);
                  },
                ),
                if (controller.launchAtLoginEnabled.value)
                  SettingsTile.switchTile(
                    initialValue: controller.launchAtLoginHideToTray.value,
                    enabled:
                        controller.launchAtLoginSupported.value &&
                        !controller.launchAtLoginLoading.value,
                    leading: Icon(Icons.visibility_off),
                    title: Text('Hide app after launch at login'),
                    description: Text(
                      'Start in the tray after login instead of keeping the main window open.',
                    ),
                    onToggle: (value) async {
                      await controller.setLaunchAtLoginHideToTray(value);
                    },
                  ),
              ],
            ),
          if (kDebugMode)
            SettingsSection(
              title: Text('Debug'),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.refresh),
                  title: Text('Reset startup relay notice'),
                  value: Text('Show first-run prompt again'),
                  onPressed: (context) async {
                    await controller.resetStartupPrivacyNoticeForDebug();
                  },
                ),
              ],
            ),
          SettingsSection(
            title: Text('Legacy'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.folder_shared),
                title: Text('Legacy File Transfer'),
                value: Text('Deprecated'),
                description: Text(
                  'Open the previous file transfer UI in a dialog. This path will be removed in a future release.',
                ),
                onPressed: (context) {
                  _showLegacyFileTransferDialog(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  DevicePlatform get _settingsPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return DevicePlatform.iOS;
      case TargetPlatform.macOS:
        return DevicePlatform.macOS;
      case TargetPlatform.windows:
        return DevicePlatform.windows;
      case TargetPlatform.linux:
        return DevicePlatform.linux;
      case TargetPlatform.android:
        return DevicePlatform.android;
      case TargetPlatform.fuchsia:
        return DevicePlatform.fuchsia;
    }
  }

  bool get _supportsDesktopLaunchAtLogin =>
      defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.windows;

  String get _launchAtLoginDescription {
    if (controller.launchAtLoginLoading.value) {
      return 'Checking startup preference...';
    }

    if (!controller.launchAtLoginSupported.value) {
      return 'This platform does not currently support launch at login.';
    }

    if (controller.launchAtLoginRequiresApproval.value) {
      return 'Enabled, but macOS still needs approval in System Settings > General > Login Items.';
    }

    return 'Start ${AppBuildInfo.appName} automatically when you sign in.';
  }

  SettingsThemeData _settingsTheme(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SettingsThemeData(
      settingsListBackground: theme.scaffoldBackgroundColor,
      settingsSectionBackground: colorScheme.surface,
      tileHighlightColor: colorScheme.primary.withValues(alpha: 0.08),
      titleTextColor: colorScheme.onSurfaceVariant,
      settingsTileTextColor: colorScheme.onSurface,
      tileDescriptionTextColor: colorScheme.onSurfaceVariant,
      leadingIconsColor: colorScheme.onSurfaceVariant,
      trailingTextColor: colorScheme.onSurfaceVariant,
      dividerColor: colorScheme.outlineVariant,
      inactiveTitleColor: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
      inactiveSubtitleColor: colorScheme.onSurfaceVariant.withValues(
        alpha: 0.45,
      ),
    );
  }

  void _showAppVersionDialog(BuildContext context) {
    final details = controller.versionDetails;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('App version'),
        content: SelectableText(details),
        actions: [
          TextButton(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: details),
              );
              SmartDialog.showToast('Version details copied to clipboard');
            },
            child: const Text('Copy'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showLegacyFileTransferDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: SizedBox(
          width: 920,
          height: 720,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 18, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Legacy File Transfer',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'This module is deprecated and will be removed in a future release.',
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(12),
                  child: FileTransferPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showThemeDialog() {
    SmartDialog.show(
      builder: (context) {
        return AlertDialog(
          title: Text('Select Theme'),
          content: Obx(
            () => RadioGroup<ThemeOption>(
              groupValue: controller.currentTheme.value,
              onChanged: (ThemeOption? value) {
                if (value != null) {
                  controller.changeTheme(value);
                  SmartDialog.dismiss();
                }
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: ThemeOption.values.map((option) {
                  return ListTile(
                    title: Text(option.name),
                    leading: Radio<ThemeOption>(value: option),
                    onTap: () {
                      controller.changeTheme(option);
                      SmartDialog.dismiss();
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => SmartDialog.dismiss(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

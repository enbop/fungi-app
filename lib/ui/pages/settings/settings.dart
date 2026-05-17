import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:fungi_app/app/build_info.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/controllers/log_viewer_controller.dart';
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
                leading: Icon(Icons.folder_open),
                title: Text('Path locations'),
                value: Text('Config and logs'),
                onPressed: (context) {
                  _showPathLocationsDialog(context);
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
                _desktopSwitchTile(
                  value: controller.launchAtLoginEnabled.value,
                  enabled:
                      controller.launchAtLoginSupported.value &&
                      !controller.launchAtLoginLoading.value,
                  leading: const Icon(Icons.power_settings_new),
                  title: const Text('Launch at login'),
                  description: Text(_launchAtLoginDescription),
                  onChanged: (value) async {
                    await controller.setLaunchAtLoginEnabled(value);
                  },
                ),
                if (controller.launchAtLoginEnabled.value)
                  _desktopSwitchTile(
                    value: controller.launchAtLoginHideToTray.value,
                    enabled:
                        controller.launchAtLoginSupported.value &&
                        !controller.launchAtLoginLoading.value,
                    leading: const Icon(Icons.visibility_off),
                    title: const Text('Hide app after launch at login'),
                    description: const Text(
                      'Start in the tray after login instead of keeping the main window open.',
                    ),
                    onChanged: (value) async {
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

  SettingsTile _desktopSwitchTile({
    required bool value,
    required bool enabled,
    required Widget leading,
    required Widget title,
    required Widget description,
    required ValueChanged<bool> onChanged,
  }) {
    return SettingsTile.navigation(
      leading: leading,
      title: title,
      description: description,
      onPressed: enabled ? (_) => onChanged(!value) : null,
      trailing: _CompactSettingsSwitch(
        value: value,
        enabled: enabled,
        onChanged: onChanged,
      ),
    );
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
              Clipboard.setData(ClipboardData(text: details));
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

  void _showPathLocationsDialog(BuildContext context) {
    final configFilePath = controller.configFilePath.value;
    final logDirPath = controller.logDirPath.value;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Path locations'),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PathLocationSection(
                label: 'Config file',
                value: configFilePath,
                emptyMessage: 'Config path is not available yet.',
              ),
              const SizedBox(height: 16),
              _PathLocationSection(
                label: 'Logs directory',
                value: logDirPath,
                emptyMessage: 'Log path is not available yet.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
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

class _CompactSettingsSwitch extends StatelessWidget {
  const _CompactSettingsSwitch({
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  final bool value;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.82,
      alignment: Alignment.centerRight,
      child: Switch(value: value, onChanged: enabled ? onChanged : null),
    );
  }
}

class _PathLocationSection extends StatelessWidget {
  const _PathLocationSection({
    required this.label,
    required this.value,
    required this.emptyMessage,
  });

  final String label;
  final String value;
  final String emptyMessage;

  @override
  Widget build(BuildContext context) {
    final hasValue = value.isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SelectableText(
                  hasValue ? value : emptyMessage,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                tooltip: 'Copy',
                visualDensity: VisualDensity.compact,
                onPressed: hasValue
                    ? () {
                        Clipboard.setData(ClipboardData(text: value));
                        SmartDialog.showToast('Path copied to clipboard');
                      }
                    : null,
                icon: const Icon(Icons.copy_all, size: 18),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

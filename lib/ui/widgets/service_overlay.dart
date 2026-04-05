import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/ui/pages/settings/relay_settings_dialog.dart';
import 'package:fungi_app/ui/widgets/help_tooltip.dart';
import 'package:get/get.dart';

/// Overlay widget that shows a message when the service is disabled
/// Only shows when the service is explicitly disabled (not connecting or failed)
class ServiceOverlay extends GetView<FungiController> {
  final Widget child;

  const ServiceOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final state = controller.daemonConnectionState.value;
      // Only show overlay when service is explicitly disabled
      final showOverlay = state.isDisabled;

      return Stack(
        children: [
          child,
          if (showOverlay)
            Positioned.fill(
              child: Container(
                color: Colors.black.withValues(alpha: 0.5),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.power_off,
                        size: 64,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            'Connect or start the daemon',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 6),
                          HelpTooltip(
                            title: 'Connection behavior',
                            message:
                                'The app first checks for a compatible fungi daemon that is already running on this device. If none is found, it can start its own daemon. If an older daemon is already running, stop it or upgrade it before trying again.',
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (controller.daemonError.value.isNotEmpty)
                        Container(
                          constraints: const BoxConstraints(maxWidth: 540),
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.amber.withValues(alpha: 0.5),
                            ),
                          ),
                          child: Text(
                            controller.daemonError.value,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          FilledButton.icon(
                            onPressed: () async {
                              await controller.startDaemon(
                                showPrivacyNotice: true,
                              );
                            },
                            icon: const Icon(Icons.play_arrow),
                            label: const Text('Connect or Start'),
                          ),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await controller.openRelaySettingsDialog();
                              if (context.mounted) {
                                await showRelaySettingsDialog(context);
                              }
                            },
                            icon: const Icon(Icons.hub),
                            label: const Text('Relay Setup'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}

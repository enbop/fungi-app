import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/ui/widgets/help_tooltip.dart';
import 'package:get/get.dart';

Future<void> showRelaySettingsDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => const _RelaySettingsDialog(),
  );
}

class _RelaySettingsDialog extends GetView<FungiController> {
  const _RelaySettingsDialog();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      insetPadding: const EdgeInsets.all(16),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 920, maxHeight: size.height - 32),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 12, 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Relay Configuration',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text('Saved immediately. Restart to apply.'),
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
            Expanded(
              child: Obx(() {
                final relayConfig = controller.relayConfig.value;

                return ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    if (controller.relayConfigError.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Text(
                          controller.relayConfigError.value,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
                    if (controller.relayConfigNotice.value.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _InfoBanner(
                          message: controller.relayConfigNotice.value,
                        ),
                      ),
                    if (controller.daemonManagedExternally.value)
                      const _InfoBanner(
                        message:
                            'External daemon. Restart it manually after changes.',
                      )
                    else
                      const _InfoBanner(
                        message: 'Restart the daemon after relay changes.',
                      ),
                    const SizedBox(height: 16),
                    Text(
                      'Relay Behavior',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      value: relayConfig.relayEnabled,
                      title: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Enable relays'),
                          SizedBox(width: 6),
                          HelpTooltip(
                            title: 'Enable relays',
                            message:
                                'Turn this off if you want fungi to avoid relay-assisted connectivity entirely.',
                          ),
                        ],
                      ),
                      onChanged: controller.setRelayEnabled,
                    ),
                    SwitchListTile(
                      value: relayConfig.useCommunityRelays,
                      title: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Use community relays'),
                          SizedBox(width: 6),
                          HelpTooltip(
                            title: 'Community relays',
                            message:
                                'Use the shared relay pool maintained for general connectivity. Turn this off if you want to rely only on your own relay addresses.',
                          ),
                        ],
                      ),
                      onChanged: controller.setUseCommunityRelays,
                    ),
                    const SizedBox(height: 16),
                    _AddressSection(
                      title: 'Custom Relays',
                      helpMessage:
                          'These relay addresses are stored in config and merged into the final relay set when relays are enabled.',
                      emptyMessage: 'No custom relays configured yet.',
                      addresses: relayConfig.customRelayAddresses,
                      trailing: FilledButton.icon(
                        onPressed: () => _showAddRelayDialog(context),
                        icon: const Icon(Icons.add),
                        label: const Text('Add Relay'),
                      ),
                      removeLabel: 'Remove',
                      onRemove: controller.removeCustomRelayAddress,
                    ),
                    const SizedBox(height: 20),
                    _EffectiveRelaySection(
                      addresses: relayConfig.effectiveRelayAddresses,
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        FilledButton.icon(
                          onPressed:
                              controller.daemonConnectionState.value.isConnected
                              ? controller.restartDaemon
                              : null,
                          icon: const Icon(Icons.restart_alt),
                          label: const Text('Restart Daemon'),
                        ),
                        OutlinedButton.icon(
                          onPressed: controller.refreshRelayConfig,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Refresh'),
                        ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAddRelayDialog(BuildContext context) async {
    final inputController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Add Custom Relay'),
        content: TextField(
          controller: inputController,
          decoration: const InputDecoration(
            labelText: 'Relay multiaddr',
            hintText: '/ip4/1.2.3.4/tcp/30001/p2p/16Uiu2...',
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final value = inputController.text.trim();
              if (value.isEmpty) {
                return;
              }
              Navigator.of(context).pop();
              await controller.addCustomRelayAddress(value);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}

class _InfoBanner extends StatelessWidget {
  const _InfoBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(message),
    );
  }
}

class _AddressSection extends StatelessWidget {
  const _AddressSection({
    required this.title,
    required this.helpMessage,
    required this.emptyMessage,
    required this.addresses,
    required this.trailing,
    required this.removeLabel,
    required this.onRemove,
  });

  final String title;
  final String helpMessage;
  final String emptyMessage;
  final List<String> addresses;
  final Widget trailing;
  final String removeLabel;
  final Future<void> Function(String address) onRemove;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final stacked = constraints.maxWidth < 520;
            if (stacked) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(width: 6),
                      HelpTooltip(title: title, message: helpMessage),
                    ],
                  ),
                  const SizedBox(height: 12),
                  trailing,
                ],
              );
            }

            return Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(width: 6),
                      HelpTooltip(title: title, message: helpMessage),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                trailing,
              ],
            );
          },
        ),
        const SizedBox(height: 12),
        if (addresses.isEmpty)
          Text(emptyMessage, style: Theme.of(context).textTheme.bodyMedium)
        else
          ...addresses.map(
            (address) => Card(
              child: ListTile(
                title: SelectableText(address),
                trailing: TextButton(
                  onPressed: () => onRemove(address),
                  child: Text(removeLabel),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _EffectiveRelaySection extends StatelessWidget {
  const _EffectiveRelaySection({required this.addresses});

  final List<dynamic> addresses;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Effective Relays',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(width: 6),
            const HelpTooltip(
              title: 'Effective relays',
              message:
                  'This is the final relay list the daemon will use after restart, including community and custom relay addresses.',
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (addresses.isEmpty)
          Text(
            'No effective relays configured.',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        else
          ...addresses.map(
            (entry) => Card(
              child: ListTile(
                title: SelectableText(entry.address),
                subtitle: Text(entry.source),
              ),
            ),
          ),
      ],
    );
  }
}

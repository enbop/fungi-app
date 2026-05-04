import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/pages/home/data_tunnel_page.dart';
import 'package:fungi_app/ui/widgets/dialogs.dart';
import 'package:fungi_app/ui/widgets/service_management_widgets.dart';
import 'package:get/get.dart';

class LocalServicesPage extends GetView<FungiController> {
  const LocalServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final services = controller.localServices;

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _PageSection(
            title: 'Local Services',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    TextButton.icon(
                      onPressed: _pickManifestAndPull,
                      icon: const Icon(Icons.add_circle),
                      label: const Text('Import YAML'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                if (controller.localServicesError.value.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      controller.localServicesError.value,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                if (controller.localServicesLoading.value)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: CircularProgressIndicator(),
                    ),
                  )
                else if (services.isEmpty)
                  const ManagementEmptyStateCard(
                    message: 'No local services pulled yet.',
                  )
                else
                  ...services.map(
                    (service) => _LocalServiceCard(service: service),
                  ),
              ],
            ),
          ),
          const _PageSectionDivider(),
          _PageSection(
            title: 'Advanced & Legacy',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Import YAML stays here, but runtime policy, raw port listening, and trusted-device controls now live behind a secondary admin view.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
                FilledButton.icon(
                  onPressed: () => _showLegacyControlsDialog(context),
                  icon: const Icon(Icons.tune),
                  label: const Text('Open Advanced & Legacy'),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Future<void> _pickManifestAndPull() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['yaml', 'yml'],
      lockParentWindow: true,
    );
    final path = result?.files.single.path;
    if (path == null || path.isEmpty) {
      return;
    }
    await controller.pullLocalServiceFromPath(path);
  }

  Future<void> _showLegacyControlsDialog(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          child: SizedBox(
            width: 960,
            height: 760,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 12, 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Advanced & Legacy',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'Runtime policy, raw networking, and trusted-device controls stay available here without taking over the main Local Services path.',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(dialogContext).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: Obx(() {
                    final runtimeConfig = controller.runtimeConfig.value;
                    final trustedDevices = controller.trustedDevices;

                    return ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        const _PageSection(
                          title: 'Port Listening',
                          child: ServerDataTunnelSection(showTitle: false),
                        ),
                        const _PageSectionDivider(),
                        _PageSection(
                          title: 'Runtime Capability',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Supported runtimes:',
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  ServiceStatusBadge(
                                    label: 'Docker',
                                    active: !runtimeConfig.disableDocker,
                                  ),
                                  ServiceStatusBadge(
                                    label: 'Wasmtime',
                                    active: !runtimeConfig.disableWasmtime,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              _SectionHeader(
                                title: 'Allowed Host Paths',
                                actionLabel: 'Add Path',
                                onAction: _showAddPathDialog,
                                compact: true,
                              ),
                              if (runtimeConfig.allowedHostPaths.isEmpty)
                                const ManagementEmptyStateCard(
                                  message:
                                      'No allowed host paths configured yet.',
                                )
                              else
                                ...runtimeConfig.allowedHostPaths.map(
                                  (path) => _CompactActionRow(
                                    title: path,
                                    subtitle:
                                        'Remote peers can access this directory.',
                                    actionLabel: 'Remove',
                                    onAction: () => _confirmRemovePath(path),
                                  ),
                                ),
                              const SizedBox(height: 12),
                              Text(
                                'Allowed ports and port ranges are no longer exposed by the current daemon API.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        const _PageSectionDivider(),
                        _PageSection(
                          title: 'Trusted Devices',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _CountBadge(
                                label: 'Devices',
                                value: trustedDevices.length,
                              ),
                              const SizedBox(height: 12),
                              _SectionHeader(
                                title: 'Trusted Devices',
                                actionLabel: 'Trust Device',
                                onAction: showTrustDeviceDialog,
                                compact: true,
                              ),
                              if (trustedDevices.isEmpty)
                                const ManagementEmptyStateCard(
                                  message:
                                      'No trusted devices have been added yet.',
                                )
                              else
                                ...trustedDevices.map(
                                  (peer) => _PeerItemCard(peer: peer),
                                ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _showAddPathDialog() async {
    final pathController = TextEditingController();
    await SmartDialog.show(
      builder: (_) => AlertDialog(
        title: const Text('Add Allowed Host Path'),
        content: TextField(
          controller: pathController,
          decoration: const InputDecoration(
            labelText: 'Host path',
            hintText: '/path/to/share',
          ),
        ),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final path = pathController.text.trim();
              if (path.isEmpty) {
                return;
              }
              SmartDialog.dismiss();
              await controller.addRuntimeAllowedHostPath(path);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmRemovePath(String path) async {
    await _showConfirmDialog(
      title: 'Remove Allowed Host Path',
      message: path,
      onConfirm: () => controller.removeRuntimeAllowedHostPath(path),
    );
  }

  Future<void> _showConfirmDialog({
    required String title,
    required String message,
    required Future<void> Function() onConfirm,
  }) async {
    await SmartDialog.show(
      builder: (_) => AlertDialog(
        title: Text(title),
        content: SelectableText(message),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              SmartDialog.dismiss();
              await onConfirm();
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}

class _LocalServiceCard extends GetView<FungiController> {
  const _LocalServiceCard({required this.service});

  final LocalServiceView service;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final theme = Theme.of(context);
      final colorScheme = theme.colorScheme;
      final pendingAction = controller.localServicePendingActions[service.name];
      final isBusy = pendingAction != null;

      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SelectionArea(
          child: ServiceManagementCard(
            accentColor: colorScheme.primary,
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  service.name,
                  style: theme.textTheme.titleMedium,
                ),
                if (service.source.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  SelectableText(
                    service.source,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ],
            ),
            badges: [
              ServiceStatusBadge(label: service.state, active: service.running),
              ServicePillLabel(label: service.runtime),
              if (service.id.isNotEmpty && service.id != service.name)
                ServicePillLabel(label: 'ID ${service.id}'),
            ],
            sections: [
              if (service.localEndpoints.isNotEmpty) ...[
                Text('Endpoints', style: theme.textTheme.labelLarge),
                const SizedBox(height: 4),
                for (final endpoint in service.localEndpoints)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: SelectableText(
                      '${endpoint.protocol} · ${endpoint.localHost}:${endpoint.localPort} -> ${endpoint.servicePort}',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
              ],
            ],
            actions: [
              ServiceActionButton(
                label: 'Start',
                isBusy: pendingAction == 'start',
                onPressed: service.running || isBusy
                    ? null
                    : () => controller.startLocalService(service.name),
              ),
              ServiceActionButton(
                label: 'Stop',
                isBusy: pendingAction == 'stop',
                onPressed: !service.running || isBusy
                    ? null
                    : () => controller.stopLocalService(service.name),
              ),
              ServiceActionButton(
                label: 'Remove',
                isBusy: pendingAction == 'remove',
                onPressed: service.running || isBusy
                    ? null
                    : () => controller.removeLocalService(service.name),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _PeerItemCard extends GetView<FungiController> {
  const _PeerItemCard({required this.peer});

  final DeviceInfo peer;

  @override
  Widget build(BuildContext context) {
    final displayName = peer.name.isNotEmpty
        ? peer.name
        : (peer.hostname.isNotEmpty ? peer.hostname : peer.peerId);

    return _ConfigItemCard(
      title: displayName,
      subtitle: peer.peerId,
      actionLabel: 'Remove',
      onAction: () => controller.removeTrustedDevice(peer.peerId),
    );
  }
}

class _ConfigItemCard extends StatelessWidget {
  const _ConfigItemCard({
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onAction,
  });

  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ManagementActionItemCard(
        title: title,
        subtitle: subtitle,
        actionLabel: actionLabel,
        onAction: onAction,
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.actionLabel,
    required this.onAction,
    this.compact = false,
  });

  final String title;
  final String actionLabel;
  final VoidCallback onAction;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: compact ? 6 : 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: compact
                  ? Theme.of(context).textTheme.titleMedium
                  : Theme.of(context).textTheme.titleLarge,
            ),
          ),
          OutlinedButton(onPressed: onAction, child: Text(actionLabel)),
        ],
      ),
    );
  }
}

class _PageSection extends StatelessWidget {
  const _PageSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}

class _PageSectionDivider extends StatelessWidget {
  const _PageSectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Divider(height: 1),
    );
  }
}

class _CompactActionRow extends StatelessWidget {
  const _CompactActionRow({
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onAction,
  });

  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: ManagementActionItemCard(
        title: title,
        subtitle: subtitle,
        actionLabel: actionLabel,
        onAction: onAction,
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return ServicePillLabel(label: '$label $value');
  }
}

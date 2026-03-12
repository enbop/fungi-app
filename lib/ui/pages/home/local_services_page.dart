import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/dialogs.dart';
import 'package:get/get.dart';

class LocalServicesPage extends GetView<FungiController> {
  const LocalServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final services = controller.localServices;
      final runtimeConfig = controller.runtimeConfig.value;
      final incomingAllowedPeers = controller.incomingAllowedPeers;

      return ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _CompactSection(
            title: 'Local Services',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO change this to a mouse hover tooltip with more details, and maybe a quick action to copy the name
                // Text(
                //   'Manage local service deployment and inspect runtime/security boundaries. YAML-path deployment is used for now.',
                //   style: Theme.of(context).textTheme.bodySmall,
                // ),
                // const SizedBox(height: 12),
                Row(
                  children: [
                    FilledButton.icon(
                      onPressed: _pickManifestAndDeploy,
                      icon: const Icon(Icons.upload_file),
                      label: const Text('Deploy YAML Path'),
                    ),
                    const SizedBox(width: 12),
                    _CountBadge(label: 'Deployed', value: services.length),
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
                  const _InlineEmptyState(
                    message: 'No local services deployed yet.',
                  )
                else
                  ...services.map(
                    (service) => _LocalServiceCard(service: service),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 24),
          _CompactSection(
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
                    _StatusBadge(
                      label: 'Docker',
                      active: !runtimeConfig.disableDocker,
                    ),
                    _StatusBadge(
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
                  const _InlineEmptyState(
                    message: 'No allowed host paths configured yet.',
                  )
                else
                  ...runtimeConfig.allowedHostPaths.map(
                    (path) => _CompactActionRow(
                      title: path,
                      subtitle: 'Shared runtime boundary for host path access.',
                      actionLabel: 'Remove',
                      onAction: () => _confirmRemovePath(path),
                    ),
                  ),
                const SizedBox(height: 12),
                _SectionHeader(
                  title: 'Allowed Ports',
                  actionLabel: 'Add Port',
                  onAction: _showAddPortDialog,
                  compact: true,
                ),
                if (runtimeConfig.allowedPorts.isEmpty)
                  const _InlineEmptyState(
                    message: 'No individually allowed ports configured yet.',
                  )
                else
                  ...runtimeConfig.allowedPorts.map(
                    (port) => _CompactActionRow(
                      title: '$port',
                      subtitle: 'Single TCP port allowed for runtime exposure.',
                      actionLabel: 'Remove',
                      onAction: () => _confirmRemovePort(port),
                    ),
                  ),
                const SizedBox(height: 12),
                _SectionHeader(
                  title: 'Allowed Port Ranges',
                  actionLabel: 'Add Range',
                  onAction: _showAddRangeDialog,
                  compact: true,
                ),
                if (runtimeConfig.allowedPortRanges.isEmpty)
                  const _InlineEmptyState(
                    message: 'No allowed port ranges configured yet.',
                  )
                else
                  ...runtimeConfig.allowedPortRanges.map(
                    (range) => _CompactActionRow(
                      title: '${range.start}-${range.end}',
                      subtitle:
                          'Continuous TCP port range allowed for runtime exposure.',
                      actionLabel: 'Remove',
                      onAction: () =>
                          _confirmRemoveRange(range.start, range.end),
                    ),
                  ),
                const SizedBox(height: 12),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _CompactSection(
            title: 'Incoming Allowed Peers',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CountBadge(label: 'Peers', value: incomingAllowedPeers.length),
                const SizedBox(height: 12),
                _SectionHeader(
                  title: 'Incoming Allowed Peers',
                  actionLabel: 'Add Peer',
                  onAction: showAddAllowedPeerDialog,
                  compact: true,
                ),
                if (incomingAllowedPeers.isEmpty)
                  const _InlineEmptyState(
                    message: 'No incoming peers have been allowed yet.',
                  )
                else
                  ...incomingAllowedPeers.map(
                    (peer) => _PeerItemCard(peer: peer),
                  ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Future<void> _pickManifestAndDeploy() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: const ['yaml', 'yml'],
      lockParentWindow: true,
    );
    final path = result?.files.single.path;
    if (path == null || path.isEmpty) {
      return;
    }
    await controller.deployLocalServiceFromPath(path);
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

  Future<void> _showAddPortDialog() async {
    final portController = TextEditingController();
    await SmartDialog.show(
      builder: (_) => AlertDialog(
        title: const Text('Add Allowed Port'),
        content: TextField(
          controller: portController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Port',
            hintText: '8080',
          ),
        ),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final port = int.tryParse(portController.text.trim());
              if (port == null) {
                return;
              }
              SmartDialog.dismiss();
              await controller.addRuntimeAllowedPort(port);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddRangeDialog() async {
    final startController = TextEditingController();
    final endController = TextEditingController();
    await SmartDialog.show(
      builder: (_) => AlertDialog(
        title: const Text('Add Allowed Port Range'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: startController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Start port',
                hintText: '3000',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: endController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'End port',
                hintText: '3999',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final start = int.tryParse(startController.text.trim());
              final end = int.tryParse(endController.text.trim());
              if (start == null || end == null || start > end) {
                return;
              }
              SmartDialog.dismiss();
              await controller.addRuntimeAllowedPortRange(start, end);
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

  Future<void> _confirmRemovePort(int port) async {
    await _showConfirmDialog(
      title: 'Remove Allowed Port',
      message: '$port',
      onConfirm: () => controller.removeRuntimeAllowedPort(port),
    );
  }

  Future<void> _confirmRemoveRange(int start, int end) async {
    await _showConfirmDialog(
      title: 'Remove Allowed Port Range',
      message: '$start-$end',
      onConfirm: () => controller.removeRuntimeAllowedPortRange(start, end),
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
        child: Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SelectionArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: SelectableText(
                          service.name,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                      // const SizedBox(width: 4),
                      // _CopyIconButton(
                      //   value: service.name,
                      //   toastMessage: 'Service name copied to clipboard',
                      // ),
                    ],
                  ),
                  if (service.source.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    SelectableText(
                      service.source,
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _StatusBadge(
                        label: service.state,
                        active: service.running,
                      ),
                      _PillLabel(label: service.runtime),
                      if (service.id.isNotEmpty && service.id != service.name)
                        _PillLabel(label: 'ID ${service.id}'),
                    ],
                  ),
                  if (service.localEndpoints.isNotEmpty) ...[
                    const SizedBox(height: 10),
                    Text('Endpoints', style: theme.textTheme.labelLarge),
                    const SizedBox(height: 4),
                    for (final endpoint in service.localEndpoints)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SelectableText(
                                '${endpoint.protocol} · ${endpoint.localHost}:${endpoint.localPort}',
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            // _CopyIconButton(
                            //   value: endpoint.protocol,
                            //   toastMessage: 'Protocol copied to clipboard',
                            //   size: 14,
                            // ),
                          ],
                        ),
                      ),
                  ],
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _AsyncActionButton(
                        label: 'Start',
                        isBusy: pendingAction == 'start',
                        onPressed: service.running || isBusy
                            ? null
                            : () => controller.startLocalService(service.name),
                      ),
                      _AsyncActionButton(
                        label: 'Stop',
                        isBusy: pendingAction == 'stop',
                        onPressed: !service.running || isBusy
                            ? null
                            : () => controller.stopLocalService(service.name),
                      ),
                      _AsyncActionButton(
                        label: 'Remove',
                        isBusy: pendingAction == 'remove',
                        onPressed: service.running || isBusy
                            ? null
                            : () => controller.removeLocalService(service.name),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _PeerItemCard extends GetView<FungiController> {
  const _PeerItemCard({required this.peer});

  final PeerInfo peer;

  @override
  Widget build(BuildContext context) {
    final displayName = peer.alias.isNotEmpty
        ? peer.alias
        : (peer.hostname.isNotEmpty ? peer.hostname : peer.peerId);

    // TODO use same style as other Remove
    return _ConfigItemCard(
      title: displayName,
      subtitle: peer.peerId,
      actionLabel: 'Remove',
      onAction: () => controller.removeIncomingAllowedPeer(peer.peerId),
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
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        child: ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 2,
          ),
          title: SelectableText(title),
          subtitle: SelectableText(subtitle),
          trailing: OutlinedButton(
            onPressed: onAction,
            child: Text(actionLabel),
          ),
        ),
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

class _CompactSection extends StatelessWidget {
  const _CompactSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).colorScheme.surfaceContainer.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).colorScheme.primaryFixed),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          child,
        ],
      ),
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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SelectableText(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 2),
                  Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            const SizedBox(width: 8),
            TextButton(onPressed: onAction, child: Text(actionLabel)),
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.label, required this.active});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = active ? colorScheme.tertiary : colorScheme.outline;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
      ),
    );
  }
}

class _PillLabel extends StatelessWidget {
  const _PillLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Text(label, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}

class _AsyncActionButton extends StatelessWidget {
  const _AsyncActionButton({
    required this.label,
    required this.isBusy,
    required this.onPressed,
  });

  final String label;
  final bool isBusy;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isBusy) ...[
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 8),
          ],
          Text(label),
        ],
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
    return _PillLabel(label: '$label $value');
  }
}

class _InlineEmptyState extends StatelessWidget {
  const _InlineEmptyState({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Text(message, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}

class _CopyIconButton extends StatelessWidget {
  const _CopyIconButton({
    required this.value,
    required this.toastMessage,
    this.size = 16,
  });

  final String value;
  final String toastMessage;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Copy',
      waitDuration: const Duration(milliseconds: 500),
      child: InkWell(
        borderRadius: BorderRadius.circular(999),
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: value));
          SmartDialog.showToast(toastMessage);
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(
            Icons.copy,
            size: size,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ),
    );
  }
}

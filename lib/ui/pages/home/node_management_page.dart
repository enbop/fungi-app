import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/dialogs.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/help_tooltip.dart';
import 'package:fungi_app/ui/widgets/node_management_dialogs.dart';
import 'package:fungi_app/ui/widgets/service_management_widgets.dart';
import 'package:fungi_app/ui/widgets/ui_primitives.dart';
import 'package:get/get.dart';

String _deviceDisplayName(DeviceInfo peer) {
  return peer.name.isNotEmpty
      ? peer.name
      : (peer.hostname.isNotEmpty ? peer.hostname : peer.peerId);
}

class NodeManagementPage extends StatefulWidget {
  const NodeManagementPage({super.key});

  @override
  State<NodeManagementPage> createState() => _NodeManagementPageState();
}

class _NodeManagementPageState extends State<NodeManagementPage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<FungiController>();
  final _scrollController = ScrollController(keepScrollOffset: false);
  final _expandedPeerIds = <String>{};

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() {
      final peers = controller.addressBook;
      return ListView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      'Devices',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(width: 6),
                    const HelpTooltip(
                      title: 'Devices',
                      message:
                          'Shows saved devices, connection state, trusted devices, and a compact service summary.',
                    ),
                  ],
                ),
              ),
              InlineAddButton(
                onPressed: () => showNodeEditorDialog(),
                label: 'Add',
              ),
              const SizedBox(width: 4),
              IconButton(
                onPressed: controller.nodeManagementLoading.value
                    ? null
                    : controller.refreshNodeManagementData,
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (controller.nodeManagementLoading.value && peers.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: CircularProgressIndicator(),
              ),
            )
          else if (peers.isEmpty)
            const _NodeEmptyState()
          else
            ...peers.map(
              (peer) => _PeerCard(
                key: ValueKey(peer.peerId),
                peer: peer,
                expanded: _expandedPeerIds.contains(peer.peerId),
                onExpansionChanged: (expanded) {
                  setState(() {
                    if (expanded) {
                      _expandedPeerIds.add(peer.peerId);
                    } else {
                      _expandedPeerIds.remove(peer.peerId);
                    }
                  });
                },
              ),
            ),
          const SizedBox(height: 12),
          const _TrustedDevicesSection(),
        ],
      );
    });
  }
}

class _PeerCard extends GetView<FungiController> {
  const _PeerCard({
    super.key,
    required this.peer,
    required this.expanded,
    required this.onExpansionChanged,
  });

  final DeviceInfo peer;
  final bool expanded;
  final ValueChanged<bool> onExpansionChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final connections = controller.connectionsForPeer(peer.peerId);
      final managedServices = controller.managedServicesForPeer(peer.peerId);
      final isRefreshing = controller.isPeerManagedServicesLoading(peer.peerId);
      final refreshError = controller.peerManagedServicesError(peer.peerId);
      final latency = controller.bestLatencyForPeer(peer.peerId);
      final title = _deviceDisplayName(peer);

      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: EnhancedCard(
          child: ExpansionTile(
            initiallyExpanded: expanded,
            maintainState: true,
            onExpansionChanged: onExpansionChanged,
            title: Text(title),
            trailing: Wrap(
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Device details',
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => _DeviceDetailsSheet(
                      peer: peer,
                      connections: connections,
                      latency: latency,
                      refreshError: refreshError,
                    ),
                  ),
                  icon: const Icon(Icons.info_outline),
                ),
                IconButton(
                  tooltip: 'Edit device',
                  onPressed: () => showNodeEditorDialog(initialPeer: peer),
                  icon: const Icon(Icons.edit_outlined),
                ),
                IconButton(
                  tooltip: 'Refresh device',
                  onPressed: isRefreshing
                      ? null
                      : () => controller.refreshPeerManagedServicesData(
                          peerId: peer.peerId,
                        ),
                  icon: isRefreshing
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.refresh),
                ),
                const Icon(Icons.expand_more),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                if (peer.hostname.isNotEmpty && peer.hostname != title)
                  Text(
                    peer.hostname,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    ServiceStatusBadge(
                      label: connections.isEmpty ? 'Offline' : 'Connected',
                      active: connections.isNotEmpty,
                    ),
                    ServicePillLabel(
                      label: '${managedServices.length} services',
                    ),
                    if (isRefreshing)
                      const ServicePillLabel(label: 'Refreshing'),
                    if (refreshError.isNotEmpty)
                      const AttentionBadge(label: 'Needs attention'),
                  ],
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              if (isRefreshing) ...[
                const LinearProgressIndicator(),
                const SizedBox(height: 12),
              ],
              if (refreshError.isNotEmpty && managedServices.isEmpty) ...[
                const _DeviceRefreshNotice(),
                const SizedBox(height: 12),
              ],
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Services',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 8),
              if (managedServices.isNotEmpty) ...[
                const SizedBox(height: 8),
                _ManagedServicesCompactList(services: managedServices),
              ] else ...[
                const SizedBox(height: 8),
                Text(
                  'No managed services on this device yet.',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}

class _DeviceRefreshNotice extends StatelessWidget {
  const _DeviceRefreshNotice();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'Services could not be refreshed. Open Details for diagnostic information.',
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: colorScheme.onErrorContainer),
      ),
    );
  }
}

class _DeviceDetailsSheet extends StatelessWidget {
  const _DeviceDetailsSheet({
    required this.peer,
    required this.connections,
    required this.latency,
    required this.refreshError,
  });

  final DeviceInfo peer;
  final List<ConnectionSnapshot> connections;
  final int? latency;
  final String refreshError;

  @override
  Widget build(BuildContext context) {
    final title = _deviceDisplayName(peer);

    return SafeArea(
      child: FractionallySizedBox(
        heightFactor: 0.85,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 4),
              Text(
                'Device details',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    _DeviceDetailRow(label: 'Device ID', value: peer.peerId),
                    if (peer.hostname.isNotEmpty)
                      _DeviceDetailRow(label: 'Hostname', value: peer.hostname),
                    if (peer.os.isNotEmpty)
                      _DeviceDetailRow(label: 'OS', value: peer.os),
                    if (peer.version.isNotEmpty)
                      _DeviceDetailRow(label: 'Version', value: peer.version),
                    if (peer.publicIp.isNotEmpty)
                      _DeviceDetailRow(
                        label: 'Public IP',
                        value: peer.publicIp,
                      ),
                    if (peer.privateIps.isNotEmpty)
                      _DeviceDetailRow(
                        label: 'Private IPs',
                        value: peer.privateIps.join(', '),
                      ),
                    _DeviceDetailRow(
                      label: 'Connection State',
                      value: connections.isEmpty ? 'Offline' : 'Connected',
                    ),
                    _DeviceDetailRow(
                      label: 'Connections',
                      value: '${connections.length}',
                    ),
                    if (latency != null)
                      _DeviceDetailRow(
                        label: 'Best Latency',
                        value: '$latency ms',
                      ),
                    if (peer.multiaddrs.isNotEmpty)
                      _DeviceDetailRow(
                        label: 'Multiaddrs',
                        value: peer.multiaddrs.join('\n'),
                      ),
                    if (refreshError.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        'Last Refresh Error',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.errorContainer,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SelectableText(
                          refreshError,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onErrorContainer,
                              ),
                        ),
                      ),
                    ],
                    if (connections.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Text(
                        'Connections',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      ...connections.map(
                        (connection) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: ManagementItemCard(
                            borderRadius: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: [
                                    ServicePillLabel(
                                      label: connection.direction,
                                    ),
                                    ServicePillLabel(
                                      label: connection.isRelay
                                          ? 'Relay'
                                          : 'Direct',
                                    ),
                                    if (connection.hasLastRttMs())
                                      ServicePillLabel(
                                        label: '${connection.lastRttMs} ms',
                                      ),
                                    if (connection.activeStreamsTotal > 0)
                                      ServicePillLabel(
                                        label:
                                            '${connection.activeStreamsTotal} streams',
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                SelectableText(
                                  connection.remoteAddr,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DeviceDetailRow extends StatelessWidget {
  const _DeviceDetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          SelectableText(value, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}

class _NodeEmptyState extends GetView<FungiController> {
  const _NodeEmptyState();

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'No known devices yet.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'Add a device manually or discover one with mDNS. Once a device is saved, its services can be managed from Service.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FilledButton.icon(
                  onPressed: () => showNodeEditorDialog(),
                  icon: const Icon(Icons.add_link),
                  label: const Text('Add Device'),
                ),
                OutlinedButton.icon(
                  onPressed: () => showNodeEditorDialog(),
                  icon: const Icon(Icons.devices),
                  label: const Text('Discover via mDNS'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ManagedServicesCompactList extends StatelessWidget {
  const _ManagedServicesCompactList({required this.services});

  final List<LocalServiceView> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: services.asMap().entries.map((entry) {
        final service = entry.value;
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              top: entry.key == 0
                  ? BorderSide.none
                  : BorderSide(
                      color: Theme.of(
                        context,
                      ).dividerColor.withValues(alpha: 0.45),
                    ),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  service.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                alignment: WrapAlignment.end,
                children: [
                  ServiceStatusBadge(
                    label: service.running ? 'Running' : service.state,
                    active: service.running,
                  ),
                  ServicePillLabel(label: service.runtime),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _TrustedDevicesSection extends GetView<FungiController> {
  const _TrustedDevicesSection();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final trustedDevices = controller.trustedDevices;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(height: 28),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Trusted Devices',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              InlineAddButton(onPressed: showTrustDeviceDialog, label: 'Trust'),
            ],
          ),
          const SizedBox(height: 10),
          if (trustedDevices.isEmpty)
            Text(
              'No trusted devices have been added yet.',
              style: Theme.of(context).textTheme.bodySmall,
            )
          else
            ...trustedDevices.map((peer) {
              final displayName = _deviceDisplayName(peer);
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ManagementActionItemCard(
                  title: displayName,
                  subtitle: peer.peerId,
                  actionLabel: 'Untrust',
                  onAction: () => controller.removeTrustedDevice(peer.peerId),
                ),
              );
            }),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/fungi_daemon_compat.dart';
import 'package:fungi_app/ui/widgets/create_service_dialog.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/help_tooltip.dart';
import 'package:fungi_app/ui/widgets/node_management_dialogs.dart';
import 'package:fungi_app/ui/widgets/service_management_widgets.dart';
import 'package:get/get.dart';

String _deviceDisplayName(PeerInfo peer) {
  return peer.alias.isNotEmpty
      ? peer.alias
      : (peer.hostname.isNotEmpty ? peer.hostname : peer.peerId);
}

String _remoteServiceReference(PeerInfo peer, LocalServiceView service) {
  final serviceName = service.name.trim();
  if (serviceName.isEmpty) {
    return _deviceDisplayName(peer);
  }

  if (serviceName.contains('@')) {
    return serviceName;
  }

  return '$serviceName@${_deviceDisplayName(peer)}';
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
                          'Shows your saved devices and lets you manage the services running on them.',
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: controller.nodeManagementLoading.value
                    ? null
                    : controller.refreshNodeManagementData,
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => showNodeEditorDialog(),
              icon: const Icon(Icons.add_circle),
              label: const Text('Add Device'),
            ),
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

  final PeerInfo peer;
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
                    Chip(
                      label: Text(
                        connections.isEmpty ? 'offline' : 'connected',
                      ),
                    ),
                    Chip(label: Text('${managedServices.length} services')),
                    if (isRefreshing) const Chip(label: Text('refreshing')),
                    if (refreshError.isNotEmpty)
                      Chip(
                        avatar: const Icon(Icons.error_outline, size: 18),
                        label: const Text('needs attention'),
                        backgroundColor: Theme.of(
                          context,
                        ).colorScheme.errorContainer,
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
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
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => showCreateServiceDialog(
                    context,
                    initialPeer: peer,
                  ),
                  icon: const Icon(Icons.add_circle),
                  label: const Text('Create Service'),
                ),
              ),
              if (managedServices.isNotEmpty) ...[
                const SizedBox(height: 8),
                ...managedServices.map(
                  (service) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _RemoteServiceCard(peer: peer, service: service),
                  ),
                ),
              ] else ...[
                const SizedBox(height: 8),
                const ManagementEmptyStateCard(
                  message: 'No managed services on this device yet.',
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

  final PeerInfo peer;
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
                                    Chip(label: Text(connection.direction)),
                                    Chip(
                                      label: Text(
                                        connection.isRelay ? 'relay' : 'direct',
                                      ),
                                    ),
                                    if (connection.hasLastRttMs())
                                      Chip(
                                        label: Text(
                                          '${connection.lastRttMs} ms',
                                        ),
                                      ),
                                    if (connection.activeStreamsTotal > 0)
                                      Chip(
                                        label: Text(
                                          '${connection.activeStreamsTotal} streams',
                                        ),
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
              'Add a device manually or discover one with mDNS. Once a device is saved, you can manage the services running on it.',
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

class _RemoteServiceCard extends GetView<FungiController> {
  const _RemoteServiceCard({required this.peer, required this.service});

  final PeerInfo peer;
  final LocalServiceView service;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final serviceReference = _remoteServiceReference(peer, service);
      final actionKey = controller.remoteServiceActionKey(
        peer.peerId,
        service.name,
      );
      final pendingAction = controller.remoteServicePendingActions[actionKey];
      final isBusy = pendingAction != null;

      return ServiceManagementCard(
        accentColor: Theme.of(context).colorScheme.secondary,
        header: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              serviceReference,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            if (service.source.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                service.source,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
        ),
        badges: [
          const ServicePillLabel(label: 'Remote'),
          ServiceStatusBadge(label: service.state, active: service.running),
          ServicePillLabel(label: service.runtime),
          ServicePillLabel(label: '${service.localEndpoints.length} endpoints'),
        ],
        sections: [
          if (service.localEndpoints.isNotEmpty) ...[
            Text(
              'Exposed Endpoints',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 4),
            ...service.localEndpoints.map(
              (endpoint) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: SelectableText(
                  '${endpoint.protocol} · ${endpoint.localHost}:${endpoint.localPort}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
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
                : () => controller.startRemoteService(
                    peerId: peer.peerId,
                    serviceName: service.name,
                  ),
          ),
          ServiceActionButton(
            label: 'Stop',
            isBusy: pendingAction == 'stop',
            onPressed: !service.running || isBusy
                ? null
                : () => controller.stopRemoteService(
                    peerId: peer.peerId,
                    serviceName: service.name,
                  ),
          ),
          ServiceActionButton(
            label: 'Remove',
            isBusy: pendingAction == 'remove',
            onPressed: service.running || isBusy
                ? null
                : () => controller.removeRemoteService(
                    peerId: peer.peerId,
                    serviceName: service.name,
                  ),
          ),
        ],
      );
    });
  }
}

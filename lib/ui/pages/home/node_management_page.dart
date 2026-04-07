import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/help_tooltip.dart';
import 'package:fungi_app/ui/widgets/node_management_dialogs.dart';
import 'package:fungi_app/ui/widgets/service_management_widgets.dart';
import 'package:fungi_app/ui/widgets/text.dart';
import 'package:get/get.dart';

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
                    Text('Peers', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(width: 6),
                    const HelpTooltip(
                      title: 'Peers',
                      message:
                          'Shows peers from the address book, their connection state, and manage their services.',
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
              label: const Text('Add Peer'),
            ),
          ),
          const SizedBox(height: 16),
          if (controller.nodeManagementLoading.value)
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
      final latency = controller.bestLatencyForPeer(peer.peerId);
      final title = peer.alias.isNotEmpty
          ? peer.alias
          : (peer.hostname.isNotEmpty ? peer.hostname : peer.peerId);

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
                  tooltip: 'Edit peer',
                  onPressed: () => showNodeEditorDialog(initialPeer: peer),
                  icon: const Icon(Icons.edit_outlined),
                ),
                const Icon(Icons.expand_more),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                TruncatedId(id: peer.peerId),
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
                    Chip(label: Text('${connections.length} connections')),
                    Chip(label: Text('${managedServices.length} services')),
                    if (latency != null) Chip(label: Text('$latency ms')),
                  ],
                ),
              ],
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  children: [
                    if (peer.hostname.isNotEmpty)
                      Chip(label: Text(peer.hostname)),
                    if (peer.os.isNotEmpty) Chip(label: Text(peer.os)),
                    if (peer.version.isNotEmpty)
                      Chip(label: Text('v${peer.version}')),
                    if (peer.publicIp.isNotEmpty)
                      Chip(label: Text(peer.publicIp)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
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
                  onPressed: () => showRemoteServicePullDialog(peer: peer),
                  icon: const Icon(Icons.add_circle),
                  label: const Text('Add Service'),
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
                  message: 'No managed services on this peer yet.',
                ),
              ],
              if (connections.isNotEmpty) ...[
                const SizedBox(height: 12),
                const ManagementSectionTitle(title: 'Connections'),
                ...connections.map(
                  (connection) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ManagementItemCard(
                      borderRadius: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              runAlignment: WrapAlignment.start,
                              children: [
                                Chip(label: Text(connection.direction)),
                                Chip(
                                  label: Text(
                                    connection.isRelay ? 'relay' : 'direct',
                                  ),
                                ),
                                if (connection.hasLastRttMs())
                                  Chip(
                                    label: Text('${connection.lastRttMs} ms'),
                                  ),
                                if (connection.activeStreamsTotal > 0)
                                  Chip(
                                    label: Text(
                                      '${connection.activeStreamsTotal} streams',
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
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
      );
    });
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
              'No known peers yet.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'Add a peer manually or discover one with mDNS. Once a peer is saved, you can inspect its services and try adding a service manifest to it.',
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
                  label: const Text('Add Peer'),
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
            Text(service.name, style: Theme.of(context).textTheme.titleMedium),
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
          ServiceStatusBadge(label: service.state, active: service.running),
          ServicePillLabel(label: service.runtime),
          if (service.id.isNotEmpty && service.id != service.name)
            ServicePillLabel(label: 'ID ${service.id}'),
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

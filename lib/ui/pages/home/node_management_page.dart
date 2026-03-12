import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/text.dart';
import 'package:get/get.dart';

class NodeManagementPage extends GetView<FungiController> {
  const NodeManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final peers = controller.addressBook;
      return RefreshIndicator(
        onRefresh: controller.refreshNodeManagementData,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Node Management',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Known peers from address_book, plus current connection state and discovered services.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: controller.nodeManagementLoading.value
                      ? null
                      : controller.refreshNodeManagementData,
                  icon: const Icon(Icons.refresh),
                ),
              ],
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
              Text(
                'No known nodes yet.',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            else
              ...peers.map((peer) => _PeerCard(peer: peer)),
          ],
        ),
      );
    });
  }
}

class _PeerCard extends GetView<FungiController> {
  const _PeerCard({required this.peer});

  final PeerInfo peer;

  @override
  Widget build(BuildContext context) {
    final connections = controller.connectionsForPeer(peer.peerId);
    final discoveredServices = controller.servicesForPeer(peer.peerId);
    final latency = controller.bestLatencyForPeer(peer.peerId);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EnhancedCard(
        child: ExpansionTile(
          title: Text(
            peer.alias.isNotEmpty
                ? peer.alias
                : (peer.hostname.isNotEmpty ? peer.hostname : peer.peerId),
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
                children: [
                  Chip(
                    label: Text(connections.isEmpty ? 'offline' : 'connected'),
                  ),
                  Chip(label: Text('${connections.length} connections')),
                  Chip(label: Text('${discoveredServices.length} services')),
                  if (latency != null) Chip(label: Text('$latency ms')),
                ],
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            if (peer.version.isNotEmpty) Text('Version: ${peer.version}'),
            if (peer.os.isNotEmpty) Text('OS: ${peer.os}'),
            if (peer.publicIp.isNotEmpty) Text('Public IP: ${peer.publicIp}'),
            if (connections.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                'Connections',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              ...connections.map(
                (connection) => Text(
                  '${connection.direction} · ${connection.remoteAddr}${connection.hasLastRttMs() ? ' · $connection.lastRttMs ms' : ''}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
            if (discoveredServices.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                'Discovered Services',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              ...discoveredServices.map(
                (service) => Text(
                  '${service.serviceName} · ${service.runtime} · ${service.availableEndpoints.length} endpoints',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

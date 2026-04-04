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
                        'Known peers from the address book, plus connection state and published catalog services.',
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
    final catalogServices = controller.servicesForPeer(peer.peerId);
    final latency = controller.bestLatencyForPeer(peer.peerId);
    final title = peer.alias.isNotEmpty
        ? peer.alias
        : (peer.hostname.isNotEmpty ? peer.hostname : peer.peerId);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EnhancedCard(
        child: ExpansionTile(
          title: Text(title),
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
                  Chip(label: Text('${catalogServices.length} services')),
                  if (latency != null) Chip(label: Text('$latency ms')),
                ],
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                if (peer.hostname.isNotEmpty) Chip(label: Text(peer.hostname)),
                if (peer.os.isNotEmpty) Chip(label: Text(peer.os)),
                if (peer.version.isNotEmpty)
                  Chip(label: Text('v${peer.version}')),
                if (peer.publicIp.isNotEmpty) Chip(label: Text(peer.publicIp)),
              ],
            ),
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
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                    ),
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
                              Chip(label: Text('${connection.lastRttMs} ms')),
                            if (connection.activeStreamsTotal > 0)
                              Chip(
                                label: Text(
                                  '${connection.activeStreamsTotal} streams',
                                ),
                              ),
                          ],
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
            if (catalogServices.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(
                'Published Services',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              ...catalogServices.map(
                (service) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.displayName,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              '${service.usageKind ?? service.transportKind} · ${service.runtime} · ${service.publishedEndpoints.length} endpoints',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      if (service.running) Chip(label: const Text('running')),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

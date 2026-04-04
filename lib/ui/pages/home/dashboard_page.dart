import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<FungiController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sections = controller.availableServiceSections;
      final quickEntries = <_DashboardCatalogEntry>[];

      for (final section in sections) {
        final peerLabel = section.alias?.isNotEmpty == true
            ? section.alias!
            : (section.hostname?.isNotEmpty == true
                  ? section.hostname!
                  : section.peerId);
        for (final service in section.services) {
          if (service.isWeb || service.isTcp) {
            quickEntries.add(
              _DashboardCatalogEntry(
                peerId: section.peerId,
                peerLabel: peerLabel,
                service: service,
              ),
            );
          }
        }
      }

      quickEntries.sort((left, right) {
        final webPriority =
            (right.service.isWeb ? 1 : 0) - (left.service.isWeb ? 1 : 0);
        if (webPriority != 0) {
          return webPriority;
        }
        final attached =
            (right.service.accessAttached ? 1 : 0) -
            (left.service.accessAttached ? 1 : 0);
        if (attached != 0) {
          return attached;
        }
        final running =
            (right.service.running ? 1 : 0) - (left.service.running ? 1 : 0);
        if (running != 0) {
          return running;
        }
        return left.service.displayName.compareTo(right.service.displayName);
      });

      final connectedPeers = controller.addressBook
          .where(
            (peer) => controller.connectionsForPeer(peer.peerId).isNotEmpty,
          )
          .length;
      final attachedCount = sections
          .expand((section) => section.services)
          .where((service) => service.accessAttached)
          .length;

      return RefreshIndicator(
        onRefresh: () async {
          await controller.refreshNodeManagementData();
          await controller.refreshAvailableServicesData();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text('Home', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            Text(
              'Quick access to published services from known peers. Web services can open directly in the browser, and TCP services can expose local access endpoints.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _SummaryChip(
                  label: 'Peers',
                  value: controller.addressBook.length,
                ),
                _SummaryChip(label: 'Connected', value: connectedPeers),
                _SummaryChip(
                  label: 'Catalog',
                  value: sections.fold(
                    0,
                    (sum, section) => sum + section.services.length,
                  ),
                ),
                _SummaryChip(label: 'Attached', value: attachedCount),
                _SummaryChip(
                  label: 'Local',
                  value: controller.localServices.length,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'Quick Access',
              subtitle:
                  'Use the same list for direct web opening and TCP access attachment. The available action depends on the published service type.',
            ),
            if (quickEntries.isEmpty)
              const _EmptyPanel(message: 'No published services available yet.')
            else
              ...quickEntries
                  .take(12)
                  .map((entry) => _QuickServiceCard(entry: entry)),
          ],
        ),
      );
    });
  }
}

class _DashboardCatalogEntry {
  const _DashboardCatalogEntry({
    required this.peerId,
    required this.peerLabel,
    required this.service,
  });

  final String peerId;
  final String peerLabel;
  final RemoteServiceListEntryView service;
}

class _SummaryChip extends StatelessWidget {
  const _SummaryChip({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text('$label $value'));
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 4),
          Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _EmptyPanel extends StatelessWidget {
  const _EmptyPanel({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}

class _QuickServiceCard extends GetView<FungiController> {
  const _QuickServiceCard({required this.entry});

  final _DashboardCatalogEntry entry;

  @override
  Widget build(BuildContext context) {
    final service = entry.service;
    final launchUri = service.isWeb
        ? controller.catalogWebLaunchUri(service)
        : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EnhancedCard(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      service.displayName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Chip(label: Text(service.usageKind ?? service.transportKind)),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                entry.peerLabel,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text(service.runtime)),
                  Chip(
                    label: Text(
                      service.accessAttached
                          ? 'Access attached'
                          : 'Access not attached',
                    ),
                  ),
                ],
              ),
              if (launchUri != null) ...[
                const SizedBox(height: 6),
                SelectableText(
                  launchUri.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (service.isWeb)
                    FilledButton.icon(
                      onPressed: service.serviceId == null
                          ? null
                          : () => controller.openCatalogWebService(
                              peerId: entry.peerId,
                              serviceId: service.serviceId!,
                            ),
                      icon: const Icon(Icons.open_in_new),
                      label: const Text('Open'),
                    ),
                  if (!service.accessAttached && service.serviceId != null)
                    OutlinedButton.icon(
                      onPressed: () => controller.attachCatalogServiceAccess(
                        peerId: entry.peerId,
                        serviceId: service.serviceId!,
                      ),
                      icon: const Icon(Icons.link),
                      label: Text(service.isWeb ? 'Attach Only' : 'Attach'),
                    ),
                  if (service.accessAttached && service.serviceId != null)
                    OutlinedButton.icon(
                      onPressed: () => controller.detachCatalogServiceAccess(
                        peerId: entry.peerId,
                        serviceId: service.serviceId!,
                      ),
                      icon: const Icon(Icons.link_off),
                      label: const Text('Detach'),
                    ),
                ],
              ),
              if (!service.isWeb &&
                  service.localAccessEndpoints.isNotEmpty) ...[
                const SizedBox(height: 10),
                ...service.localAccessEndpoints.map(
                  (endpoint) => Text(
                    '${endpoint.name} -> ${endpoint.localHost}:${endpoint.localPort} [${endpoint.protocol}]',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

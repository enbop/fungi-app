import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/ui/pages/home/available_services_page.dart';
import 'package:fungi_app/ui/pages/home/data_tunnel_page.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/service_icon.dart';
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
            const SizedBox(height: 20),
            _SectionHeader(
              title: 'Catalog',
              subtitle:
                  'Open the full remote catalog when you need configuration details, endpoint information, and attach or detach controls.',
            ),
            _CatalogEntryCard(
              onOpen: () => _showCatalogDialog(context),
              serviceCount: sections.fold(
                0,
                (sum, section) => sum + section.services.length,
              ),
            ),
            const SizedBox(height: 20),
            const _SectionHeader(
              title: 'Client Data Tunnel',
              subtitle:
                  'Create raw client-side forwarding rules for cases that are not modeled as services yet.',
            ),
            const ClientDataTunnelSection(showTitle: false),
          ],
        ),
      );
    });
  }

  void _showCatalogDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: SizedBox(
          width: 980,
          height: 760,
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
                            'Catalog',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Browse published services from known peers and manage local access entries.',
                          ),
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
              const Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: PublishedServicesSection(showHeader: false),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EnhancedCard(
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          leading: ServiceIcon(
            iconUrl: service.iconUrl,
            fallbackLabel: service.displayName,
          ),
          title: Text(
            service.displayName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            entry.peerLabel,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          trailing: _QuickAccessActions(entry: entry),
          children: [_QuickServiceDetails(entry: entry)],
        ),
      ),
    );
  }
}

class _QuickAccessActions extends GetView<FungiController> {
  const _QuickAccessActions({required this.entry});

  final _DashboardCatalogEntry entry;

  @override
  Widget build(BuildContext context) {
    final service = entry.service;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (service.isWeb && service.serviceId != null)
          FilledButton(
            onPressed: () => controller.openCatalogWebService(
              peerId: entry.peerId,
              serviceId: service.serviceId!,
            ),
            child: const Text('Open'),
          ),
        const SizedBox(width: 8),
        const Icon(Icons.expand_more),
      ],
    );
  }
}

class _QuickServiceDetails extends GetView<FungiController> {
  const _QuickServiceDetails({required this.entry});

  final _DashboardCatalogEntry entry;

  @override
  Widget build(BuildContext context) {
    final service = entry.service;
    final launchUri = service.isWeb
        ? controller.catalogWebLaunchUri(service)
        : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(label: Text(service.usageKind ?? service.transportKind)),
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
        const SizedBox(height: 10),
        Text(
          'State: ${service.state}${service.running ? ' • running' : ''}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        if (service.serviceId != null && service.serviceId!.isNotEmpty) ...[
          const SizedBox(height: 6),
          SelectableText(
            service.serviceId!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        if (launchUri != null) ...[
          const SizedBox(height: 8),
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
            if (!service.isWeb &&
                !service.accessAttached &&
                service.serviceId != null)
              OutlinedButton.icon(
                onPressed: () => controller.attachCatalogServiceAccess(
                  peerId: entry.peerId,
                  serviceId: service.serviceId!,
                ),
                icon: const Icon(Icons.link),
                label: const Text('Attach'),
              ),
            if (service.isWeb &&
                !service.accessAttached &&
                service.serviceId != null)
              OutlinedButton.icon(
                onPressed: () => controller.attachCatalogServiceAccess(
                  peerId: entry.peerId,
                  serviceId: service.serviceId!,
                ),
                icon: const Icon(Icons.link),
                label: const Text('Attach Only'),
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
        if (service.localAccessEndpoints.isNotEmpty) ...[
          const SizedBox(height: 10),
          ...service.localAccessEndpoints.map(
            (endpoint) => Text(
              '${endpoint.name} -> ${endpoint.localHost}:${endpoint.localPort} [${endpoint.protocol}]',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ],
    );
  }
}

class _CatalogEntryCard extends StatelessWidget {
  const _CatalogEntryCard({required this.onOpen, required this.serviceCount});

  final VoidCallback onOpen;
  final int serviceCount;

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Catalog',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$serviceCount published services are currently available across known peers.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            FilledButton.icon(
              onPressed: onOpen,
              icon: const Icon(Icons.tune),
              label: const Text('Open Catalog'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/service_icon.dart';
import 'package:fungi_app/ui/widgets/text.dart';
import 'package:get/get.dart';

class AvailableServicesPage extends GetView<FungiController> {
  const AvailableServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: controller.refreshAvailableServicesData,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [PublishedServicesSection()],
        ),
      );
    });
  }
}

class PublishedServicesSection extends GetView<FungiController> {
  const PublishedServicesSection({
    super.key,
    this.showHeader = true,
    this.title = 'Catalog',
    this.subtitle =
        'Browse published services from known peers and reuse local access entries when available.',
  });

  final bool showHeader;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sections = controller.availableServiceSections;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showHeader)
            _SectionHeader(
              title: title,
              subtitle: subtitle,
              trailing: IconButton(
                onPressed: controller.availableServicesLoading.value
                    ? null
                    : controller.refreshAvailableServicesData,
                icon: const Icon(Icons.refresh),
              ),
            ),
          if (controller.availableServicesError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                controller.availableServicesError.value,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          if (controller.availableServicesLoading.value)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: CircularProgressIndicator(),
              ),
            )
          else if (sections.isEmpty)
            Text(
              'No published peer services found yet.',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          else
            ...sections.map(
              (section) => _PeerServicesSection(section: section),
            ),
        ],
      );
    });
  }
}

class _PeerServicesSection extends StatelessWidget {
  const _PeerServicesSection({required this.section});

  final PeerServicesSectionView section;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FungiController>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      section.alias?.isNotEmpty == true
                          ? section.alias!
                          : (section.hostname?.isNotEmpty == true
                                ? section.hostname!
                                : section.peerId),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 4),
                    TruncatedId(id: section.peerId),
                  ],
                ),
              ),
              Chip(label: Text('${section.services.length} services')),
            ],
          ),
          const SizedBox(height: 10),
          ...section.services.map(
            (service) => EnhancedCard(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ServiceIcon(
                          iconUrl: service.iconUrl,
                          fallbackLabel: service.displayName,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service.displayName,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                section.alias?.isNotEmpty == true
                                    ? section.alias!
                                    : (section.hostname?.isNotEmpty == true
                                          ? section.hostname!
                                          : section.peerId),
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Chip(label: Text(service.runtime)),
                      ],
                    ),
                    if (service.serviceId != null &&
                        service.serviceId!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SelectableText(
                              service.serviceId!,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            if (service.catalogId != null &&
                                service.catalogId!.isNotEmpty)
                              Text(
                                'Catalog ID: ${service.catalogId!}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        Chip(
                          label: Text(
                            service.usageKind ?? service.transportKind,
                          ),
                        ),
                        if (!service.isWeb)
                          Chip(
                            label: Text(
                              service.accessAttached
                                  ? 'TCP attached'
                                  : 'TCP not attached',
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'State: ${service.state}${service.running ? ' • running' : ''}',
                    ),
                    Text(
                      service.accessAttached
                          ? 'Local access attached'
                          : 'No local access attached',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    if (service.serviceId != null &&
                        service.serviceId!.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (service.isWeb)
                            FilledButton.icon(
                              onPressed: () => controller.openCatalogWebService(
                                peerId: section.peerId,
                                serviceId: service.serviceId!,
                              ),
                              icon: const Icon(Icons.open_in_new),
                              label: const Text('Open'),
                            ),
                          if (!service.accessAttached)
                            OutlinedButton.icon(
                              onPressed: () =>
                                  controller.attachCatalogServiceAccess(
                                    peerId: section.peerId,
                                    serviceId: service.serviceId!,
                                  ),
                              icon: const Icon(Icons.link),
                              label: Text(
                                service.isWeb ? 'Attach Only' : 'Attach',
                              ),
                            )
                          else
                            OutlinedButton.icon(
                              onPressed: () =>
                                  controller.detachCatalogServiceAccess(
                                    peerId: section.peerId,
                                    serviceId: service.serviceId!,
                                  ),
                              icon: const Icon(Icons.link_off),
                              label: const Text('Detach'),
                            ),
                        ],
                      ),
                    ],
                    if (service.publishedEndpoints.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Published Endpoints',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      ...service.publishedEndpoints.map(
                        (endpoint) => Text(
                          '${endpoint.name} · ${endpoint.protocol} · service:${endpoint.servicePort}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                    if (service.localAccessEndpoints.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Local Access Endpoints',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      ...service.localAccessEndpoints.map(
                        (endpoint) => Text(
                          '${endpoint.name} -> ${endpoint.localHost}:${endpoint.localPort} [${endpoint.protocol}]',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                    if (service.isWeb) ...[
                      if (controller.catalogWebLaunchUri(service) != null) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Open URL',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        SelectableText(
                          controller.catalogWebLaunchUri(service)!.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  final String title;
  final String subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 6),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}

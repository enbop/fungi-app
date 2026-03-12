import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/text.dart';
import 'package:get/get.dart';

class AvailableServicesPage extends GetView<FungiController> {
  const AvailableServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sections = controller.availableServiceSections;
      return RefreshIndicator(
        onRefresh: controller.refreshAvailableServicesData,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _SectionHeader(
              title: 'Available Services',
              subtitle:
                  'Browse services discovered from known peers. This first pass groups by peer.',
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
                'No peer services discovered yet.',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            else
              ...sections.map(
                (section) => _PeerServicesSection(section: section),
              ),
          ],
        ),
      );
    });
  }
}

class _PeerServicesSection extends StatelessWidget {
  const _PeerServicesSection({required this.section});

  final PeerServicesSectionView section;

  @override
  Widget build(BuildContext context) {
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
                      children: [
                        Expanded(
                          child: Text(
                            service.serviceName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                        Chip(label: Text(service.runtime)),
                      ],
                    ),
                    if (service.serviceId != null &&
                        service.serviceId!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: SelectableText(
                          service.serviceId!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      'State: ${service.state}${service.running ? ' • running' : ''}',
                    ),
                    if (service.availableEndpoints.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Endpoints',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      ...service.availableEndpoints.map(
                        (endpoint) => Text(
                          '${endpoint.name} · ${endpoint.protocol} · service:${endpoint.servicePort}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                    if (service.localForwardedEndpoints.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        'Forwarded Locally',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      ...service.localForwardedEndpoints.map(
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

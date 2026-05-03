import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/ui/widgets/create_service_dialog.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/help_tooltip.dart';
import 'package:fungi_app/ui/widgets/service_icon.dart';
import 'package:fungi_app/ui/widgets/ui_primitives.dart';
import 'package:get/get.dart';

String _dashboardDeviceLabel({
  required String peerId,
  String? alias,
  String? hostname,
}) {
  return alias?.isNotEmpty == true
      ? alias!
      : (hostname?.isNotEmpty == true ? hostname! : peerId);
}

String _dashboardRemoteServiceReference({
  required RemoteServiceListEntryView service,
  required String deviceLabel,
}) {
  return service.qualifiedName(deviceLabel);
}

String _remoteServiceTypeLabel(RemoteServiceListEntryView service) {
  if (service.isWeb) {
    return 'Web';
  }

  final transport = service.transportKind.trim();
  if (transport.isEmpty) {
    return 'TCP';
  }

  return transport.toUpperCase();
}

String _remoteServiceStatusLabel(RemoteServiceListEntryView service) {
  return service.accessAttached ? 'Connected' : 'Published';
}

String _localAccessEndpointLabel(ServiceAccessEndpointView endpoint) {
  final name = endpoint.name.trim();
  if (name.isNotEmpty) {
    return name;
  }

  final protocol = endpoint.protocol.trim();
  if (protocol.isNotEmpty) {
    return protocol.toUpperCase();
  }

  return 'Local address';
}

String _localAccessEndpointValue(ServiceAccessEndpointView endpoint) {
  return '${endpoint.localHost}:${endpoint.localPort}';
}

Future<void> _showLocalAddressDialog(
  BuildContext context, {
  required String serviceReference,
  required List<ServiceAccessEndpointView> endpoints,
}) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Local Address'),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: endpoints.isEmpty
              ? const Text(
                  'No local forwarding address is available yet. Try reconnecting once the tunnel finishes attaching.',
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceReference,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    ...endpoints.asMap().entries.map((entry) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: entry.key == endpoints.length - 1 ? 0 : 10,
                        ),
                        child: CopyableValueCard(
                          label: _localAccessEndpointLabel(entry.value),
                          value: _localAccessEndpointValue(entry.value),
                          successMessage: 'Address copied',
                        ),
                      );
                    }),
                  ],
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

class DashboardPage extends GetView<FungiController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final sections = controller.availableServiceSections;
      final remoteEntries = <_DashboardCatalogEntry>[];
      final localServices = controller.localServices.toList(growable: false)
        ..sort((left, right) {
          final running = (right.running ? 1 : 0) - (left.running ? 1 : 0);
          if (running != 0) {
            return running;
          }
          return left.name.compareTo(right.name);
        });

      for (final section in sections) {
        final deviceLabel = _dashboardDeviceLabel(
          peerId: section.peerId,
          alias: section.alias,
          hostname: section.hostname,
        );
        for (final service in section.services) {
          if (service.isWeb || service.isTcp) {
            remoteEntries.add(
              _DashboardCatalogEntry(
                peerId: section.peerId,
                deviceLabel: deviceLabel,
                service: service,
              ),
            );
          }
        }
      }

      final serviceEntries =
          <_DashboardServiceEntry>[
            ...localServices.map(
              (service) => _DashboardServiceEntry.local(service: service),
            ),
            ...remoteEntries.map(
              (entry) => _DashboardServiceEntry.remote(entry: entry),
            ),
          ]..sort((left, right) {
            final activeDelta =
                (right.isActive ? 1 : 0) - (left.isActive ? 1 : 0);
            if (activeDelta != 0) {
              return activeDelta;
            }

            final kindDelta = (left.isLocal ? 0 : 1) - (right.isLocal ? 0 : 1);
            if (kindDelta != 0) {
              return kindDelta;
            }

            return left.reference.toLowerCase().compareTo(
              right.reference.toLowerCase(),
            );
          });

      final isRefreshingServices =
          controller.localServicesLoading.value ||
          controller.availableServicesLoading.value;
      final showHeaderCreateAction = serviceEntries.isNotEmpty;

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionHeader(
            title: 'Services',
            helpMessage:
                'Services on this device keep their plain name. Remote services include @device so you can always see where they live before you open or connect them.',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (showHeaderCreateAction) ...[
                  InlineAddButton(
                    onPressed: () => showCreateServiceDialog(context),
                    label: 'Add',
                  ),
                  const SizedBox(width: 8),
                ],
                IconButton(
                  onPressed: () async {
                    await Future.wait([
                      controller.refreshLocalServicesData(),
                      controller.refreshAvailableServicesData(),
                      controller.refreshNodeManagementData(),
                    ]);
                  },
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh services',
                ),
              ],
            ),
          ),
          if (isRefreshingServices)
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: LinearProgressIndicator(),
            ),
          if (controller.localServicesError.value.isNotEmpty) ...[
            const SizedBox(height: 12),
            _StatusCard(
              message: controller.localServicesError.value,
              actionLabel: 'Retry local',
              onPressed: controller.refreshLocalServicesData,
            ),
          ],
          if (controller.availableServicesError.value.isNotEmpty) ...[
            const SizedBox(height: 12),
            _StatusCard(
              message: controller.availableServicesError.value,
              actionLabel: 'Retry remote',
              onPressed: controller.refreshAvailableServicesData,
            ),
          ],
          if (serviceEntries.isEmpty)
            _HomeOnboardingPanel(
              hasDevices: controller.addressBook.isNotEmpty,
              onCreateService: () => showCreateServiceDialog(context),
            )
          else
            ...serviceEntries.map((entry) {
              if (entry.isLocal) {
                return _LocalServiceCard(service: entry.localService!);
              }
              return _QuickServiceCard(entry: entry.remoteEntry!);
            }),
        ],
      );
    });
  }
}

class _DashboardCatalogEntry {
  const _DashboardCatalogEntry({
    required this.peerId,
    required this.deviceLabel,
    required this.service,
  });

  final String peerId;
  final String deviceLabel;
  final RemoteServiceListEntryView service;
}

class _DashboardServiceEntry {
  _DashboardServiceEntry.local({required LocalServiceView service})
    : this._(
        localService: service,
        remoteEntry: null,
        isLocal: true,
        reference: service.name,
        isActive: service.running,
      );

  _DashboardServiceEntry.remote({required _DashboardCatalogEntry entry})
    : this._(
        localService: null,
        remoteEntry: entry,
        isLocal: false,
        reference: _DashboardCatalogEntryReference.reference(entry),
        isActive: entry.service.accessAttached || entry.service.running,
      );

  const _DashboardServiceEntry._({
    required this.localService,
    required this.remoteEntry,
    required this.isLocal,
    required this.reference,
    required this.isActive,
  });

  final LocalServiceView? localService;
  final _DashboardCatalogEntry? remoteEntry;
  final bool isLocal;
  final String reference;
  final bool isActive;
}

class _DashboardCatalogEntryReference {
  static String reference(_DashboardCatalogEntry entry) {
    return _dashboardRemoteServiceReference(
      service: entry.service,
      deviceLabel: entry.deviceLabel,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.helpMessage, this.trailing});

  final String title;
  final String? helpMessage;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    if (helpMessage != null) ...[
                      const SizedBox(width: 6),
                      HelpTooltip(title: title, message: helpMessage!),
                    ],
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ],
      ),
    );
  }
}

class _HomeOnboardingPanel extends GetView<FungiController> {
  const _HomeOnboardingPanel({
    required this.hasDevices,
    required this.onCreateService,
  });

  final bool hasDevices;
  final VoidCallback onCreateService;

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hasDevices ? 'No services are ready yet.' : 'No services yet.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 6),
            Text(
              hasDevices
                  ? 'This device has no local services yet, and your saved devices are not currently publishing any Web or TCP services you can use here.'
                  : 'Create a service on this device, or save a device that can host one remotely.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                FilledButton.icon(
                  onPressed: onCreateService,
                  icon: const Icon(Icons.add_circle),
                  label: const Text('Create Service'),
                ),
                OutlinedButton.icon(
                  onPressed: () =>
                      DefaultTabController.of(context).animateTo(1),
                  icon: const Icon(Icons.device_hub),
                  label: const Text('Manage Devices'),
                ),
                OutlinedButton.icon(
                  onPressed: controller.openDocumentation,
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open Docs'),
                ),
              ],
            ),
          ],
        ),
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
    final serviceReference = _dashboardRemoteServiceReference(
      service: service,
      deviceLabel: entry.deviceLabel,
    );
    final shouldShowHumanName =
        service.displayName.isNotEmpty &&
        service.displayName != serviceReference &&
        service.displayName != service.serviceName;
    final typeLabel = _remoteServiceTypeLabel(service);
    final statusLabel = _remoteServiceStatusLabel(service);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EnhancedCard(
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          leading: ServiceIcon(
            iconUrl: service.iconUrl,
            fallbackLabel: serviceReference,
          ),
          title: Text(
            serviceReference,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const ServiceOriginBadge.remote(),
                if (shouldShowHumanName)
                  CompactBadge(label: service.displayName),
                CompactBadge(label: typeLabel),
                CompactBadge(label: statusLabel),
              ],
            ),
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
    final canControl = service.serviceName.trim().isNotEmpty;
    final serviceReference = _dashboardRemoteServiceReference(
      service: service,
      deviceLabel: entry.deviceLabel,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (service.isWeb && canControl)
          FilledButton(
            onPressed: () => controller.openCatalogWebService(
              peerId: entry.peerId,
              serviceName: service.serviceName,
            ),
            child: const Text('Open'),
          )
        else if (canControl && !service.accessAttached)
          FilledButton(
            onPressed: () => controller.attachCatalogServiceAccess(
              peerId: entry.peerId,
              serviceName: service.serviceName,
            ),
            child: const Text('Connect'),
          )
        else if (canControl)
          FilledButton(
            onPressed: () => _showLocalAddressDialog(
              context,
              serviceReference: serviceReference,
              endpoints: service.localAccessEndpoints,
            ),
            child: const Text('Address'),
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
    final hasLocalAddresses = service.localAccessEndpoints.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (launchUri != null) ...[
          CopyableValueCard(
            label: 'Local URL',
            value: launchUri.toString(),
            compact: true,
            successMessage: 'Address copied',
          ),
        ] else if (hasLocalAddresses) ...[
          ...service.localAccessEndpoints.asMap().entries.map((entry) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: entry.key == service.localAccessEndpoints.length - 1
                    ? 0
                    : 8,
              ),
              child: CopyableValueCard(
                label: _localAccessEndpointLabel(entry.value),
                value: _localAccessEndpointValue(entry.value),
                compact: true,
                successMessage: 'Address copied',
              ),
            );
          }),
        ] else ...[
          Text(
            service.accessAttached
                ? 'Local forwarding is being prepared.'
                : service.isWeb
                ? 'Connect to prepare a local URL here.'
                : 'Connect to create a local forwarded address here.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            if (!service.accessAttached && service.serviceName.isNotEmpty)
              OutlinedButton.icon(
                onPressed: () => controller.attachCatalogServiceAccess(
                  peerId: entry.peerId,
                  serviceName: service.serviceName,
                ),
                icon: const Icon(Icons.link),
                label: const Text('Connect'),
              ),
            if (!service.isWeb && hasLocalAddresses)
              OutlinedButton.icon(
                onPressed: () => _showLocalAddressDialog(
                  context,
                  serviceReference: _dashboardRemoteServiceReference(
                    service: service,
                    deviceLabel: entry.deviceLabel,
                  ),
                  endpoints: service.localAccessEndpoints,
                ),
                icon: const Icon(Icons.copy_all),
                label: const Text('Address'),
              ),
            if (service.accessAttached && service.serviceName.isNotEmpty)
              OutlinedButton.icon(
                onPressed: () => controller.detachCatalogServiceAccess(
                  peerId: entry.peerId,
                  serviceName: service.serviceName,
                ),
                icon: const Icon(Icons.link_off),
                label: const Text('Disconnect'),
              ),
          ],
        ),
      ],
    );
  }
}

class _LocalServiceCard extends GetView<FungiController> {
  const _LocalServiceCard({required this.service});

  final LocalServiceView service;

  @override
  Widget build(BuildContext context) {
    final pendingAction = controller.localServicePendingActions[service.name];
    final isBusy = pendingAction != null;
    final metadata = <String>[
      service.runtime,
      if (service.source.isNotEmpty) service.source,
    ].join(' • ');

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: EnhancedCard(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ServiceIcon(iconUrl: null, fallbackLabel: service.name),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (metadata.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            metadata,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ],
                    ),
                  ),
                  CompactBadge(
                    label: service.running ? 'Running' : service.state,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const ServiceOriginBadge.local(),
              const SizedBox(height: 10),
              if (service.localEndpoints.isNotEmpty) ...[
                Text(
                  'Local Endpoints',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 6),
                ...service.localEndpoints.map(
                  (endpoint) => Text(
                    '${endpoint.name ?? endpoint.protocol} -> ${endpoint.localHost}:${endpoint.localPort}',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                const SizedBox(height: 10),
              ],
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.icon(
                    onPressed: isBusy
                        ? null
                        : service.running
                        ? () => controller.stopLocalService(service.name)
                        : () => controller.startLocalService(service.name),
                    icon: Icon(service.running ? Icons.stop : Icons.play_arrow),
                    label: Text(service.running ? 'Stop' : 'Start'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () =>
                        DefaultTabController.of(context).animateTo(2),
                    icon: const Icon(Icons.tune),
                    label: const Text('Manage'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.message,
    required this.actionLabel,
    required this.onPressed,
  });

  final String message;
  final String actionLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            OutlinedButton(onPressed: onPressed, child: Text(actionLabel)),
          ],
        ),
      ),
    );
  }
}

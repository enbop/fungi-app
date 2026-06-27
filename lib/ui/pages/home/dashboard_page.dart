import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/create_service_dialog.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/help_tooltip.dart';
import 'package:fungi_app/ui/widgets/service_icon.dart';
import 'package:fungi_app/ui/widgets/service_management_widgets.dart';
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

String _localServiceTypeLabel(LocalServiceView service) {
  if (service.webEndpoint != null) {
    return 'Web';
  }

  final protocol = service.localEndpoints.isEmpty
      ? ''
      : service.localEndpoints.first.protocol.trim();
  if (protocol.isEmpty) {
    return 'TCP';
  }
  return protocol.toUpperCase();
}

String _localServiceStatusLabel(
  LocalServiceView service,
  String? pendingAction,
) {
  switch (pendingAction) {
    case 'start':
      return 'Starting';
    case 'stop':
      return 'Stopping';
    case 'remove':
      return 'Removing';
  }

  if (service.running) {
    return 'Running';
  }

  final state = service.state.trim();
  if (state.isEmpty) {
    return 'Unknown';
  }
  return '${state[0].toUpperCase()}${state.substring(1)}';
}

Widget _localServiceStatusBadge(
  LocalServiceView service,
  String? pendingAction,
) {
  final label = _localServiceStatusLabel(service, pendingAction);
  if (pendingAction != null) {
    return ServiceStatusBadge(label: label, active: false);
  }

  final normalizedState = service.state.trim().toLowerCase();
  if (!service.running &&
      (normalizedState.startsWith('exited') || normalizedState == 'missing')) {
    return AttentionBadge(label: label);
  }

  return ServiceStatusBadge(label: label, active: service.running);
}

Widget _compactPendingIndicator() {
  return const SizedBox.square(
    dimension: 14,
    child: CircularProgressIndicator(strokeWidth: 2),
  );
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
      final remoteEntries = <_DashboardRemoteEntry>[];
      final remoteByDevice = <String, Map<String, _DashboardRemoteEntry>>{};
      final deviceServiceKeys = <String>{};
      final remoteDeviceServiceEntries = <_DashboardDeviceServiceEntry>[];
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
              _DashboardRemoteEntry(
                peerId: section.peerId,
                deviceLabel: deviceLabel,
                service: service,
              ),
            );
            remoteByDevice.putIfAbsent(
              section.peerId,
              () => <String, _DashboardRemoteEntry>{},
            )[service.serviceName] = remoteEntries.last;
          }
        }
      }

      for (final peer in controller.addressBook) {
        final deviceLabel = _dashboardDeviceLabel(
          peerId: peer.peerId,
          alias: peer.name,
          hostname: peer.hostname,
        );
        final deviceServices =
            controller
                .deviceServicesForPeer(peer.peerId)
                .toList(growable: false)
              ..sort((left, right) {
                final running =
                    (right.running ? 1 : 0) - (left.running ? 1 : 0);
                if (running != 0) {
                  return running;
                }
                return left.name.compareTo(right.name);
              });
        for (final service in deviceServices) {
          deviceServiceKeys.add('${peer.peerId}::${service.name}');
          remoteDeviceServiceEntries.add(
            _DashboardDeviceServiceEntry(
              peer: peer,
              deviceLabel: deviceLabel,
              service: service,
              remoteEntry: remoteByDevice[peer.peerId]?[service.name],
            ),
          );
        }
      }

      final snapshotOnlyEntries = remoteEntries.where((entry) {
        return !deviceServiceKeys.contains(
          '${entry.peerId}::${entry.service.serviceName}',
        );
      });

      final serviceEntries =
          <_DashboardServiceEntry>[
            ...localServices.map(
              (service) => _DashboardServiceEntry.local(service: service),
            ),
            ...remoteDeviceServiceEntries.map(
              (entry) =>
                  _DashboardServiceEntry.remoteDeviceService(entry: entry),
            ),
            ...snapshotOnlyEntries.map(
              (entry) => _DashboardServiceEntry.remoteSnapshot(entry: entry),
            ),
          ]..sort((left, right) {
            final activeDelta =
                (right.isActive ? 1 : 0) - (left.isActive ? 1 : 0);
            if (activeDelta != 0) {
              return activeDelta;
            }

            final kindDelta = left.kindSort - right.kindSort;
            if (kindDelta != 0) {
              return kindDelta;
            }

            return left.reference.toLowerCase().compareTo(
              right.reference.toLowerCase(),
            );
          });

      final isRefreshingServices =
          controller.localServicesLoading.value ||
          controller.availableServicesLoading.value ||
          controller.peerDeviceServicesLoading.values.any((value) => value);
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
                    label: 'Apply',
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
              if (entry.isRemoteDeviceService) {
                return _RemoteDeviceServiceCard(
                  entry: entry.deviceServiceEntry!,
                );
              }
              return _QuickServiceCard(entry: entry.remoteEntry!);
            }),
        ],
      );
    });
  }
}

class _DashboardRemoteEntry {
  const _DashboardRemoteEntry({
    required this.peerId,
    required this.deviceLabel,
    required this.service,
  });

  final String peerId;
  final String deviceLabel;
  final RemoteServiceListEntryView service;
}

class _DashboardDeviceServiceEntry {
  const _DashboardDeviceServiceEntry({
    required this.peer,
    required this.deviceLabel,
    required this.service,
    required this.remoteEntry,
  });

  final DeviceInfo peer;
  final String deviceLabel;
  final LocalServiceView service;
  final _DashboardRemoteEntry? remoteEntry;

  String get reference {
    final baseName = service.name.trim();
    if (baseName.isEmpty) {
      return deviceLabel;
    }
    if (baseName.contains('@') || deviceLabel.trim().isEmpty) {
      return baseName;
    }
    return '$baseName@$deviceLabel';
  }
}

class _DashboardServiceEntry {
  _DashboardServiceEntry.local({required LocalServiceView service})
    : this._(
        localService: service,
        remoteEntry: null,
        deviceServiceEntry: null,
        isLocal: true,
        isRemoteDeviceService: false,
        reference: service.name,
        isActive: service.running,
        kindSort: 0,
      );

  _DashboardServiceEntry.remoteDeviceService({
    required _DashboardDeviceServiceEntry entry,
  }) : this._(
         localService: null,
         remoteEntry: null,
         deviceServiceEntry: entry,
         isLocal: false,
         isRemoteDeviceService: true,
         reference: entry.reference,
         isActive: entry.service.running,
         kindSort: 1,
       );

  _DashboardServiceEntry.remoteSnapshot({required _DashboardRemoteEntry entry})
    : this._(
        localService: null,
        remoteEntry: entry,
        deviceServiceEntry: null,
        isLocal: false,
        isRemoteDeviceService: false,
        reference: _DashboardRemoteEntryReference.reference(entry),
        isActive: entry.service.accessAttached || entry.service.running,
        kindSort: 2,
      );

  const _DashboardServiceEntry._({
    required this.localService,
    required this.remoteEntry,
    required this.deviceServiceEntry,
    required this.isLocal,
    required this.isRemoteDeviceService,
    required this.reference,
    required this.isActive,
    required this.kindSort,
  });

  final LocalServiceView? localService;
  final _DashboardRemoteEntry? remoteEntry;
  final _DashboardDeviceServiceEntry? deviceServiceEntry;
  final bool isLocal;
  final bool isRemoteDeviceService;
  final String reference;
  final bool isActive;
  final int kindSort;
}

class _DashboardRemoteEntryReference {
  static String reference(_DashboardRemoteEntry entry) {
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
                  : 'Apply a service on this device, or save a device that can host one remotely.',
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
                  label: const Text('Apply Service'),
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

  final _DashboardRemoteEntry entry;

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

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: EnhancedCard(
        margin: EdgeInsets.zero,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
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
              ],
            ),
          ),
          trailing: _QuickAccessActions(entry: entry),
          children: [
            _QuickServiceDetails(entry: entry),
            _ServiceDetailRow(
              label: 'Status',
              value: service.running ? 'Running' : service.state,
            ),
            _ServiceDetailRow(label: 'Runtime', value: service.runtime),
            const SizedBox(height: 8),
            if (service.accessAttached && service.serviceName.isNotEmpty)
              Align(
                alignment: Alignment.centerLeft,
                child: OutlinedButton.icon(
                  onPressed: () => controller.detachRemoteServiceAccess(
                    peerId: entry.peerId,
                    serviceName: service.serviceName,
                  ),
                  style: _compactServiceOutlinedButtonStyle(),
                  icon: const Icon(Icons.link_off),
                  label: const Text('Disconnect'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

ButtonStyle _compactServiceButtonStyle() {
  return FilledButton.styleFrom(
    visualDensity: VisualDensity.compact,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    minimumSize: const Size(0, 30),
  );
}

ButtonStyle _compactServiceOutlinedButtonStyle() {
  return OutlinedButton.styleFrom(
    visualDensity: VisualDensity.compact,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    minimumSize: const Size(0, 30),
  );
}

class _CompactCopyRow extends StatelessWidget {
  const _CompactCopyRow({
    required this.label,
    required this.value,
    required this.successMessage,
  });

  final String label;
  final String value;
  final String successMessage;

  @override
  Widget build(BuildContext context) {
    return _ServiceDetailRow(
      label: label,
      value: value,
      tooltip: value,
      onTap: () => copyTextValue(value, successMessage: successMessage),
      trailing: CopyIconButton(
        value: value,
        successMessage: successMessage,
        tooltip: 'Copy $label',
      ),
    );
  }
}

class _ServiceDetailRow extends StatelessWidget {
  const _ServiceDetailRow({
    required this.label,
    required this.value,
    this.tooltip,
    this.onTap,
    this.trailing,
  });

  final String label;
  final String value;
  final String? tooltip;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final row = Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 92,
            child: Text(
              '$label:',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: Tooltip(
              message: tooltip ?? value,
              waitDuration: const Duration(milliseconds: 500),
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 8), trailing!],
        ],
      ),
    );

    if (onTap == null) {
      return row;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: row,
    );
  }
}

class _QuickAccessActions extends GetView<FungiController> {
  const _QuickAccessActions({required this.entry});

  final _DashboardRemoteEntry entry;

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
            onPressed: () => controller.openRemoteWebService(
              peerId: entry.peerId,
              serviceName: service.serviceName,
            ),
            style: _compactServiceButtonStyle(),
            child: const Text('Open'),
          )
        else if (canControl && !service.accessAttached)
          FilledButton(
            onPressed: () => controller.attachRemoteServiceAccess(
              peerId: entry.peerId,
              serviceName: service.serviceName,
            ),
            style: _compactServiceButtonStyle(),
            child: const Text('Connect'),
          )
        else if (canControl)
          FilledButton(
            onPressed: () => _showLocalAddressDialog(
              context,
              serviceReference: serviceReference,
              endpoints: service.localAccessEndpoints,
            ),
            style: _compactServiceButtonStyle(),
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

  final _DashboardRemoteEntry entry;

  @override
  Widget build(BuildContext context) {
    final service = entry.service;
    final launchUri = service.isWeb
        ? controller.remoteWebLaunchUri(service)
        : null;
    final hasLocalAddresses = service.localAccessEndpoints.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (launchUri != null) ...[
          _CompactCopyRow(
            label: 'Local URL',
            value: launchUri.toString(),
            successMessage: 'Address copied',
          ),
          const SizedBox(height: 8),
        ] else if (hasLocalAddresses) ...[
          ...service.localAccessEndpoints.asMap().entries.map((entry) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: entry.key == service.localAccessEndpoints.length - 1
                    ? 0
                    : 8,
              ),
              child: _CompactCopyRow(
                label: _localAccessEndpointLabel(entry.value),
                value: _localAccessEndpointValue(entry.value),
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
          const SizedBox(height: 8),
        ],
      ],
    );
  }
}

class _RemoteDeviceServiceQuickActions extends GetView<FungiController> {
  const _RemoteDeviceServiceQuickActions({
    required this.entry,
    required this.busy,
  });

  final _DashboardDeviceServiceEntry entry;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final remote = entry.remoteEntry?.service;
    if (remote == null) {
      return const Icon(Icons.expand_more);
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (remote.isWeb)
          FilledButton(
            onPressed: busy
                ? null
                : () => controller.openRemoteWebService(
                    peerId: entry.peer.peerId,
                    serviceName: entry.service.name,
                  ),
            style: _compactServiceButtonStyle(),
            child: const Text('Open'),
          )
        else if (!remote.accessAttached)
          FilledButton(
            onPressed: busy
                ? null
                : () => controller.attachRemoteServiceAccess(
                    peerId: entry.peer.peerId,
                    serviceName: entry.service.name,
                  ),
            style: _compactServiceButtonStyle(),
            child: const Text('Connect'),
          )
        else if (remote.localAccessEndpoints.isNotEmpty)
          FilledButton(
            onPressed: () => _showLocalAddressDialog(
              context,
              serviceReference: entry.reference,
              endpoints: remote.localAccessEndpoints,
            ),
            style: _compactServiceButtonStyle(),
            child: const Text('Address'),
          ),
        const SizedBox(width: 8),
        const Icon(Icons.expand_more),
      ],
    );
  }
}

class _RemoteDeviceServiceCard extends GetView<FungiController> {
  const _RemoteDeviceServiceCard({required this.entry});

  final _DashboardDeviceServiceEntry entry;

  @override
  Widget build(BuildContext context) {
    final service = entry.service;
    final remote = entry.remoteEntry?.service;
    final actionKey = controller.remoteServiceActionKey(
      entry.peer.peerId,
      service.name,
    );
    final pendingAction = controller.remoteServicePendingActions[actionKey];
    final isBusy = pendingAction != null;
    final deviceOnline = controller
        .connectionsForPeer(entry.peer.peerId)
        .isNotEmpty;
    final statusLabel = deviceOnline
        ? (service.running ? 'Running' : service.state)
        : 'Unavailable';

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: EnhancedCard(
        margin: EdgeInsets.zero,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          leading: ServiceIcon(
            iconUrl: remote?.iconUrl,
            fallbackLabel: entry.reference,
          ),
          title: Text(
            entry.reference,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const ServiceOriginBadge.remote(),
                if (remote != null)
                  CompactBadge(label: _remoteServiceTypeLabel(remote)),
              ],
            ),
          ),
          trailing: _RemoteDeviceServiceQuickActions(
            entry: entry,
            busy: isBusy,
          ),
          children: [
            if (remote != null) ...[
              _QuickServiceDetails(entry: entry.remoteEntry!),
            ] else if (service.localEndpoints.isNotEmpty) ...[
              ...service.localEndpoints.map((endpoint) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _CompactCopyRow(
                    label: endpoint.name ?? endpoint.protocol,
                    value: '${endpoint.localHost}:${endpoint.localPort}',
                    successMessage: 'Address copied',
                  ),
                );
              }),
            ],
            _ServiceDetailRow(label: 'Status', value: statusLabel),
            _ServiceDetailRow(label: 'Runtime', value: service.runtime),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: [
                  if (remote != null && remote.accessAttached)
                    OutlinedButton.icon(
                      onPressed: isBusy
                          ? null
                          : () => controller.detachRemoteServiceAccess(
                              peerId: entry.peer.peerId,
                              serviceName: service.name,
                            ),
                      style: _compactServiceOutlinedButtonStyle(),
                      icon: const Icon(Icons.link_off),
                      label: const Text('Disconnect'),
                    ),
                  OutlinedButton.icon(
                    onPressed: service.running || isBusy || !deviceOnline
                        ? null
                        : () => controller.startRemoteService(
                            peerId: entry.peer.peerId,
                            serviceName: service.name,
                          ),
                    style: _compactServiceOutlinedButtonStyle(),
                    icon: pendingAction == 'start'
                        ? const SizedBox.square(
                            dimension: 14,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.play_arrow),
                    label: const Text('Start'),
                  ),
                  OutlinedButton.icon(
                    onPressed: !service.running || isBusy || !deviceOnline
                        ? null
                        : () => controller.stopRemoteService(
                            peerId: entry.peer.peerId,
                            serviceName: service.name,
                          ),
                    style: _compactServiceOutlinedButtonStyle(),
                    icon: pendingAction == 'stop'
                        ? const SizedBox.square(
                            dimension: 14,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.stop),
                    label: const Text('Stop'),
                  ),
                  OutlinedButton.icon(
                    onPressed: isBusy
                        ? null
                        : () => controller.removeRemoteService(
                            peerId: entry.peer.peerId,
                            serviceName: service.name,
                          ),
                    style: _compactServiceOutlinedButtonStyle(),
                    icon: pendingAction == 'remove'
                        ? const SizedBox.square(
                            dimension: 14,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.delete_outline),
                    label: const Text('Remove'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
    final launchUri = controller.localServiceLaunchUri(service);
    final typeLabel = _localServiceTypeLabel(service);
    final configuredEndpointLabel = service.running ? null : 'Configured';

    final Widget? primaryAction;
    if (pendingAction == 'remove') {
      primaryAction = null;
    } else if (service.canOpen) {
      primaryAction = FilledButton.icon(
        onPressed: isBusy
            ? null
            : () => controller.openLocalService(service.name),
        style: _compactServiceButtonStyle(),
        icon: const Icon(Icons.open_in_new),
        label: const Text('Open'),
      );
    } else if (service.canShowAddress) {
      primaryAction = FilledButton.icon(
        onPressed: isBusy
            ? null
            : () => _showLocalServiceAddressDialog(context, service: service),
        style: _compactServiceButtonStyle(),
        icon: const Icon(Icons.link),
        label: const Text('Address'),
      );
    } else if (service.canStart) {
      primaryAction = FilledButton.icon(
        onPressed: isBusy
            ? null
            : () => controller.startLocalService(service.name),
        style: _compactServiceButtonStyle(),
        icon: pendingAction == 'start'
            ? _compactPendingIndicator()
            : const Icon(Icons.play_arrow),
        label: const Text('Start'),
      );
    } else {
      primaryAction = null;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: EnhancedCard(
        margin: EdgeInsets.zero,
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
          leading: ServiceIcon(iconUrl: null, fallbackLabel: service.name),
          title: Text(
            service.name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                const ServiceOriginBadge.local(),
                CompactBadge(label: typeLabel),
                _localServiceStatusBadge(service, pendingAction),
              ],
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (primaryAction != null) ...[
                primaryAction,
                const SizedBox(width: 8),
              ],
              const Icon(Icons.expand_more),
            ],
          ),
          children: [
            if (launchUri != null) ...[
              _CompactCopyRow(
                label: service.running ? 'Local URL' : 'Configured URL',
                value: launchUri.toString(),
                successMessage: 'Address copied',
              ),
              const SizedBox(height: 8),
            ] else if (service.localEndpoints.isNotEmpty) ...[
              ...service.localEndpoints.map(
                (endpoint) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _CompactCopyRow(
                    label: configuredEndpointLabel == null
                        ? endpoint.name ?? endpoint.protocol
                        : '$configuredEndpointLabel ${endpoint.name ?? endpoint.protocol}',
                    value: '${endpoint.localHost}:${endpoint.localPort}',
                    successMessage: 'Address copied',
                  ),
                ),
              ),
            ],
            _ServiceDetailRow(
              label: 'Status',
              value: service.running ? 'Running' : service.state,
            ),
            _ServiceDetailRow(label: 'Runtime', value: service.runtime),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: [
                  if (service.running)
                    OutlinedButton.icon(
                      onPressed: isBusy
                          ? null
                          : () => controller.stopLocalService(service.name),
                      style: _compactServiceOutlinedButtonStyle(),
                      icon: pendingAction == 'stop'
                          ? _compactPendingIndicator()
                          : const Icon(Icons.stop),
                      label: const Text('Stop'),
                    )
                  else
                    OutlinedButton.icon(
                      onPressed: isBusy
                          ? null
                          : () => controller.removeLocalService(service.name),
                      style: _compactServiceOutlinedButtonStyle(),
                      icon: pendingAction == 'remove'
                          ? _compactPendingIndicator()
                          : const Icon(Icons.delete_outline),
                      label: const Text('Remove'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showLocalServiceAddressDialog(
  BuildContext context, {
  required LocalServiceView service,
}) async {
  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Local Address'),
        content: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(service.name, style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(height: 8),
              ...service.localEndpoints.map((endpoint) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CopyableValueCard(
                    label: endpoint.name ?? endpoint.protocol,
                    value: '${endpoint.localHost}:${endpoint.localPort}',
                    compact: true,
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

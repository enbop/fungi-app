import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/dialogs.dart';
import 'package:fungi_app/ui/widgets/text.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:get/get.dart';

class ClientDataTunnelSection extends GetView<FungiController> {
  const ClientDataTunnelSection({super.key, this.showTitle = true});

  final bool showTitle;

  bool _isRawForwardingRule(ForwardingRule rule) {
    if (rule.remoteServiceId.isNotEmpty || rule.remoteServiceName.isNotEmpty) {
      return false;
    }
    if (rule.remoteProtocol.startsWith('/fungi/service-port')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          Row(
            children: [
              Icon(
                Icons.arrow_forward,
                size: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                "Port Forwarding",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Text(
            "Forward local ports to remote devices without going through the service catalog.",
            style: Theme.of(context).textTheme.labelSmall?.apply(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
            ),
          ),
          const SizedBox(height: 10),
        ],
        TextButton.icon(
          onPressed: showAddForwardingRuleDialog,
          icon: const Icon(Icons.add_circle),
          label: const Text("Add Forwarding Rule"),
        ),
        const SizedBox(height: 10),
        Obx(() {
          final rawForwardingRules = controller
              .tcpTunnelingConfig
              .value
              .forwardingRules
              .where(_isRawForwardingRule)
              .toList(growable: false);

          if (rawForwardingRules.isEmpty) {
            return Text(
              "-- No raw forwarding rules. --",
              style: Theme.of(context).textTheme.bodySmall?.apply(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
              ),
            );
          }

          return Column(
            children: rawForwardingRules.map((rule) {
              final peerLabel = controller.peerDisplayLabel(rule.remotePeerId);
              final titleTarget = peerLabel == rule.remotePeerId
                  ? 'Remote'
                  : peerLabel;

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: EnhancedCard(
                  child: ListTile(
                    title: Text(
                      "${rule.localHost}:${rule.localPort} → $titleTarget:${rule.remotePort}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (peerLabel != rule.remotePeerId)
                          Text(
                            "Alias: $peerLabel",
                            style: Theme.of(context).textTheme.bodySmall?.apply(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(150),
                            ),
                          ),
                        TruncatedId(
                          id: rule.remotePeerId,
                          style: Theme.of(context).textTheme.bodySmall?.apply(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurface.withAlpha(150),
                          ),
                        ),
                        if (rule.remoteProtocol.isNotEmpty)
                          Text(
                            "Protocol: ${rule.remoteProtocol}",
                            style: Theme.of(context).textTheme.bodySmall?.apply(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(120),
                            ),
                          ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.red,
                      ),
                      onPressed: () => controller.removeTcpForwardingRule(
                        localHost: rule.localHost,
                        localPort: rule.localPort,
                        peerId: rule.remotePeerId,
                        remotePort: rule.remotePort,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}

class ServerDataTunnelSection extends GetView<FungiController> {
  const ServerDataTunnelSection({super.key, this.showTitle = true});

  final bool showTitle;

  bool _isRawListeningRule(ListeningRule rule) {
    return !rule.protocol.startsWith('/fungi/service-port');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle) ...[
          Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(width: 8),
              Text(
                "Port Listening",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Text(
            "Expose local services to remote devices without wrapping them as published services.",
            style: Theme.of(context).textTheme.labelSmall?.apply(
              color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
            ),
          ),
          const SizedBox(height: 10),
        ],
        TextButton.icon(
          onPressed: showAddListeningRuleDialog,
          icon: const Icon(Icons.add_circle),
          label: const Text("Add Listening Rule"),
        ),
        const SizedBox(height: 10),
        Obx(() {
          final rawListeningRules = controller
              .tcpTunnelingConfig
              .value
              .listeningRules
              .where(_isRawListeningRule)
              .toList(growable: false);

          if (rawListeningRules.isEmpty) {
            return Text(
              "-- No raw listening rules. --",
              style: Theme.of(context).textTheme.bodySmall?.apply(
                color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
              ),
            );
          }

          return Column(
            children: rawListeningRules.map((rule) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: EnhancedCard(
                  accentColor: Theme.of(context).colorScheme.secondary,
                  child: ListTile(
                    title: Text(
                      "Local:${rule.host}:${rule.port}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (rule.protocol.isNotEmpty)
                          Text(
                            "Protocol: ${rule.protocol}",
                            style: Theme.of(context).textTheme.bodySmall?.apply(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(120),
                            ),
                          ),
                        if (rule.allowedPeers.isNotEmpty)
                          Text(
                            "Allowed peers: ${rule.allowedPeers.length}",
                            style: Theme.of(context).textTheme.bodySmall?.apply(
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurface.withAlpha(150),
                            ),
                          ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.red,
                      ),
                      onPressed: () => controller.removeTcpListeningRule(
                        localHost: rule.host,
                        localPort: rule.port,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}

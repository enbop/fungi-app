import 'dart:convert';

class ServiceStatusView {
  const ServiceStatusView({required this.state, required this.running});

  final String state;
  final bool running;

  factory ServiceStatusView.fromJson(Map<String, dynamic> json) {
    return ServiceStatusView(
      state: json['state'] as String? ?? 'unknown',
      running: json['running'] as bool? ?? false,
    );
  }
}

class LocalServicePortView {
  const LocalServicePortView({
    required this.name,
    required this.protocol,
    required this.localHost,
    required this.localPort,
    required this.servicePort,
  });

  final String? name;
  final String protocol;
  final String localHost;
  final int localPort;
  final int servicePort;

  factory LocalServicePortView.fromJson(Map<String, dynamic> json) {
    return LocalServicePortView(
      name: json['name'] as String?,
      protocol: json['protocol'] as String? ?? 'tcp',
      localHost: json['local_host'] as String? ?? '127.0.0.1',
      localPort: json['local_port'] as int? ?? json['host_port'] as int? ?? 0,
      servicePort: json['service_port'] as int? ?? 0,
    );
  }
}

class LocalServiceView {
  const LocalServiceView({
    required this.id,
    required this.name,
    required this.runtime,
    required this.source,
    required this.state,
    required this.running,
    required this.localEndpoints,
  });

  final String id;
  final String name;
  final String runtime;
  final String source;
  final String state;
  final bool running;
  final List<LocalServicePortView> localEndpoints;

  factory LocalServiceView.fromJson(Map<String, dynamic> json) {
    final name =
        json['name'] as String? ?? json['service_name'] as String? ?? '';
    final status = json['status'] as Map<String, dynamic>? ?? const {};

    return LocalServiceView(
      id: json['id'] as String? ?? '',
      name: name,
      runtime: json['runtime'] as String? ?? 'unknown',
      source: _decodeServiceSource(json['source']),
      state:
          json['state'] as String? ?? status['state'] as String? ?? 'unknown',
      running: json['running'] as bool? ?? status['running'] as bool? ?? false,
      localEndpoints: decodeJsonList(
        json['local_endpoints'] ?? json['exposed_endpoints'] ?? json['ports'],
        LocalServicePortView.fromJson,
      ),
    );
  }
}

class RemoteServiceEndpointView {
  const RemoteServiceEndpointView({
    required this.name,
    required this.protocol,
    required this.servicePort,
  });

  final String name;
  final String protocol;
  final int servicePort;

  factory RemoteServiceEndpointView.fromJson(Map<String, dynamic> json) {
    return RemoteServiceEndpointView(
      name: json['name'] as String? ?? '',
      protocol: json['protocol'] as String? ?? '',
      servicePort: json['service_port'] as int? ?? 0,
    );
  }
}

class RemoteForwardedEndpointView {
  const RemoteForwardedEndpointView({
    required this.name,
    required this.localHost,
    required this.localPort,
    required this.protocol,
  });

  final String name;
  final String localHost;
  final int localPort;
  final String protocol;

  factory RemoteForwardedEndpointView.fromJson(Map<String, dynamic> json) {
    return RemoteForwardedEndpointView(
      name: json['name'] as String? ?? '',
      localHost: json['local_host'] as String? ?? '127.0.0.1',
      localPort: json['local_port'] as int? ?? 0,
      protocol: json['protocol'] as String? ?? '',
    );
  }
}

class RemoteServiceListEntryView {
  const RemoteServiceListEntryView({
    required this.serviceName,
    required this.runtime,
    required this.state,
    required this.running,
    required this.discoverable,
    required this.serviceId,
    required this.localForwarded,
    required this.availableEndpoints,
    required this.localForwardedEndpoints,
  });

  final String serviceName;
  final String runtime;
  final String state;
  final bool running;
  final bool discoverable;
  final String? serviceId;
  final bool localForwarded;
  final List<RemoteServiceEndpointView> availableEndpoints;
  final List<RemoteForwardedEndpointView> localForwardedEndpoints;

  factory RemoteServiceListEntryView.fromJson(Map<String, dynamic> json) {
    return RemoteServiceListEntryView(
      serviceName: json['service_name'] as String? ?? '',
      runtime: json['runtime'] as String? ?? 'unknown',
      state: json['state'] as String? ?? 'unknown',
      running: json['running'] as bool? ?? false,
      discoverable: json['discoverable'] as bool? ?? false,
      serviceId: json['service_id'] as String?,
      localForwarded: json['local_forwarded'] as bool? ?? false,
      availableEndpoints: decodeJsonList(
        json['available_endpoints'],
        RemoteServiceEndpointView.fromJson,
      ),
      localForwardedEndpoints: decodeJsonList(
        json['local_forwarded_endpoints'],
        RemoteForwardedEndpointView.fromJson,
      ),
    );
  }
}

class NodeCapabilitiesView {
  const NodeCapabilitiesView({
    required this.runtimes,
    required this.allowedPorts,
    required this.allowedPortRanges,
    required this.allowedHostPaths,
  });

  final List<String> runtimes;
  final List<int> allowedPorts;
  final List<String> allowedPortRanges;
  final List<String> allowedHostPaths;

  factory NodeCapabilitiesView.fromJson(Map<String, dynamic> json) {
    final runtimeCapabilities = json['runtime_capabilities'];
    final allowedTcpPorts = json['allowed_tcp_ports'];

    return NodeCapabilitiesView(
      runtimes: runtimeCapabilities is List
          ? runtimeCapabilities
                .map(
                  (entry) =>
                      (entry as Map<String, dynamic>)['runtime'] as String? ??
                      'unknown',
                )
                .toList()
          : const [],
      allowedPorts: allowedTcpPorts is Map<String, dynamic>
          ? ((allowedTcpPorts['ports'] as List?) ?? const [])
                .map((entry) => entry as int)
                .toList()
          : const [],
      allowedPortRanges: allowedTcpPorts is Map<String, dynamic>
          ? ((allowedTcpPorts['ranges'] as List?) ?? const []).map((entry) {
              final range = entry as Map<String, dynamic>;
              return '${range['start']}-${range['end']}';
            }).toList()
          : const [],
      allowedHostPaths: ((json['allowed_host_paths'] as List?) ?? const [])
          .map((entry) => entry.toString())
          .toList(),
    );
  }
}

class PeerServicesSectionView {
  const PeerServicesSectionView({
    required this.peerId,
    required this.services,
    this.alias,
    this.hostname,
  });

  final String peerId;
  final String? alias;
  final String? hostname;
  final List<RemoteServiceListEntryView> services;
}

List<T> decodeJsonList<T>(
  Object? source,
  T Function(Map<String, dynamic>) mapper,
) {
  if (source is! List) {
    return const [];
  }

  return source
      .whereType<Map<String, dynamic>>()
      .map(mapper)
      .toList(growable: false);
}

List<T> decodeJsonStringList<T>(
  String raw,
  T Function(Map<String, dynamic>) mapper,
) {
  if (raw.trim().isEmpty) {
    return const [];
  }

  final decoded = jsonDecode(raw);
  if (decoded is! List) {
    return const [];
  }

  return decoded
      .whereType<Map<String, dynamic>>()
      .map(mapper)
      .toList(growable: false);
}

T? decodeJsonStringObject<T>(
  String raw,
  T Function(Map<String, dynamic>) mapper,
) {
  if (raw.trim().isEmpty) {
    return null;
  }

  final decoded = jsonDecode(raw);
  if (decoded is! Map<String, dynamic>) {
    return null;
  }

  return mapper(decoded);
}

String _decodeServiceSource(Object? source) {
  if (source is String) {
    return source;
  }

  if (source is Map<String, dynamic>) {
    if (source.length == 1) {
      final variant = source.entries.first;
      final payload = variant.value;
      if (payload is Map<String, dynamic>) {
        for (final candidate in const ['image', 'url', 'component']) {
          final value = payload[candidate];
          if (value is String && value.isNotEmpty) {
            return value;
          }
        }
      }
      return variant.key;
    }

    for (final candidate in const ['image', 'url', 'component']) {
      final value = source[candidate];
      if (value is String && value.isNotEmpty) {
        return value;
      }
    }
  }

  return '';
}

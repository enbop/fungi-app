import 'package:flutter_test/flutter_test.dart';
import 'package:fungi_app/app/models/daemon_models.dart';

void main() {
  test('decodes the current device service snapshot shape', () {
    final service = RemoteServiceListEntryView.fromJson({
      'name': 'files',
      'runtime': 'external',
      'metadata': {
        'usage': {'kind': 'web', 'path': '/browse'},
        'icon_url': 'https://example.test/files.svg',
      },
      'endpoints': [
        {'name': 'web', 'protocol': '/fungi/service/files/web/0.2.0'},
      ],
      'status': {'phase': 'running'},
    });

    expect(service.serviceName, 'files');
    expect(service.runtime, 'external');
    expect(service.running, isTrue);
    expect(service.state, 'running');
    expect(service.isWeb, isTrue);
    expect(service.usagePath, '/browse');
    expect(service.iconUrl, 'https://example.test/files.svg');
    expect(service.remoteEndpoints, hasLength(1));
    expect(service.remoteEndpoints.single.name, 'web');
    expect(
      service.remoteEndpoints.single.protocol,
      '/fungi/service/files/web/0.2.0',
    );
  });

  test('prefers service status detail over its phase', () {
    final service = LocalServiceView.fromJson({
      'name': 'worker',
      'runtime': 'docker',
      'status': {'phase': 'exited', 'detail': 'exited(137)'},
    });

    expect(service.running, isFalse);
    expect(service.state, 'exited(137)');
  });

  test('running web service can open but does not use address action', () {
    final service = localService(
      running: true,
      state: 'running',
      endpoints: [localEndpoint(name: 'http', localPort: 8080)],
    );

    expect(service.webEndpoint?.name, 'http');
    expect(service.canOpen, isTrue);
    expect(service.canShowAddress, isFalse);
    expect(service.canStart, isFalse);
  });

  test('running TCP service uses address action and is not web', () {
    final service = localService(
      running: true,
      state: 'running',
      endpoints: [localEndpoint(name: 'main', localPort: 2222)],
    );

    expect(service.webEndpoint, isNull);
    expect(service.canOpen, isFalse);
    expect(service.canShowAddress, isTrue);
    expect(service.canStart, isFalse);
  });

  test('stopped services suggest start while retaining endpoints', () {
    for (final endpoint in [
      localEndpoint(name: 'web', localPort: 8080),
      localEndpoint(name: 'main', localPort: 2222),
    ]) {
      final service = localService(
        running: false,
        state: 'stopped',
        endpoints: [endpoint],
      );

      expect(service.localEndpoints, isNotEmpty);
      expect(service.canOpen, isFalse);
      expect(service.canShowAddress, isFalse);
      expect(service.canStart, isTrue);
    }
  });

  test('exited and missing services suggest start', () {
    for (final state in ['exited(1)', 'missing']) {
      final service = localService(
        running: false,
        state: state,
        endpoints: const [],
      );

      expect(service.canStart, isTrue);
      expect(service.canOpen, isFalse);
      expect(service.canShowAddress, isFalse);
    }
  });

  test('zero local port is not a usable address', () {
    final service = localService(
      running: true,
      state: 'running',
      endpoints: [localEndpoint(name: 'web', localPort: 0)],
    );

    expect(service.webEndpoint, isNotNull);
    expect(service.hasUsableLocalAddress, isFalse);
    expect(service.canOpen, isFalse);
    expect(service.canShowAddress, isFalse);
  });
}

LocalServiceView localService({
  required bool running,
  required String state,
  required List<LocalServicePortView> endpoints,
}) {
  return LocalServiceView(
    id: 'external:demo',
    name: 'demo',
    runtime: 'external',
    source: '127.0.0.1',
    state: state,
    running: running,
    localEndpoints: endpoints,
  );
}

LocalServicePortView localEndpoint({
  required String name,
  required int localPort,
}) {
  return LocalServicePortView(
    name: name,
    protocol: 'tcp',
    localHost: '127.0.0.1',
    localPort: localPort,
    servicePort: localPort,
  );
}

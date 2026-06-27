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
}

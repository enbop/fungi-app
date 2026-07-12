import 'package:flutter_test/flutter_test.dart';
import 'package:fungi_app/ui/utils/daemon_client.dart';

void main() {
  test('parses a dynamically allocated IPv4 RPC address', () {
    final address = DaemonRpcAddress.parse('127.0.0.1:61234');

    expect(address.host, '127.0.0.1');
    expect(address.port, 61234);
  });

  test('parses a bracketed IPv6 RPC address', () {
    final address = DaemonRpcAddress.parse('[::1]:61234');

    expect(address.host, '::1');
    expect(address.port, 61234);
  });

  test('rejects RPC addresses without an explicit valid port', () {
    for (final address in [
      '127.0.0.1',
      '127.0.0.1:0',
      'localhost:not-a-port',
    ]) {
      expect(() => DaemonRpcAddress.parse(address), throwsFormatException);
    }
  });
}

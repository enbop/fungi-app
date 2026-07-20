import 'package:flutter_test/flutter_test.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';

void main() {
  test('connection failures use the single short message', () {
    expect(
      remoteDeviceErrorMessage(
        'Failed to attach service access: '
        'failed to refresh remote service before attaching access',
      ),
      deviceConnectionFailureMessage,
    );
    expect(
      remoteDeviceErrorMessage(
        'No connections available to peer 16Uiu2HAmExample',
      ),
      deviceConnectionFailureMessage,
    );
  });

  test('non-connection errors keep their detail', () {
    expect(
      remoteDeviceErrorMessage('Remote service is not running'),
      'Remote service is not running',
    );
  });
}

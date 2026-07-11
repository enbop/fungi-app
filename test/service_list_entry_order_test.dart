import 'package:flutter_test/flutter_test.dart';
import 'package:fungi_app/app/models/service_list_entry_order.dart';

void main() {
  test('sorts services alphabetically by their visible reference', () {
    final services = [
      _service('ssh@vm'),
      _service('fb@vm'),
      _service('fb'),
      _service('test-1234@od'),
      _service('fb@od'),
    ]..sort((left, right) => left.order.compareTo(right.order));

    expect(services.map((service) => service.order.reference), [
      'fb',
      'fb@od',
      'fb@vm',
      'ssh@vm',
      'test-1234@od',
    ]);
  });

  test('lifecycle changes do not change service order', () {
    final services = [
      _service('zeta', running: true),
      _service('alpha', running: false),
    ];

    services.sort((left, right) => left.order.compareTo(right.order));
    final before = services.map((service) => service.order.reference).toList();

    final changed =
        services
            .map((service) => service.copyWith(running: !service.running))
            .toList()
          ..sort((left, right) => left.order.compareTo(right.order));

    expect(changed.map((service) => service.order.reference), before);
  });

  test('compares visible references without case sensitivity', () {
    final services = [_service('zeta'), _service('Beta'), _service('alpha')]
      ..sort((left, right) => left.order.compareTo(right.order));

    expect(services.map((service) => service.order.reference), [
      'alpha',
      'Beta',
      'zeta',
    ]);
  });

  test('uses stable identity to make duplicate references deterministic', () {
    final services = [
      _service('demo@device', stableId: 'remote::peer-b::demo'),
      _service('demo@device', stableId: 'remote::peer-a::demo'),
    ]..sort((left, right) => left.order.compareTo(right.order));

    expect(services.map((service) => service.order.stableId), [
      'remote::peer-a::demo',
      'remote::peer-b::demo',
    ]);
  });
}

_TestService _service(
  String reference, {
  String? stableId,
  bool running = false,
}) {
  return _TestService(
    order: ServiceListEntryOrder(
      reference: reference,
      stableId: stableId ?? 'service::$reference',
    ),
    running: running,
  );
}

class _TestService {
  const _TestService({required this.order, required this.running});

  final ServiceListEntryOrder order;
  final bool running;

  _TestService copyWith({required bool running}) {
    return _TestService(order: order, running: running);
  }
}

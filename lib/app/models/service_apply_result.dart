import 'dart:convert';

enum ServiceApplyDisposition { complete, partial, failed }

/// The verified result returned by core, including partially completed applies.
class ServiceApplyOutcome {
  const ServiceApplyOutcome({
    required this.manifestChange,
    required this.workloadAction,
    required this.finalPhase,
    this.finalDetail,
    this.failureStage,
    this.failureMessage,
  });

  final String manifestChange;
  final String workloadAction;
  final String finalPhase;
  final String? finalDetail;
  final String? failureStage;
  final String? failureMessage;

  bool get hasFailure => failureStage != null || failureMessage != null;
  String get finalState => finalDetail ?? finalPhase;

  static ServiceApplyOutcome? fromJson(Object? value) {
    if (value is! Map<String, dynamic>) return null;
    final status = value['final_status'];
    if (status is! Map<String, dynamic> || status['phase'] is! String) {
      return null;
    }
    final failure = value['failure'];
    if (failure != null && failure is! Map<String, dynamic>) return null;
    return ServiceApplyOutcome(
      manifestChange: value['manifest_change'] is String
          ? value['manifest_change'] as String
          : 'unknown',
      workloadAction: value['workload_action'] is String
          ? value['workload_action'] as String
          : 'unknown',
      finalPhase: status['phase'] as String,
      finalDetail: status['detail'] is String
          ? status['detail'] as String
          : null,
      failureStage: failure is Map && failure['stage'] is String
          ? failure['stage'] as String
          : null,
      failureMessage: failure is Map && failure['message'] is String
          ? failure['message'] as String
          : null,
    );
  }

  static ServiceApplyOutcome? decode(String value) {
    try {
      return fromJson(jsonDecode(value));
    } on FormatException {
      return null;
    }
  }

  ServiceApplyOutcome withVerifiedStatus({
    required String phase,
    String? detail,
    bool startedWorkload = false,
  }) => ServiceApplyOutcome(
    manifestChange: manifestChange,
    workloadAction: startedWorkload ? 'started' : workloadAction,
    finalPhase: phase,
    finalDetail: detail,
  );
}

class ServiceApplyResult {
  const ServiceApplyResult({
    required this.disposition,
    this.outcome,
    this.errorMessage,
  });

  const ServiceApplyResult.failed(String message)
    : this(disposition: ServiceApplyDisposition.failed, errorMessage: message);

  final ServiceApplyDisposition disposition;
  final ServiceApplyOutcome? outcome;
  final String? errorMessage;

  bool get isComplete => disposition == ServiceApplyDisposition.complete;

  String get message {
    if (disposition == ServiceApplyDisposition.failed) {
      return errorMessage ?? 'Service apply failed.';
    }
    if (disposition == ServiceApplyDisposition.partial) {
      final failure =
          errorMessage ??
          '${outcome?.failureStage?.replaceAll('_', ' ') ?? 'operation'} failed: '
              '${outcome?.failureMessage ?? 'unknown error'}';
      return 'Service definition applied, but $failure'
          '${outcome == null ? '' : '\nFinal state: ${outcome!.finalState}.'}';
    }

    final change = switch (outcome?.manifestChange) {
      'created' => 'Service created.',
      'changed' => 'Service updated.',
      'unchanged' => 'Service definition unchanged.',
      _ => 'Service applied.',
    };
    final action = switch (outcome?.workloadAction) {
      'started' => ' Started.',
      'restarted' => ' Restarted.',
      'reloaded' => ' Reloaded.',
      _ => '',
    };
    return '$change$action'
        '${outcome == null ? '' : ' Final state: ${outcome!.finalState}.'}';
  }
}

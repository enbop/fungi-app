import 'dart:convert';

import 'package:fungi_app/app/models/daemon_models.dart';
import 'package:fungi_app/app/models/service_apply_result.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pbgrpc.dart';
import 'package:grpc/grpc.dart';

String serviceApplyErrorMessage(Object error) =>
    error is GrpcError ? error.message ?? error.toString() : error.toString();

/// Core uses JSON, rather than google.rpc.Status, in its binary error trailer.
ServiceApplyResult? decodePartialServiceApply(GrpcError error) {
  final encoded = error.trailers?['grpc-status-details-bin'];
  if (encoded == null) return null;
  try {
    final response = jsonDecode(
      utf8.decode(base64.decode(base64.normalize(encoded))),
    );
    if (response is! Map<String, dynamic> || response['ok'] != false) {
      return null;
    }
    final outcome = ServiceApplyOutcome.fromJson(response['apply_outcome']);
    if (outcome == null || !outcome.hasFailure) return null;
    return ServiceApplyResult(
      disposition: ServiceApplyDisposition.partial,
      outcome: outcome,
    );
  } on FormatException {
    return null;
  }
}

Future<ServiceApplyResult> applyServiceManifest({
  required FungiDaemonClient client,
  required String manifestYaml,
  String? manifestBaseDir,
  String? peerId,
  bool startAfterApply = false,
}) async {
  const applyTimeout = Duration(minutes: 3);
  const inspectTimeout = Duration(seconds: 20);
  final isRemote = peerId != null;
  String? serviceName;
  ServiceApplyOutcome? outcome;
  LocalServiceView? appliedInstance;

  try {
    if (isRemote) {
      final response = await client.remotePullService(
        RemotePullServiceRequest()
          ..peerId = peerId
          ..manifestYaml = manifestYaml,
        options: CallOptions(timeout: applyTimeout),
      );
      serviceName = response.serviceName;
      outcome = ServiceApplyOutcome.decode(response.applyOutcomeJson);
    } else {
      final response = await client.pullService(
        PullServiceRequest()
          ..manifestYaml = manifestYaml
          ..manifestBaseDir = manifestBaseDir ?? '',
        options: CallOptions(timeout: applyTimeout),
      );
      appliedInstance = decodeJsonStringObject(
        response.instanceJson,
        LocalServiceView.fromJson,
      );
      serviceName = appliedInstance?.name;
      outcome = ServiceApplyOutcome.decode(response.applyOutcomeJson);
    }
  } catch (error) {
    if (error is GrpcError) {
      final partial = decodePartialServiceApply(error);
      if (partial != null) return partial;
    }
    return ServiceApplyResult.failed(serviceApplyErrorMessage(error));
  }

  if (outcome?.hasFailure == true) {
    return ServiceApplyResult(
      disposition: ServiceApplyDisposition.partial,
      outcome: outcome,
    );
  }
  if (!startAfterApply) {
    return ServiceApplyResult(
      disposition: ServiceApplyDisposition.complete,
      outcome: outcome,
    );
  }
  if (serviceName == null || serviceName.trim().isEmpty) {
    return ServiceApplyResult(
      disposition: ServiceApplyDisposition.partial,
      outcome: outcome,
      errorMessage: 'the daemon did not return a service name for startup.',
    );
  }

  String? startError;
  try {
    if (isRemote) {
      await client.remoteStartService(
        RemoteServiceNameRequest()
          ..peerId = peerId
          ..name = serviceName,
        options: CallOptions(timeout: applyTimeout),
      );
    } else {
      await client.startService(
        ServiceNameRequest()..name = serviceName,
        options: CallOptions(timeout: applyTimeout),
      );
    }
  } catch (error) {
    startError = serviceApplyErrorMessage(error);
  }

  LocalServiceView? inspected;
  String? inspectError;
  try {
    if (isRemote) {
      final response = await client.getDeviceServiceSnapshot(
        DeviceServiceSnapshotRequest()
          ..deviceId = peerId
          ..refresh = true,
        options: CallOptions(timeout: inspectTimeout),
      );
      // A refresh can return cached services along with an error. Those do not
      // verify that the requested start succeeded.
      if (response.error.isNotEmpty || response.source != 'live') {
        throw StateError(
          response.error.isEmpty
              ? 'A live service state could not be read from this device.'
              : response.error,
        );
      }
      final snapshot =
          jsonDecode(response.snapshotJson) as Map<String, dynamic>;
      final services = decodeJsonList(
        snapshot['services'],
        LocalServiceView.fromJson,
      );
      for (final service in services) {
        if (service.name == serviceName) inspected = service;
      }
      if (inspected == null) {
        throw StateError('Service not found: $serviceName');
      }
    } else {
      final response = await client.inspectService(
        ServiceNameRequest()..name = serviceName,
        options: CallOptions(timeout: inspectTimeout),
      );
      inspected = decodeJsonStringObject(
        response.instanceJson,
        LocalServiceView.fromJson,
      );
      if (inspected == null) throw StateError('Service state was missing.');
    }
  } catch (error) {
    inspectError = serviceApplyErrorMessage(error);
  }

  final phase = inspected?.phase ?? 'unknown';
  final verified =
      (outcome ??
              ServiceApplyOutcome(
                manifestChange: 'unknown',
                workloadAction: 'unknown',
                finalPhase: 'unknown',
              ))
          .withVerifiedStatus(
            phase: phase,
            detail: inspected?.state == phase ? null : inspected?.state,
            startedWorkload:
                inspected?.running == true &&
                (outcome?.finalPhase ??
                        (appliedInstance?.running == true
                            ? 'running'
                            : 'unknown')) !=
                    'running' &&
                inspected?.runtime != 'external',
          );
  final complete =
      startError == null && inspectError == null && inspected?.running == true;
  return ServiceApplyResult(
    disposition: complete
        ? ServiceApplyDisposition.complete
        : ServiceApplyDisposition.partial,
    outcome: verified,
    errorMessage: complete
        ? null
        : [
            if (startError != null) 'startup failed: $startError',
            if (inspectError != null)
              'the running state could not be verified: $inspectError',
            if (startError == null && inspectError == null)
              'the service is not running.',
          ].join('\n'),
  );
}

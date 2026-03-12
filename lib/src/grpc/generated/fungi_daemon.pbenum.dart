//
//  Generated code. Do not modify.
//  source: fungi_daemon.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ServiceRuntimeKind extends $pb.ProtobufEnum {
  static const ServiceRuntimeKind SERVICE_RUNTIME_KIND_UNSPECIFIED = ServiceRuntimeKind._(0, _omitEnumNames ? '' : 'SERVICE_RUNTIME_KIND_UNSPECIFIED');
  static const ServiceRuntimeKind SERVICE_RUNTIME_KIND_DOCKER = ServiceRuntimeKind._(1, _omitEnumNames ? '' : 'SERVICE_RUNTIME_KIND_DOCKER');
  static const ServiceRuntimeKind SERVICE_RUNTIME_KIND_WASMTIME = ServiceRuntimeKind._(2, _omitEnumNames ? '' : 'SERVICE_RUNTIME_KIND_WASMTIME');

  static const $core.List<ServiceRuntimeKind> values = <ServiceRuntimeKind> [
    SERVICE_RUNTIME_KIND_UNSPECIFIED,
    SERVICE_RUNTIME_KIND_DOCKER,
    SERVICE_RUNTIME_KIND_WASMTIME,
  ];

  static final $core.Map<$core.int, ServiceRuntimeKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceRuntimeKind? valueOf($core.int value) => _byValue[value];

  const ServiceRuntimeKind._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

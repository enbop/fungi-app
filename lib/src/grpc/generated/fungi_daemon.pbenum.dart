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

class RecipeRuntimeKind extends $pb.ProtobufEnum {
  static const RecipeRuntimeKind RECIPE_RUNTIME_KIND_UNSPECIFIED = RecipeRuntimeKind._(0, _omitEnumNames ? '' : 'RECIPE_RUNTIME_KIND_UNSPECIFIED');
  static const RecipeRuntimeKind RECIPE_RUNTIME_KIND_DOCKER = RecipeRuntimeKind._(1, _omitEnumNames ? '' : 'RECIPE_RUNTIME_KIND_DOCKER');
  static const RecipeRuntimeKind RECIPE_RUNTIME_KIND_WASMTIME = RecipeRuntimeKind._(2, _omitEnumNames ? '' : 'RECIPE_RUNTIME_KIND_WASMTIME');
  static const RecipeRuntimeKind RECIPE_RUNTIME_KIND_LINK = RecipeRuntimeKind._(3, _omitEnumNames ? '' : 'RECIPE_RUNTIME_KIND_LINK');

  static const $core.List<RecipeRuntimeKind> values = <RecipeRuntimeKind> [
    RECIPE_RUNTIME_KIND_UNSPECIFIED,
    RECIPE_RUNTIME_KIND_DOCKER,
    RECIPE_RUNTIME_KIND_WASMTIME,
    RECIPE_RUNTIME_KIND_LINK,
  ];

  static final $core.Map<$core.int, RecipeRuntimeKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RecipeRuntimeKind? valueOf($core.int value) => _byValue[value];

  const RecipeRuntimeKind._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');

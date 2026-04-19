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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'fungi_daemon.pbenum.dart';

export 'fungi_daemon.pbenum.dart';

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class VersionResponse extends $pb.GeneratedMessage {
  factory VersionResponse({
    $core.String? version,
    $core.String? channel,
    $core.String? commit,
    $core.String? buildTime,
    $core.String? defaultFungiDir,
    $core.String? defaultRpcAddress,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (channel != null) {
      $result.channel = channel;
    }
    if (commit != null) {
      $result.commit = commit;
    }
    if (buildTime != null) {
      $result.buildTime = buildTime;
    }
    if (defaultFungiDir != null) {
      $result.defaultFungiDir = defaultFungiDir;
    }
    if (defaultRpcAddress != null) {
      $result.defaultRpcAddress = defaultRpcAddress;
    }
    return $result;
  }
  VersionResponse._() : super();
  factory VersionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VersionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VersionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'version')
    ..aOS(2, _omitFieldNames ? '' : 'channel')
    ..aOS(3, _omitFieldNames ? '' : 'commit')
    ..aOS(4, _omitFieldNames ? '' : 'buildTime')
    ..aOS(5, _omitFieldNames ? '' : 'defaultFungiDir')
    ..aOS(6, _omitFieldNames ? '' : 'defaultRpcAddress')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VersionResponse clone() => VersionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VersionResponse copyWith(void Function(VersionResponse) updates) => super.copyWith((message) => updates(message as VersionResponse)) as VersionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VersionResponse create() => VersionResponse._();
  VersionResponse createEmptyInstance() => create();
  static $pb.PbList<VersionResponse> createRepeated() => $pb.PbList<VersionResponse>();
  @$core.pragma('dart2js:noInline')
  static VersionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VersionResponse>(create);
  static VersionResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get version => $_getSZ(0);
  @$pb.TagNumber(1)
  set version($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get channel => $_getSZ(1);
  @$pb.TagNumber(2)
  set channel($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChannel() => $_has(1);
  @$pb.TagNumber(2)
  void clearChannel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get commit => $_getSZ(2);
  @$pb.TagNumber(3)
  set commit($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCommit() => $_has(2);
  @$pb.TagNumber(3)
  void clearCommit() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get buildTime => $_getSZ(3);
  @$pb.TagNumber(4)
  set buildTime($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBuildTime() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuildTime() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get defaultFungiDir => $_getSZ(4);
  @$pb.TagNumber(5)
  set defaultFungiDir($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDefaultFungiDir() => $_has(4);
  @$pb.TagNumber(5)
  void clearDefaultFungiDir() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get defaultRpcAddress => $_getSZ(5);
  @$pb.TagNumber(6)
  set defaultRpcAddress($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDefaultRpcAddress() => $_has(5);
  @$pb.TagNumber(6)
  void clearDefaultRpcAddress() => clearField(6);
}

class HostnameResponse extends $pb.GeneratedMessage {
  factory HostnameResponse({
    $core.String? hostname,
  }) {
    final $result = create();
    if (hostname != null) {
      $result.hostname = hostname;
    }
    return $result;
  }
  HostnameResponse._() : super();
  factory HostnameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostnameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HostnameResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'hostname')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostnameResponse clone() => HostnameResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostnameResponse copyWith(void Function(HostnameResponse) updates) => super.copyWith((message) => updates(message as HostnameResponse)) as HostnameResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HostnameResponse create() => HostnameResponse._();
  HostnameResponse createEmptyInstance() => create();
  static $pb.PbList<HostnameResponse> createRepeated() => $pb.PbList<HostnameResponse>();
  @$core.pragma('dart2js:noInline')
  static HostnameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostnameResponse>(create);
  static HostnameResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get hostname => $_getSZ(0);
  @$pb.TagNumber(1)
  set hostname($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHostname() => $_has(0);
  @$pb.TagNumber(1)
  void clearHostname() => clearField(1);
}

class PeerIdResponse extends $pb.GeneratedMessage {
  factory PeerIdResponse({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  PeerIdResponse._() : super();
  factory PeerIdResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeerIdResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PeerIdResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeerIdResponse clone() => PeerIdResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeerIdResponse copyWith(void Function(PeerIdResponse) updates) => super.copyWith((message) => updates(message as PeerIdResponse)) as PeerIdResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PeerIdResponse create() => PeerIdResponse._();
  PeerIdResponse createEmptyInstance() => create();
  static $pb.PbList<PeerIdResponse> createRepeated() => $pb.PbList<PeerIdResponse>();
  @$core.pragma('dart2js:noInline')
  static PeerIdResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeerIdResponse>(create);
  static PeerIdResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class ConfigFilePathResponse extends $pb.GeneratedMessage {
  factory ConfigFilePathResponse({
    $core.String? configFilePath,
  }) {
    final $result = create();
    if (configFilePath != null) {
      $result.configFilePath = configFilePath;
    }
    return $result;
  }
  ConfigFilePathResponse._() : super();
  factory ConfigFilePathResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigFilePathResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigFilePathResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'configFilePath')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigFilePathResponse clone() => ConfigFilePathResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigFilePathResponse copyWith(void Function(ConfigFilePathResponse) updates) => super.copyWith((message) => updates(message as ConfigFilePathResponse)) as ConfigFilePathResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigFilePathResponse create() => ConfigFilePathResponse._();
  ConfigFilePathResponse createEmptyInstance() => create();
  static $pb.PbList<ConfigFilePathResponse> createRepeated() => $pb.PbList<ConfigFilePathResponse>();
  @$core.pragma('dart2js:noInline')
  static ConfigFilePathResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigFilePathResponse>(create);
  static ConfigFilePathResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get configFilePath => $_getSZ(0);
  @$pb.TagNumber(1)
  set configFilePath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfigFilePath() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfigFilePath() => clearField(1);
}

class IncomingAllowedPeersListResponse extends $pb.GeneratedMessage {
  factory IncomingAllowedPeersListResponse({
    $core.Iterable<PeerInfo>? peers,
  }) {
    final $result = create();
    if (peers != null) {
      $result.peers.addAll(peers);
    }
    return $result;
  }
  IncomingAllowedPeersListResponse._() : super();
  factory IncomingAllowedPeersListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory IncomingAllowedPeersListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'IncomingAllowedPeersListResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<PeerInfo>(1, _omitFieldNames ? '' : 'peers', $pb.PbFieldType.PM, subBuilder: PeerInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  IncomingAllowedPeersListResponse clone() => IncomingAllowedPeersListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  IncomingAllowedPeersListResponse copyWith(void Function(IncomingAllowedPeersListResponse) updates) => super.copyWith((message) => updates(message as IncomingAllowedPeersListResponse)) as IncomingAllowedPeersListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IncomingAllowedPeersListResponse create() => IncomingAllowedPeersListResponse._();
  IncomingAllowedPeersListResponse createEmptyInstance() => create();
  static $pb.PbList<IncomingAllowedPeersListResponse> createRepeated() => $pb.PbList<IncomingAllowedPeersListResponse>();
  @$core.pragma('dart2js:noInline')
  static IncomingAllowedPeersListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<IncomingAllowedPeersListResponse>(create);
  static IncomingAllowedPeersListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PeerInfo> get peers => $_getList(0);
}

class AddIncomingAllowedPeerRequest extends $pb.GeneratedMessage {
  factory AddIncomingAllowedPeerRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  AddIncomingAllowedPeerRequest._() : super();
  factory AddIncomingAllowedPeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddIncomingAllowedPeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddIncomingAllowedPeerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddIncomingAllowedPeerRequest clone() => AddIncomingAllowedPeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddIncomingAllowedPeerRequest copyWith(void Function(AddIncomingAllowedPeerRequest) updates) => super.copyWith((message) => updates(message as AddIncomingAllowedPeerRequest)) as AddIncomingAllowedPeerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddIncomingAllowedPeerRequest create() => AddIncomingAllowedPeerRequest._();
  AddIncomingAllowedPeerRequest createEmptyInstance() => create();
  static $pb.PbList<AddIncomingAllowedPeerRequest> createRepeated() => $pb.PbList<AddIncomingAllowedPeerRequest>();
  @$core.pragma('dart2js:noInline')
  static AddIncomingAllowedPeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddIncomingAllowedPeerRequest>(create);
  static AddIncomingAllowedPeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class RemoveIncomingAllowedPeerRequest extends $pb.GeneratedMessage {
  factory RemoveIncomingAllowedPeerRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  RemoveIncomingAllowedPeerRequest._() : super();
  factory RemoveIncomingAllowedPeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveIncomingAllowedPeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveIncomingAllowedPeerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveIncomingAllowedPeerRequest clone() => RemoveIncomingAllowedPeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveIncomingAllowedPeerRequest copyWith(void Function(RemoveIncomingAllowedPeerRequest) updates) => super.copyWith((message) => updates(message as RemoveIncomingAllowedPeerRequest)) as RemoveIncomingAllowedPeerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveIncomingAllowedPeerRequest create() => RemoveIncomingAllowedPeerRequest._();
  RemoveIncomingAllowedPeerRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveIncomingAllowedPeerRequest> createRepeated() => $pb.PbList<RemoveIncomingAllowedPeerRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveIncomingAllowedPeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveIncomingAllowedPeerRequest>(create);
  static RemoveIncomingAllowedPeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class RelayEnabledRequest extends $pb.GeneratedMessage {
  factory RelayEnabledRequest({
    $core.bool? enabled,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    return $result;
  }
  RelayEnabledRequest._() : super();
  factory RelayEnabledRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RelayEnabledRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RelayEnabledRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RelayEnabledRequest clone() => RelayEnabledRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RelayEnabledRequest copyWith(void Function(RelayEnabledRequest) updates) => super.copyWith((message) => updates(message as RelayEnabledRequest)) as RelayEnabledRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelayEnabledRequest create() => RelayEnabledRequest._();
  RelayEnabledRequest createEmptyInstance() => create();
  static $pb.PbList<RelayEnabledRequest> createRepeated() => $pb.PbList<RelayEnabledRequest>();
  @$core.pragma('dart2js:noInline')
  static RelayEnabledRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelayEnabledRequest>(create);
  static RelayEnabledRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);
}

class UseCommunityRelaysRequest extends $pb.GeneratedMessage {
  factory UseCommunityRelaysRequest({
    $core.bool? enabled,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    return $result;
  }
  UseCommunityRelaysRequest._() : super();
  factory UseCommunityRelaysRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UseCommunityRelaysRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UseCommunityRelaysRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UseCommunityRelaysRequest clone() => UseCommunityRelaysRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UseCommunityRelaysRequest copyWith(void Function(UseCommunityRelaysRequest) updates) => super.copyWith((message) => updates(message as UseCommunityRelaysRequest)) as UseCommunityRelaysRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UseCommunityRelaysRequest create() => UseCommunityRelaysRequest._();
  UseCommunityRelaysRequest createEmptyInstance() => create();
  static $pb.PbList<UseCommunityRelaysRequest> createRepeated() => $pb.PbList<UseCommunityRelaysRequest>();
  @$core.pragma('dart2js:noInline')
  static UseCommunityRelaysRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UseCommunityRelaysRequest>(create);
  static UseCommunityRelaysRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);
}

class RelayAddressRequest extends $pb.GeneratedMessage {
  factory RelayAddressRequest({
    $core.String? address,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    return $result;
  }
  RelayAddressRequest._() : super();
  factory RelayAddressRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RelayAddressRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RelayAddressRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RelayAddressRequest clone() => RelayAddressRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RelayAddressRequest copyWith(void Function(RelayAddressRequest) updates) => super.copyWith((message) => updates(message as RelayAddressRequest)) as RelayAddressRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelayAddressRequest create() => RelayAddressRequest._();
  RelayAddressRequest createEmptyInstance() => create();
  static $pb.PbList<RelayAddressRequest> createRepeated() => $pb.PbList<RelayAddressRequest>();
  @$core.pragma('dart2js:noInline')
  static RelayAddressRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelayAddressRequest>(create);
  static RelayAddressRequest? _defaultInstance;

  /// One relay multiaddr. TCP entries carry relay reservations/circuits; UDP/QUIC
  /// entries are observer-only for pre-hole-punch UDP address discovery.
  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);
}

class EffectiveRelayAddress extends $pb.GeneratedMessage {
  factory EffectiveRelayAddress({
    $core.String? address,
    $core.String? source,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (source != null) {
      $result.source = source;
    }
    return $result;
  }
  EffectiveRelayAddress._() : super();
  factory EffectiveRelayAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EffectiveRelayAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EffectiveRelayAddress', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..aOS(2, _omitFieldNames ? '' : 'source')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EffectiveRelayAddress clone() => EffectiveRelayAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EffectiveRelayAddress copyWith(void Function(EffectiveRelayAddress) updates) => super.copyWith((message) => updates(message as EffectiveRelayAddress)) as EffectiveRelayAddress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EffectiveRelayAddress create() => EffectiveRelayAddress._();
  EffectiveRelayAddress createEmptyInstance() => create();
  static $pb.PbList<EffectiveRelayAddress> createRepeated() => $pb.PbList<EffectiveRelayAddress>();
  @$core.pragma('dart2js:noInline')
  static EffectiveRelayAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EffectiveRelayAddress>(create);
  static EffectiveRelayAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get source => $_getSZ(1);
  @$pb.TagNumber(2)
  set source($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSource() => $_has(1);
  @$pb.TagNumber(2)
  void clearSource() => clearField(2);
}

class RelayConfigResponse extends $pb.GeneratedMessage {
  factory RelayConfigResponse({
    $core.bool? relayEnabled,
    $core.bool? useCommunityRelays,
    $core.Iterable<$core.String>? customRelayAddresses,
    $core.Iterable<EffectiveRelayAddress>? effectiveRelayAddresses,
  }) {
    final $result = create();
    if (relayEnabled != null) {
      $result.relayEnabled = relayEnabled;
    }
    if (useCommunityRelays != null) {
      $result.useCommunityRelays = useCommunityRelays;
    }
    if (customRelayAddresses != null) {
      $result.customRelayAddresses.addAll(customRelayAddresses);
    }
    if (effectiveRelayAddresses != null) {
      $result.effectiveRelayAddresses.addAll(effectiveRelayAddresses);
    }
    return $result;
  }
  RelayConfigResponse._() : super();
  factory RelayConfigResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RelayConfigResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RelayConfigResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'relayEnabled')
    ..aOB(2, _omitFieldNames ? '' : 'useCommunityRelays')
    ..pPS(3, _omitFieldNames ? '' : 'customRelayAddresses')
    ..pc<EffectiveRelayAddress>(4, _omitFieldNames ? '' : 'effectiveRelayAddresses', $pb.PbFieldType.PM, subBuilder: EffectiveRelayAddress.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RelayConfigResponse clone() => RelayConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RelayConfigResponse copyWith(void Function(RelayConfigResponse) updates) => super.copyWith((message) => updates(message as RelayConfigResponse)) as RelayConfigResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelayConfigResponse create() => RelayConfigResponse._();
  RelayConfigResponse createEmptyInstance() => create();
  static $pb.PbList<RelayConfigResponse> createRepeated() => $pb.PbList<RelayConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static RelayConfigResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelayConfigResponse>(create);
  static RelayConfigResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get relayEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set relayEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRelayEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelayEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get useCommunityRelays => $_getBF(1);
  @$pb.TagNumber(2)
  set useCommunityRelays($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUseCommunityRelays() => $_has(1);
  @$pb.TagNumber(2)
  void clearUseCommunityRelays() => clearField(2);

  /// User-facing relay list. The daemon keeps one list in config and separates
  /// TCP relay carriers from UDP/QUIC observers internally.
  @$pb.TagNumber(3)
  $core.List<$core.String> get customRelayAddresses => $_getList(2);

  /// Community plus custom relay addresses after config resolution, with the
  /// same TCP-carrier / UDP-observer semantics as custom_relay_addresses.
  @$pb.TagNumber(4)
  $core.List<EffectiveRelayAddress> get effectiveRelayAddresses => $_getList(3);
}

class RuntimeAllowedHostPathRequest extends $pb.GeneratedMessage {
  factory RuntimeAllowedHostPathRequest({
    $core.String? path,
  }) {
    final $result = create();
    if (path != null) {
      $result.path = path;
    }
    return $result;
  }
  RuntimeAllowedHostPathRequest._() : super();
  factory RuntimeAllowedHostPathRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RuntimeAllowedHostPathRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RuntimeAllowedHostPathRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'path')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RuntimeAllowedHostPathRequest clone() => RuntimeAllowedHostPathRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RuntimeAllowedHostPathRequest copyWith(void Function(RuntimeAllowedHostPathRequest) updates) => super.copyWith((message) => updates(message as RuntimeAllowedHostPathRequest)) as RuntimeAllowedHostPathRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedHostPathRequest create() => RuntimeAllowedHostPathRequest._();
  RuntimeAllowedHostPathRequest createEmptyInstance() => create();
  static $pb.PbList<RuntimeAllowedHostPathRequest> createRepeated() => $pb.PbList<RuntimeAllowedHostPathRequest>();
  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedHostPathRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RuntimeAllowedHostPathRequest>(create);
  static RuntimeAllowedHostPathRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class RuntimeAllowedPortRequest extends $pb.GeneratedMessage {
  factory RuntimeAllowedPortRequest({
    $core.int? port,
  }) {
    final $result = create();
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  RuntimeAllowedPortRequest._() : super();
  factory RuntimeAllowedPortRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RuntimeAllowedPortRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RuntimeAllowedPortRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RuntimeAllowedPortRequest clone() => RuntimeAllowedPortRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RuntimeAllowedPortRequest copyWith(void Function(RuntimeAllowedPortRequest) updates) => super.copyWith((message) => updates(message as RuntimeAllowedPortRequest)) as RuntimeAllowedPortRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedPortRequest create() => RuntimeAllowedPortRequest._();
  RuntimeAllowedPortRequest createEmptyInstance() => create();
  static $pb.PbList<RuntimeAllowedPortRequest> createRepeated() => $pb.PbList<RuntimeAllowedPortRequest>();
  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedPortRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RuntimeAllowedPortRequest>(create);
  static RuntimeAllowedPortRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get port => $_getIZ(0);
  @$pb.TagNumber(1)
  set port($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPort() => $_has(0);
  @$pb.TagNumber(1)
  void clearPort() => clearField(1);
}

class RuntimeAllowedPortRangeRequest extends $pb.GeneratedMessage {
  factory RuntimeAllowedPortRangeRequest({
    $core.int? start,
    $core.int? end,
  }) {
    final $result = create();
    if (start != null) {
      $result.start = start;
    }
    if (end != null) {
      $result.end = end;
    }
    return $result;
  }
  RuntimeAllowedPortRangeRequest._() : super();
  factory RuntimeAllowedPortRangeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RuntimeAllowedPortRangeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RuntimeAllowedPortRangeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'start', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'end', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RuntimeAllowedPortRangeRequest clone() => RuntimeAllowedPortRangeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RuntimeAllowedPortRangeRequest copyWith(void Function(RuntimeAllowedPortRangeRequest) updates) => super.copyWith((message) => updates(message as RuntimeAllowedPortRangeRequest)) as RuntimeAllowedPortRangeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedPortRangeRequest create() => RuntimeAllowedPortRangeRequest._();
  RuntimeAllowedPortRangeRequest createEmptyInstance() => create();
  static $pb.PbList<RuntimeAllowedPortRangeRequest> createRepeated() => $pb.PbList<RuntimeAllowedPortRangeRequest>();
  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedPortRangeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RuntimeAllowedPortRangeRequest>(create);
  static RuntimeAllowedPortRangeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get start => $_getIZ(0);
  @$pb.TagNumber(1)
  set start($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get end => $_getIZ(1);
  @$pb.TagNumber(2)
  set end($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);
}

class RuntimeAllowedPortRange extends $pb.GeneratedMessage {
  factory RuntimeAllowedPortRange({
    $core.int? start,
    $core.int? end,
  }) {
    final $result = create();
    if (start != null) {
      $result.start = start;
    }
    if (end != null) {
      $result.end = end;
    }
    return $result;
  }
  RuntimeAllowedPortRange._() : super();
  factory RuntimeAllowedPortRange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RuntimeAllowedPortRange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RuntimeAllowedPortRange', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'start', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'end', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RuntimeAllowedPortRange clone() => RuntimeAllowedPortRange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RuntimeAllowedPortRange copyWith(void Function(RuntimeAllowedPortRange) updates) => super.copyWith((message) => updates(message as RuntimeAllowedPortRange)) as RuntimeAllowedPortRange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedPortRange create() => RuntimeAllowedPortRange._();
  RuntimeAllowedPortRange createEmptyInstance() => create();
  static $pb.PbList<RuntimeAllowedPortRange> createRepeated() => $pb.PbList<RuntimeAllowedPortRange>();
  @$core.pragma('dart2js:noInline')
  static RuntimeAllowedPortRange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RuntimeAllowedPortRange>(create);
  static RuntimeAllowedPortRange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get start => $_getIZ(0);
  @$pb.TagNumber(1)
  set start($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStart() => $_has(0);
  @$pb.TagNumber(1)
  void clearStart() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get end => $_getIZ(1);
  @$pb.TagNumber(2)
  set end($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnd() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnd() => clearField(2);
}

class RuntimeConfigResponse extends $pb.GeneratedMessage {
  factory RuntimeConfigResponse({
    $core.bool? disableDocker,
    $core.bool? disableWasmtime,
    $core.Iterable<$core.String>? allowedHostPaths,
    $core.Iterable<$core.int>? allowedPorts,
    $core.Iterable<RuntimeAllowedPortRange>? allowedPortRanges,
  }) {
    final $result = create();
    if (disableDocker != null) {
      $result.disableDocker = disableDocker;
    }
    if (disableWasmtime != null) {
      $result.disableWasmtime = disableWasmtime;
    }
    if (allowedHostPaths != null) {
      $result.allowedHostPaths.addAll(allowedHostPaths);
    }
    if (allowedPorts != null) {
      $result.allowedPorts.addAll(allowedPorts);
    }
    if (allowedPortRanges != null) {
      $result.allowedPortRanges.addAll(allowedPortRanges);
    }
    return $result;
  }
  RuntimeConfigResponse._() : super();
  factory RuntimeConfigResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RuntimeConfigResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RuntimeConfigResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'disableDocker')
    ..aOB(2, _omitFieldNames ? '' : 'disableWasmtime')
    ..pPS(3, _omitFieldNames ? '' : 'allowedHostPaths')
    ..p<$core.int>(4, _omitFieldNames ? '' : 'allowedPorts', $pb.PbFieldType.K3)
    ..pc<RuntimeAllowedPortRange>(5, _omitFieldNames ? '' : 'allowedPortRanges', $pb.PbFieldType.PM, subBuilder: RuntimeAllowedPortRange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RuntimeConfigResponse clone() => RuntimeConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RuntimeConfigResponse copyWith(void Function(RuntimeConfigResponse) updates) => super.copyWith((message) => updates(message as RuntimeConfigResponse)) as RuntimeConfigResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeConfigResponse create() => RuntimeConfigResponse._();
  RuntimeConfigResponse createEmptyInstance() => create();
  static $pb.PbList<RuntimeConfigResponse> createRepeated() => $pb.PbList<RuntimeConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static RuntimeConfigResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RuntimeConfigResponse>(create);
  static RuntimeConfigResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get disableDocker => $_getBF(0);
  @$pb.TagNumber(1)
  set disableDocker($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDisableDocker() => $_has(0);
  @$pb.TagNumber(1)
  void clearDisableDocker() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get disableWasmtime => $_getBF(1);
  @$pb.TagNumber(2)
  set disableWasmtime($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisableWasmtime() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisableWasmtime() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get allowedHostPaths => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get allowedPorts => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<RuntimeAllowedPortRange> get allowedPortRanges => $_getList(4);
}

class RuntimeAvailabilityStatus extends $pb.GeneratedMessage {
  factory RuntimeAvailabilityStatus({
    $core.bool? configEnabled,
    $core.bool? detected,
    $core.bool? active,
    $core.String? endpoint,
  }) {
    final $result = create();
    if (configEnabled != null) {
      $result.configEnabled = configEnabled;
    }
    if (detected != null) {
      $result.detected = detected;
    }
    if (active != null) {
      $result.active = active;
    }
    if (endpoint != null) {
      $result.endpoint = endpoint;
    }
    return $result;
  }
  RuntimeAvailabilityStatus._() : super();
  factory RuntimeAvailabilityStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RuntimeAvailabilityStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RuntimeAvailabilityStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'configEnabled')
    ..aOB(2, _omitFieldNames ? '' : 'detected')
    ..aOB(3, _omitFieldNames ? '' : 'active')
    ..aOS(4, _omitFieldNames ? '' : 'endpoint')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RuntimeAvailabilityStatus clone() => RuntimeAvailabilityStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RuntimeAvailabilityStatus copyWith(void Function(RuntimeAvailabilityStatus) updates) => super.copyWith((message) => updates(message as RuntimeAvailabilityStatus)) as RuntimeAvailabilityStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RuntimeAvailabilityStatus create() => RuntimeAvailabilityStatus._();
  RuntimeAvailabilityStatus createEmptyInstance() => create();
  static $pb.PbList<RuntimeAvailabilityStatus> createRepeated() => $pb.PbList<RuntimeAvailabilityStatus>();
  @$core.pragma('dart2js:noInline')
  static RuntimeAvailabilityStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RuntimeAvailabilityStatus>(create);
  static RuntimeAvailabilityStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get configEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set configEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConfigEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearConfigEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get detected => $_getBF(1);
  @$pb.TagNumber(2)
  set detected($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDetected() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetected() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get active => $_getBF(2);
  @$pb.TagNumber(3)
  set active($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasActive() => $_has(2);
  @$pb.TagNumber(3)
  void clearActive() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get endpoint => $_getSZ(3);
  @$pb.TagNumber(4)
  set endpoint($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEndpoint() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndpoint() => clearField(4);
}

class LocalRuntimeStatusResponse extends $pb.GeneratedMessage {
  factory LocalRuntimeStatusResponse({
    RuntimeAvailabilityStatus? docker,
    RuntimeAvailabilityStatus? wasmtime,
  }) {
    final $result = create();
    if (docker != null) {
      $result.docker = docker;
    }
    if (wasmtime != null) {
      $result.wasmtime = wasmtime;
    }
    return $result;
  }
  LocalRuntimeStatusResponse._() : super();
  factory LocalRuntimeStatusResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocalRuntimeStatusResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocalRuntimeStatusResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOM<RuntimeAvailabilityStatus>(1, _omitFieldNames ? '' : 'docker', subBuilder: RuntimeAvailabilityStatus.create)
    ..aOM<RuntimeAvailabilityStatus>(2, _omitFieldNames ? '' : 'wasmtime', subBuilder: RuntimeAvailabilityStatus.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocalRuntimeStatusResponse clone() => LocalRuntimeStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocalRuntimeStatusResponse copyWith(void Function(LocalRuntimeStatusResponse) updates) => super.copyWith((message) => updates(message as LocalRuntimeStatusResponse)) as LocalRuntimeStatusResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalRuntimeStatusResponse create() => LocalRuntimeStatusResponse._();
  LocalRuntimeStatusResponse createEmptyInstance() => create();
  static $pb.PbList<LocalRuntimeStatusResponse> createRepeated() => $pb.PbList<LocalRuntimeStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static LocalRuntimeStatusResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocalRuntimeStatusResponse>(create);
  static LocalRuntimeStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  RuntimeAvailabilityStatus get docker => $_getN(0);
  @$pb.TagNumber(1)
  set docker(RuntimeAvailabilityStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDocker() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocker() => clearField(1);
  @$pb.TagNumber(1)
  RuntimeAvailabilityStatus ensureDocker() => $_ensure(0);

  @$pb.TagNumber(2)
  RuntimeAvailabilityStatus get wasmtime => $_getN(1);
  @$pb.TagNumber(2)
  set wasmtime(RuntimeAvailabilityStatus v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasWasmtime() => $_has(1);
  @$pb.TagNumber(2)
  void clearWasmtime() => clearField(2);
  @$pb.TagNumber(2)
  RuntimeAvailabilityStatus ensureWasmtime() => $_ensure(1);
}

class FileTransferServiceEnabledResponse extends $pb.GeneratedMessage {
  factory FileTransferServiceEnabledResponse({
    $core.bool? enabled,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    return $result;
  }
  FileTransferServiceEnabledResponse._() : super();
  factory FileTransferServiceEnabledResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileTransferServiceEnabledResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileTransferServiceEnabledResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileTransferServiceEnabledResponse clone() => FileTransferServiceEnabledResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileTransferServiceEnabledResponse copyWith(void Function(FileTransferServiceEnabledResponse) updates) => super.copyWith((message) => updates(message as FileTransferServiceEnabledResponse)) as FileTransferServiceEnabledResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileTransferServiceEnabledResponse create() => FileTransferServiceEnabledResponse._();
  FileTransferServiceEnabledResponse createEmptyInstance() => create();
  static $pb.PbList<FileTransferServiceEnabledResponse> createRepeated() => $pb.PbList<FileTransferServiceEnabledResponse>();
  @$core.pragma('dart2js:noInline')
  static FileTransferServiceEnabledResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileTransferServiceEnabledResponse>(create);
  static FileTransferServiceEnabledResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);
}

class FileTransferServiceRootDirResponse extends $pb.GeneratedMessage {
  factory FileTransferServiceRootDirResponse({
    $core.String? rootDir,
  }) {
    final $result = create();
    if (rootDir != null) {
      $result.rootDir = rootDir;
    }
    return $result;
  }
  FileTransferServiceRootDirResponse._() : super();
  factory FileTransferServiceRootDirResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileTransferServiceRootDirResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileTransferServiceRootDirResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rootDir')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileTransferServiceRootDirResponse clone() => FileTransferServiceRootDirResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileTransferServiceRootDirResponse copyWith(void Function(FileTransferServiceRootDirResponse) updates) => super.copyWith((message) => updates(message as FileTransferServiceRootDirResponse)) as FileTransferServiceRootDirResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileTransferServiceRootDirResponse create() => FileTransferServiceRootDirResponse._();
  FileTransferServiceRootDirResponse createEmptyInstance() => create();
  static $pb.PbList<FileTransferServiceRootDirResponse> createRepeated() => $pb.PbList<FileTransferServiceRootDirResponse>();
  @$core.pragma('dart2js:noInline')
  static FileTransferServiceRootDirResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileTransferServiceRootDirResponse>(create);
  static FileTransferServiceRootDirResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rootDir => $_getSZ(0);
  @$pb.TagNumber(1)
  set rootDir($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRootDir() => $_has(0);
  @$pb.TagNumber(1)
  void clearRootDir() => clearField(1);
}

class StartFileTransferServiceRequest extends $pb.GeneratedMessage {
  factory StartFileTransferServiceRequest({
    $core.String? rootDir,
  }) {
    final $result = create();
    if (rootDir != null) {
      $result.rootDir = rootDir;
    }
    return $result;
  }
  StartFileTransferServiceRequest._() : super();
  factory StartFileTransferServiceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StartFileTransferServiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StartFileTransferServiceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rootDir')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StartFileTransferServiceRequest clone() => StartFileTransferServiceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StartFileTransferServiceRequest copyWith(void Function(StartFileTransferServiceRequest) updates) => super.copyWith((message) => updates(message as StartFileTransferServiceRequest)) as StartFileTransferServiceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StartFileTransferServiceRequest create() => StartFileTransferServiceRequest._();
  StartFileTransferServiceRequest createEmptyInstance() => create();
  static $pb.PbList<StartFileTransferServiceRequest> createRepeated() => $pb.PbList<StartFileTransferServiceRequest>();
  @$core.pragma('dart2js:noInline')
  static StartFileTransferServiceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StartFileTransferServiceRequest>(create);
  static StartFileTransferServiceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get rootDir => $_getSZ(0);
  @$pb.TagNumber(1)
  set rootDir($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRootDir() => $_has(0);
  @$pb.TagNumber(1)
  void clearRootDir() => clearField(1);
}

class AddFileTransferClientRequest extends $pb.GeneratedMessage {
  factory AddFileTransferClientRequest({
    $core.bool? enabled,
    $core.String? name,
    $core.String? peerId,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    if (name != null) {
      $result.name = name;
    }
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  AddFileTransferClientRequest._() : super();
  factory AddFileTransferClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddFileTransferClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddFileTransferClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddFileTransferClientRequest clone() => AddFileTransferClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddFileTransferClientRequest copyWith(void Function(AddFileTransferClientRequest) updates) => super.copyWith((message) => updates(message as AddFileTransferClientRequest)) as AddFileTransferClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddFileTransferClientRequest create() => AddFileTransferClientRequest._();
  AddFileTransferClientRequest createEmptyInstance() => create();
  static $pb.PbList<AddFileTransferClientRequest> createRepeated() => $pb.PbList<AddFileTransferClientRequest>();
  @$core.pragma('dart2js:noInline')
  static AddFileTransferClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddFileTransferClientRequest>(create);
  static AddFileTransferClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get peerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set peerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPeerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeerId() => clearField(3);
}

class RemoveFileTransferClientRequest extends $pb.GeneratedMessage {
  factory RemoveFileTransferClientRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  RemoveFileTransferClientRequest._() : super();
  factory RemoveFileTransferClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveFileTransferClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveFileTransferClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveFileTransferClientRequest clone() => RemoveFileTransferClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveFileTransferClientRequest copyWith(void Function(RemoveFileTransferClientRequest) updates) => super.copyWith((message) => updates(message as RemoveFileTransferClientRequest)) as RemoveFileTransferClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveFileTransferClientRequest create() => RemoveFileTransferClientRequest._();
  RemoveFileTransferClientRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveFileTransferClientRequest> createRepeated() => $pb.PbList<RemoveFileTransferClientRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveFileTransferClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveFileTransferClientRequest>(create);
  static RemoveFileTransferClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class EnableFileTransferClientRequest extends $pb.GeneratedMessage {
  factory EnableFileTransferClientRequest({
    $core.String? peerId,
    $core.bool? enabled,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (enabled != null) {
      $result.enabled = enabled;
    }
    return $result;
  }
  EnableFileTransferClientRequest._() : super();
  factory EnableFileTransferClientRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory EnableFileTransferClientRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'EnableFileTransferClientRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOB(2, _omitFieldNames ? '' : 'enabled')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  EnableFileTransferClientRequest clone() => EnableFileTransferClientRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  EnableFileTransferClientRequest copyWith(void Function(EnableFileTransferClientRequest) updates) => super.copyWith((message) => updates(message as EnableFileTransferClientRequest)) as EnableFileTransferClientRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EnableFileTransferClientRequest create() => EnableFileTransferClientRequest._();
  EnableFileTransferClientRequest createEmptyInstance() => create();
  static $pb.PbList<EnableFileTransferClientRequest> createRepeated() => $pb.PbList<EnableFileTransferClientRequest>();
  @$core.pragma('dart2js:noInline')
  static EnableFileTransferClientRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EnableFileTransferClientRequest>(create);
  static EnableFileTransferClientRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get enabled => $_getBF(1);
  @$pb.TagNumber(2)
  set enabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearEnabled() => clearField(2);
}

class FileTransferClient extends $pb.GeneratedMessage {
  factory FileTransferClient({
    $core.bool? enabled,
    $core.String? name,
    $core.String? peerId,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    if (name != null) {
      $result.name = name;
    }
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  FileTransferClient._() : super();
  factory FileTransferClient.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileTransferClient.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileTransferClient', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileTransferClient clone() => FileTransferClient()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileTransferClient copyWith(void Function(FileTransferClient) updates) => super.copyWith((message) => updates(message as FileTransferClient)) as FileTransferClient;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileTransferClient create() => FileTransferClient._();
  FileTransferClient createEmptyInstance() => create();
  static $pb.PbList<FileTransferClient> createRepeated() => $pb.PbList<FileTransferClient>();
  @$core.pragma('dart2js:noInline')
  static FileTransferClient getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileTransferClient>(create);
  static FileTransferClient? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get peerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set peerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPeerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeerId() => clearField(3);
}

class FileTransferClientsResponse extends $pb.GeneratedMessage {
  factory FileTransferClientsResponse({
    $core.Iterable<FileTransferClient>? clients,
  }) {
    final $result = create();
    if (clients != null) {
      $result.clients.addAll(clients);
    }
    return $result;
  }
  FileTransferClientsResponse._() : super();
  factory FileTransferClientsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileTransferClientsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileTransferClientsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<FileTransferClient>(1, _omitFieldNames ? '' : 'clients', $pb.PbFieldType.PM, subBuilder: FileTransferClient.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileTransferClientsResponse clone() => FileTransferClientsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileTransferClientsResponse copyWith(void Function(FileTransferClientsResponse) updates) => super.copyWith((message) => updates(message as FileTransferClientsResponse)) as FileTransferClientsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileTransferClientsResponse create() => FileTransferClientsResponse._();
  FileTransferClientsResponse createEmptyInstance() => create();
  static $pb.PbList<FileTransferClientsResponse> createRepeated() => $pb.PbList<FileTransferClientsResponse>();
  @$core.pragma('dart2js:noInline')
  static FileTransferClientsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileTransferClientsResponse>(create);
  static FileTransferClientsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<FileTransferClient> get clients => $_getList(0);
}

class FtpProxyResponse extends $pb.GeneratedMessage {
  factory FtpProxyResponse({
    $core.bool? enabled,
    $core.String? host,
    $core.int? port,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  FtpProxyResponse._() : super();
  factory FtpProxyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FtpProxyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FtpProxyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOS(2, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FtpProxyResponse clone() => FtpProxyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FtpProxyResponse copyWith(void Function(FtpProxyResponse) updates) => super.copyWith((message) => updates(message as FtpProxyResponse)) as FtpProxyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FtpProxyResponse create() => FtpProxyResponse._();
  FtpProxyResponse createEmptyInstance() => create();
  static $pb.PbList<FtpProxyResponse> createRepeated() => $pb.PbList<FtpProxyResponse>();
  @$core.pragma('dart2js:noInline')
  static FtpProxyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FtpProxyResponse>(create);
  static FtpProxyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get host => $_getSZ(1);
  @$pb.TagNumber(2)
  set host($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearHost() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get port => $_getIZ(2);
  @$pb.TagNumber(3)
  set port($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearPort() => clearField(3);
}

class UpdateFtpProxyRequest extends $pb.GeneratedMessage {
  factory UpdateFtpProxyRequest({
    $core.bool? enabled,
    $core.String? host,
    $core.int? port,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  UpdateFtpProxyRequest._() : super();
  factory UpdateFtpProxyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateFtpProxyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateFtpProxyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOS(2, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateFtpProxyRequest clone() => UpdateFtpProxyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateFtpProxyRequest copyWith(void Function(UpdateFtpProxyRequest) updates) => super.copyWith((message) => updates(message as UpdateFtpProxyRequest)) as UpdateFtpProxyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateFtpProxyRequest create() => UpdateFtpProxyRequest._();
  UpdateFtpProxyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateFtpProxyRequest> createRepeated() => $pb.PbList<UpdateFtpProxyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateFtpProxyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateFtpProxyRequest>(create);
  static UpdateFtpProxyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get host => $_getSZ(1);
  @$pb.TagNumber(2)
  set host($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearHost() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get port => $_getIZ(2);
  @$pb.TagNumber(3)
  set port($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearPort() => clearField(3);
}

class WebdavProxyResponse extends $pb.GeneratedMessage {
  factory WebdavProxyResponse({
    $core.bool? enabled,
    $core.String? host,
    $core.int? port,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  WebdavProxyResponse._() : super();
  factory WebdavProxyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WebdavProxyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WebdavProxyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOS(2, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WebdavProxyResponse clone() => WebdavProxyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WebdavProxyResponse copyWith(void Function(WebdavProxyResponse) updates) => super.copyWith((message) => updates(message as WebdavProxyResponse)) as WebdavProxyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WebdavProxyResponse create() => WebdavProxyResponse._();
  WebdavProxyResponse createEmptyInstance() => create();
  static $pb.PbList<WebdavProxyResponse> createRepeated() => $pb.PbList<WebdavProxyResponse>();
  @$core.pragma('dart2js:noInline')
  static WebdavProxyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WebdavProxyResponse>(create);
  static WebdavProxyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get host => $_getSZ(1);
  @$pb.TagNumber(2)
  set host($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearHost() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get port => $_getIZ(2);
  @$pb.TagNumber(3)
  set port($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearPort() => clearField(3);
}

class UpdateWebdavProxyRequest extends $pb.GeneratedMessage {
  factory UpdateWebdavProxyRequest({
    $core.bool? enabled,
    $core.String? host,
    $core.int? port,
  }) {
    final $result = create();
    if (enabled != null) {
      $result.enabled = enabled;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  UpdateWebdavProxyRequest._() : super();
  factory UpdateWebdavProxyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateWebdavProxyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateWebdavProxyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'enabled')
    ..aOS(2, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateWebdavProxyRequest clone() => UpdateWebdavProxyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateWebdavProxyRequest copyWith(void Function(UpdateWebdavProxyRequest) updates) => super.copyWith((message) => updates(message as UpdateWebdavProxyRequest)) as UpdateWebdavProxyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateWebdavProxyRequest create() => UpdateWebdavProxyRequest._();
  UpdateWebdavProxyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateWebdavProxyRequest> createRepeated() => $pb.PbList<UpdateWebdavProxyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateWebdavProxyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateWebdavProxyRequest>(create);
  static UpdateWebdavProxyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get enabled => $_getBF(0);
  @$pb.TagNumber(1)
  set enabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get host => $_getSZ(1);
  @$pb.TagNumber(2)
  set host($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHost() => $_has(1);
  @$pb.TagNumber(2)
  void clearHost() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get port => $_getIZ(2);
  @$pb.TagNumber(3)
  set port($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPort() => $_has(2);
  @$pb.TagNumber(3)
  void clearPort() => clearField(3);
}

class ForwardingRule extends $pb.GeneratedMessage {
  factory ForwardingRule({
    $core.String? localHost,
    $core.int? localPort,
    $core.String? remotePeerId,
    $core.int? remotePort,
    $core.String? remoteProtocol,
    $core.String? remoteServiceId,
    $core.String? remoteServiceName,
    $core.String? remoteServicePortName,
  }) {
    final $result = create();
    if (localHost != null) {
      $result.localHost = localHost;
    }
    if (localPort != null) {
      $result.localPort = localPort;
    }
    if (remotePeerId != null) {
      $result.remotePeerId = remotePeerId;
    }
    if (remotePort != null) {
      $result.remotePort = remotePort;
    }
    if (remoteProtocol != null) {
      $result.remoteProtocol = remoteProtocol;
    }
    if (remoteServiceId != null) {
      $result.remoteServiceId = remoteServiceId;
    }
    if (remoteServiceName != null) {
      $result.remoteServiceName = remoteServiceName;
    }
    if (remoteServicePortName != null) {
      $result.remoteServicePortName = remoteServicePortName;
    }
    return $result;
  }
  ForwardingRule._() : super();
  factory ForwardingRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForwardingRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ForwardingRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localHost')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'localPort', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'remotePeerId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'remotePort', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'remoteProtocol')
    ..aOS(6, _omitFieldNames ? '' : 'remoteServiceId')
    ..aOS(7, _omitFieldNames ? '' : 'remoteServiceName')
    ..aOS(8, _omitFieldNames ? '' : 'remoteServicePortName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForwardingRule clone() => ForwardingRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForwardingRule copyWith(void Function(ForwardingRule) updates) => super.copyWith((message) => updates(message as ForwardingRule)) as ForwardingRule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ForwardingRule create() => ForwardingRule._();
  ForwardingRule createEmptyInstance() => create();
  static $pb.PbList<ForwardingRule> createRepeated() => $pb.PbList<ForwardingRule>();
  @$core.pragma('dart2js:noInline')
  static ForwardingRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForwardingRule>(create);
  static ForwardingRule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localHost => $_getSZ(0);
  @$pb.TagNumber(1)
  set localHost($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get localPort => $_getIZ(1);
  @$pb.TagNumber(2)
  set localPort($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get remotePeerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set remotePeerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemotePeerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemotePeerId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get remotePort => $_getIZ(3);
  @$pb.TagNumber(4)
  set remotePort($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRemotePort() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemotePort() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get remoteProtocol => $_getSZ(4);
  @$pb.TagNumber(5)
  set remoteProtocol($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRemoteProtocol() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemoteProtocol() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get remoteServiceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set remoteServiceId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRemoteServiceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRemoteServiceId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get remoteServiceName => $_getSZ(6);
  @$pb.TagNumber(7)
  set remoteServiceName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRemoteServiceName() => $_has(6);
  @$pb.TagNumber(7)
  void clearRemoteServiceName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get remoteServicePortName => $_getSZ(7);
  @$pb.TagNumber(8)
  set remoteServicePortName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRemoteServicePortName() => $_has(7);
  @$pb.TagNumber(8)
  void clearRemoteServicePortName() => clearField(8);
}

class ListeningRule extends $pb.GeneratedMessage {
  factory ListeningRule({
    $core.String? host,
    $core.int? port,
    $core.Iterable<$core.String>? allowedPeers,
    $core.String? protocol,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    if (allowedPeers != null) {
      $result.allowedPeers.addAll(allowedPeers);
    }
    if (protocol != null) {
      $result.protocol = protocol;
    }
    return $result;
  }
  ListeningRule._() : super();
  factory ListeningRule.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListeningRule.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListeningRule', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'port', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'allowedPeers')
    ..aOS(4, _omitFieldNames ? '' : 'protocol')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListeningRule clone() => ListeningRule()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListeningRule copyWith(void Function(ListeningRule) updates) => super.copyWith((message) => updates(message as ListeningRule)) as ListeningRule;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListeningRule create() => ListeningRule._();
  ListeningRule createEmptyInstance() => create();
  static $pb.PbList<ListeningRule> createRepeated() => $pb.PbList<ListeningRule>();
  @$core.pragma('dart2js:noInline')
  static ListeningRule getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListeningRule>(create);
  static ListeningRule? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get allowedPeers => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get protocol => $_getSZ(3);
  @$pb.TagNumber(4)
  set protocol($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProtocol() => $_has(3);
  @$pb.TagNumber(4)
  void clearProtocol() => clearField(4);
}

class TcpTunnelingConfigResponse extends $pb.GeneratedMessage {
  factory TcpTunnelingConfigResponse({
    $core.bool? forwardingEnabled,
    $core.bool? listeningEnabled,
    $core.Iterable<ForwardingRule>? forwardingRules,
    $core.Iterable<ListeningRule>? listeningRules,
  }) {
    final $result = create();
    if (forwardingEnabled != null) {
      $result.forwardingEnabled = forwardingEnabled;
    }
    if (listeningEnabled != null) {
      $result.listeningEnabled = listeningEnabled;
    }
    if (forwardingRules != null) {
      $result.forwardingRules.addAll(forwardingRules);
    }
    if (listeningRules != null) {
      $result.listeningRules.addAll(listeningRules);
    }
    return $result;
  }
  TcpTunnelingConfigResponse._() : super();
  factory TcpTunnelingConfigResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TcpTunnelingConfigResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TcpTunnelingConfigResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'forwardingEnabled')
    ..aOB(2, _omitFieldNames ? '' : 'listeningEnabled')
    ..pc<ForwardingRule>(3, _omitFieldNames ? '' : 'forwardingRules', $pb.PbFieldType.PM, subBuilder: ForwardingRule.create)
    ..pc<ListeningRule>(4, _omitFieldNames ? '' : 'listeningRules', $pb.PbFieldType.PM, subBuilder: ListeningRule.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TcpTunnelingConfigResponse clone() => TcpTunnelingConfigResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TcpTunnelingConfigResponse copyWith(void Function(TcpTunnelingConfigResponse) updates) => super.copyWith((message) => updates(message as TcpTunnelingConfigResponse)) as TcpTunnelingConfigResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TcpTunnelingConfigResponse create() => TcpTunnelingConfigResponse._();
  TcpTunnelingConfigResponse createEmptyInstance() => create();
  static $pb.PbList<TcpTunnelingConfigResponse> createRepeated() => $pb.PbList<TcpTunnelingConfigResponse>();
  @$core.pragma('dart2js:noInline')
  static TcpTunnelingConfigResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TcpTunnelingConfigResponse>(create);
  static TcpTunnelingConfigResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get forwardingEnabled => $_getBF(0);
  @$pb.TagNumber(1)
  set forwardingEnabled($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasForwardingEnabled() => $_has(0);
  @$pb.TagNumber(1)
  void clearForwardingEnabled() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get listeningEnabled => $_getBF(1);
  @$pb.TagNumber(2)
  set listeningEnabled($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasListeningEnabled() => $_has(1);
  @$pb.TagNumber(2)
  void clearListeningEnabled() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ForwardingRule> get forwardingRules => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<ListeningRule> get listeningRules => $_getList(3);
}

class AddTcpForwardingRuleRequest extends $pb.GeneratedMessage {
  factory AddTcpForwardingRuleRequest({
    $core.String? localHost,
    $core.int? localPort,
    $core.String? peerId,
    $core.int? remotePort,
    $core.String? remoteProtocol,
    $core.String? remoteServiceId,
    $core.String? remoteServiceName,
    $core.String? remoteServicePortName,
  }) {
    final $result = create();
    if (localHost != null) {
      $result.localHost = localHost;
    }
    if (localPort != null) {
      $result.localPort = localPort;
    }
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (remotePort != null) {
      $result.remotePort = remotePort;
    }
    if (remoteProtocol != null) {
      $result.remoteProtocol = remoteProtocol;
    }
    if (remoteServiceId != null) {
      $result.remoteServiceId = remoteServiceId;
    }
    if (remoteServiceName != null) {
      $result.remoteServiceName = remoteServiceName;
    }
    if (remoteServicePortName != null) {
      $result.remoteServicePortName = remoteServicePortName;
    }
    return $result;
  }
  AddTcpForwardingRuleRequest._() : super();
  factory AddTcpForwardingRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTcpForwardingRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTcpForwardingRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localHost')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'localPort', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'peerId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'remotePort', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'remoteProtocol')
    ..aOS(6, _omitFieldNames ? '' : 'remoteServiceId')
    ..aOS(7, _omitFieldNames ? '' : 'remoteServiceName')
    ..aOS(8, _omitFieldNames ? '' : 'remoteServicePortName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTcpForwardingRuleRequest clone() => AddTcpForwardingRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTcpForwardingRuleRequest copyWith(void Function(AddTcpForwardingRuleRequest) updates) => super.copyWith((message) => updates(message as AddTcpForwardingRuleRequest)) as AddTcpForwardingRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTcpForwardingRuleRequest create() => AddTcpForwardingRuleRequest._();
  AddTcpForwardingRuleRequest createEmptyInstance() => create();
  static $pb.PbList<AddTcpForwardingRuleRequest> createRepeated() => $pb.PbList<AddTcpForwardingRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static AddTcpForwardingRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTcpForwardingRuleRequest>(create);
  static AddTcpForwardingRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localHost => $_getSZ(0);
  @$pb.TagNumber(1)
  set localHost($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get localPort => $_getIZ(1);
  @$pb.TagNumber(2)
  set localPort($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get peerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set peerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPeerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeerId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get remotePort => $_getIZ(3);
  @$pb.TagNumber(4)
  set remotePort($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRemotePort() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemotePort() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get remoteProtocol => $_getSZ(4);
  @$pb.TagNumber(5)
  set remoteProtocol($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRemoteProtocol() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemoteProtocol() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get remoteServiceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set remoteServiceId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasRemoteServiceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRemoteServiceId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get remoteServiceName => $_getSZ(6);
  @$pb.TagNumber(7)
  set remoteServiceName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRemoteServiceName() => $_has(6);
  @$pb.TagNumber(7)
  void clearRemoteServiceName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get remoteServicePortName => $_getSZ(7);
  @$pb.TagNumber(8)
  set remoteServicePortName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRemoteServicePortName() => $_has(7);
  @$pb.TagNumber(8)
  void clearRemoteServicePortName() => clearField(8);
}

class TcpForwardingRuleResponse extends $pb.GeneratedMessage {
  factory TcpForwardingRuleResponse({
    $core.String? ruleId,
  }) {
    final $result = create();
    if (ruleId != null) {
      $result.ruleId = ruleId;
    }
    return $result;
  }
  TcpForwardingRuleResponse._() : super();
  factory TcpForwardingRuleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TcpForwardingRuleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TcpForwardingRuleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ruleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TcpForwardingRuleResponse clone() => TcpForwardingRuleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TcpForwardingRuleResponse copyWith(void Function(TcpForwardingRuleResponse) updates) => super.copyWith((message) => updates(message as TcpForwardingRuleResponse)) as TcpForwardingRuleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TcpForwardingRuleResponse create() => TcpForwardingRuleResponse._();
  TcpForwardingRuleResponse createEmptyInstance() => create();
  static $pb.PbList<TcpForwardingRuleResponse> createRepeated() => $pb.PbList<TcpForwardingRuleResponse>();
  @$core.pragma('dart2js:noInline')
  static TcpForwardingRuleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TcpForwardingRuleResponse>(create);
  static TcpForwardingRuleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ruleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ruleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRuleId() => clearField(1);
}

class RemoveTcpForwardingRuleRequest extends $pb.GeneratedMessage {
  factory RemoveTcpForwardingRuleRequest({
    $core.String? localHost,
    $core.int? localPort,
    $core.String? peerId,
    $core.int? remotePort,
    $core.String? remoteProtocol,
  }) {
    final $result = create();
    if (localHost != null) {
      $result.localHost = localHost;
    }
    if (localPort != null) {
      $result.localPort = localPort;
    }
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (remotePort != null) {
      $result.remotePort = remotePort;
    }
    if (remoteProtocol != null) {
      $result.remoteProtocol = remoteProtocol;
    }
    return $result;
  }
  RemoveTcpForwardingRuleRequest._() : super();
  factory RemoveTcpForwardingRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveTcpForwardingRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveTcpForwardingRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localHost')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'localPort', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'peerId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'remotePort', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'remoteProtocol')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveTcpForwardingRuleRequest clone() => RemoveTcpForwardingRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveTcpForwardingRuleRequest copyWith(void Function(RemoveTcpForwardingRuleRequest) updates) => super.copyWith((message) => updates(message as RemoveTcpForwardingRuleRequest)) as RemoveTcpForwardingRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveTcpForwardingRuleRequest create() => RemoveTcpForwardingRuleRequest._();
  RemoveTcpForwardingRuleRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveTcpForwardingRuleRequest> createRepeated() => $pb.PbList<RemoveTcpForwardingRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveTcpForwardingRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveTcpForwardingRuleRequest>(create);
  static RemoveTcpForwardingRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localHost => $_getSZ(0);
  @$pb.TagNumber(1)
  set localHost($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get localPort => $_getIZ(1);
  @$pb.TagNumber(2)
  set localPort($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get peerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set peerId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPeerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPeerId() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get remotePort => $_getIZ(3);
  @$pb.TagNumber(4)
  set remotePort($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRemotePort() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemotePort() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get remoteProtocol => $_getSZ(4);
  @$pb.TagNumber(5)
  set remoteProtocol($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRemoteProtocol() => $_has(4);
  @$pb.TagNumber(5)
  void clearRemoteProtocol() => clearField(5);
}

class AddTcpListeningRuleRequest extends $pb.GeneratedMessage {
  factory AddTcpListeningRuleRequest({
    $core.String? localHost,
    $core.int? localPort,
    $core.Iterable<$core.String>? allowedPeers,
    $core.String? protocol,
  }) {
    final $result = create();
    if (localHost != null) {
      $result.localHost = localHost;
    }
    if (localPort != null) {
      $result.localPort = localPort;
    }
    if (allowedPeers != null) {
      $result.allowedPeers.addAll(allowedPeers);
    }
    if (protocol != null) {
      $result.protocol = protocol;
    }
    return $result;
  }
  AddTcpListeningRuleRequest._() : super();
  factory AddTcpListeningRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddTcpListeningRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddTcpListeningRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localHost')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'localPort', $pb.PbFieldType.O3)
    ..pPS(3, _omitFieldNames ? '' : 'allowedPeers')
    ..aOS(4, _omitFieldNames ? '' : 'protocol')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddTcpListeningRuleRequest clone() => AddTcpListeningRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddTcpListeningRuleRequest copyWith(void Function(AddTcpListeningRuleRequest) updates) => super.copyWith((message) => updates(message as AddTcpListeningRuleRequest)) as AddTcpListeningRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTcpListeningRuleRequest create() => AddTcpListeningRuleRequest._();
  AddTcpListeningRuleRequest createEmptyInstance() => create();
  static $pb.PbList<AddTcpListeningRuleRequest> createRepeated() => $pb.PbList<AddTcpListeningRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static AddTcpListeningRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddTcpListeningRuleRequest>(create);
  static AddTcpListeningRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localHost => $_getSZ(0);
  @$pb.TagNumber(1)
  set localHost($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get localPort => $_getIZ(1);
  @$pb.TagNumber(2)
  set localPort($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get allowedPeers => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get protocol => $_getSZ(3);
  @$pb.TagNumber(4)
  set protocol($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProtocol() => $_has(3);
  @$pb.TagNumber(4)
  void clearProtocol() => clearField(4);
}

class TcpListeningRuleResponse extends $pb.GeneratedMessage {
  factory TcpListeningRuleResponse({
    $core.String? ruleId,
  }) {
    final $result = create();
    if (ruleId != null) {
      $result.ruleId = ruleId;
    }
    return $result;
  }
  TcpListeningRuleResponse._() : super();
  factory TcpListeningRuleResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TcpListeningRuleResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TcpListeningRuleResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'ruleId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TcpListeningRuleResponse clone() => TcpListeningRuleResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TcpListeningRuleResponse copyWith(void Function(TcpListeningRuleResponse) updates) => super.copyWith((message) => updates(message as TcpListeningRuleResponse)) as TcpListeningRuleResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TcpListeningRuleResponse create() => TcpListeningRuleResponse._();
  TcpListeningRuleResponse createEmptyInstance() => create();
  static $pb.PbList<TcpListeningRuleResponse> createRepeated() => $pb.PbList<TcpListeningRuleResponse>();
  @$core.pragma('dart2js:noInline')
  static TcpListeningRuleResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TcpListeningRuleResponse>(create);
  static TcpListeningRuleResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get ruleId => $_getSZ(0);
  @$pb.TagNumber(1)
  set ruleId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRuleId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRuleId() => clearField(1);
}

class RemoveTcpListeningRuleRequest extends $pb.GeneratedMessage {
  factory RemoveTcpListeningRuleRequest({
    $core.String? localHost,
    $core.int? localPort,
    $core.String? protocol,
  }) {
    final $result = create();
    if (localHost != null) {
      $result.localHost = localHost;
    }
    if (localPort != null) {
      $result.localPort = localPort;
    }
    if (protocol != null) {
      $result.protocol = protocol;
    }
    return $result;
  }
  RemoveTcpListeningRuleRequest._() : super();
  factory RemoveTcpListeningRuleRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveTcpListeningRuleRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveTcpListeningRuleRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'localHost')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'localPort', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'protocol')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveTcpListeningRuleRequest clone() => RemoveTcpListeningRuleRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveTcpListeningRuleRequest copyWith(void Function(RemoveTcpListeningRuleRequest) updates) => super.copyWith((message) => updates(message as RemoveTcpListeningRuleRequest)) as RemoveTcpListeningRuleRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveTcpListeningRuleRequest create() => RemoveTcpListeningRuleRequest._();
  RemoveTcpListeningRuleRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveTcpListeningRuleRequest> createRepeated() => $pb.PbList<RemoveTcpListeningRuleRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveTcpListeningRuleRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveTcpListeningRuleRequest>(create);
  static RemoveTcpListeningRuleRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get localHost => $_getSZ(0);
  @$pb.TagNumber(1)
  set localHost($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLocalHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocalHost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get localPort => $_getIZ(1);
  @$pb.TagNumber(2)
  set localPort($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLocalPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearLocalPort() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get protocol => $_getSZ(2);
  @$pb.TagNumber(3)
  set protocol($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProtocol() => $_has(2);
  @$pb.TagNumber(3)
  void clearProtocol() => clearField(3);
}

class PeerInfo extends $pb.GeneratedMessage {
  factory PeerInfo({
    $core.String? peerId,
    $core.String? alias,
    $core.String? hostname,
    $core.String? os,
    $core.String? publicIp,
    $core.Iterable<$core.String>? privateIps,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? lastConnected,
    $core.String? version,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (alias != null) {
      $result.alias = alias;
    }
    if (hostname != null) {
      $result.hostname = hostname;
    }
    if (os != null) {
      $result.os = os;
    }
    if (publicIp != null) {
      $result.publicIp = publicIp;
    }
    if (privateIps != null) {
      $result.privateIps.addAll(privateIps);
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (lastConnected != null) {
      $result.lastConnected = lastConnected;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  PeerInfo._() : super();
  factory PeerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PeerInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'alias')
    ..aOS(3, _omitFieldNames ? '' : 'hostname')
    ..aOS(4, _omitFieldNames ? '' : 'os')
    ..aOS(5, _omitFieldNames ? '' : 'publicIp')
    ..pPS(6, _omitFieldNames ? '' : 'privateIps')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(8, _omitFieldNames ? '' : 'lastConnected')
    ..aOS(9, _omitFieldNames ? '' : 'version')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeerInfo clone() => PeerInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeerInfo copyWith(void Function(PeerInfo) updates) => super.copyWith((message) => updates(message as PeerInfo)) as PeerInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PeerInfo create() => PeerInfo._();
  PeerInfo createEmptyInstance() => create();
  static $pb.PbList<PeerInfo> createRepeated() => $pb.PbList<PeerInfo>();
  @$core.pragma('dart2js:noInline')
  static PeerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeerInfo>(create);
  static PeerInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get alias => $_getSZ(1);
  @$pb.TagNumber(2)
  set alias($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAlias() => $_has(1);
  @$pb.TagNumber(2)
  void clearAlias() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get hostname => $_getSZ(2);
  @$pb.TagNumber(3)
  set hostname($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHostname() => $_has(2);
  @$pb.TagNumber(3)
  void clearHostname() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get os => $_getSZ(3);
  @$pb.TagNumber(4)
  set os($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOs() => $_has(3);
  @$pb.TagNumber(4)
  void clearOs() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get publicIp => $_getSZ(4);
  @$pb.TagNumber(5)
  set publicIp($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPublicIp() => $_has(4);
  @$pb.TagNumber(5)
  void clearPublicIp() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get privateIps => $_getList(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(6);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lastConnected => $_getI64(7);
  @$pb.TagNumber(8)
  set lastConnected($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastConnected() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastConnected() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get version => $_getSZ(8);
  @$pb.TagNumber(9)
  set version($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasVersion() => $_has(8);
  @$pb.TagNumber(9)
  void clearVersion() => clearField(9);
}

class PeerInfoListResponse extends $pb.GeneratedMessage {
  factory PeerInfoListResponse({
    $core.Iterable<PeerInfo>? peers,
  }) {
    final $result = create();
    if (peers != null) {
      $result.peers.addAll(peers);
    }
    return $result;
  }
  PeerInfoListResponse._() : super();
  factory PeerInfoListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeerInfoListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PeerInfoListResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<PeerInfo>(1, _omitFieldNames ? '' : 'peers', $pb.PbFieldType.PM, subBuilder: PeerInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeerInfoListResponse clone() => PeerInfoListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeerInfoListResponse copyWith(void Function(PeerInfoListResponse) updates) => super.copyWith((message) => updates(message as PeerInfoListResponse)) as PeerInfoListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PeerInfoListResponse create() => PeerInfoListResponse._();
  PeerInfoListResponse createEmptyInstance() => create();
  static $pb.PbList<PeerInfoListResponse> createRepeated() => $pb.PbList<PeerInfoListResponse>();
  @$core.pragma('dart2js:noInline')
  static PeerInfoListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeerInfoListResponse>(create);
  static PeerInfoListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PeerInfo> get peers => $_getList(0);
}

class PeerInfoResponse extends $pb.GeneratedMessage {
  factory PeerInfoResponse({
    PeerInfo? peerInfo,
  }) {
    final $result = create();
    if (peerInfo != null) {
      $result.peerInfo = peerInfo;
    }
    return $result;
  }
  PeerInfoResponse._() : super();
  factory PeerInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeerInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PeerInfoResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOM<PeerInfo>(1, _omitFieldNames ? '' : 'peerInfo', subBuilder: PeerInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeerInfoResponse clone() => PeerInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeerInfoResponse copyWith(void Function(PeerInfoResponse) updates) => super.copyWith((message) => updates(message as PeerInfoResponse)) as PeerInfoResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PeerInfoResponse create() => PeerInfoResponse._();
  PeerInfoResponse createEmptyInstance() => create();
  static $pb.PbList<PeerInfoResponse> createRepeated() => $pb.PbList<PeerInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static PeerInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeerInfoResponse>(create);
  static PeerInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PeerInfo get peerInfo => $_getN(0);
  @$pb.TagNumber(1)
  set peerInfo(PeerInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerInfo() => clearField(1);
  @$pb.TagNumber(1)
  PeerInfo ensurePeerInfo() => $_ensure(0);
}

class UpdateAddressBookPeerRequest extends $pb.GeneratedMessage {
  factory UpdateAddressBookPeerRequest({
    PeerInfo? peerInfo,
  }) {
    final $result = create();
    if (peerInfo != null) {
      $result.peerInfo = peerInfo;
    }
    return $result;
  }
  UpdateAddressBookPeerRequest._() : super();
  factory UpdateAddressBookPeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAddressBookPeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAddressBookPeerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOM<PeerInfo>(1, _omitFieldNames ? '' : 'peerInfo', subBuilder: PeerInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAddressBookPeerRequest clone() => UpdateAddressBookPeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAddressBookPeerRequest copyWith(void Function(UpdateAddressBookPeerRequest) updates) => super.copyWith((message) => updates(message as UpdateAddressBookPeerRequest)) as UpdateAddressBookPeerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAddressBookPeerRequest create() => UpdateAddressBookPeerRequest._();
  UpdateAddressBookPeerRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAddressBookPeerRequest> createRepeated() => $pb.PbList<UpdateAddressBookPeerRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAddressBookPeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAddressBookPeerRequest>(create);
  static UpdateAddressBookPeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  PeerInfo get peerInfo => $_getN(0);
  @$pb.TagNumber(1)
  set peerInfo(PeerInfo v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerInfo() => clearField(1);
  @$pb.TagNumber(1)
  PeerInfo ensurePeerInfo() => $_ensure(0);
}

class GetAddressBookPeerRequest extends $pb.GeneratedMessage {
  factory GetAddressBookPeerRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  GetAddressBookPeerRequest._() : super();
  factory GetAddressBookPeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAddressBookPeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAddressBookPeerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAddressBookPeerRequest clone() => GetAddressBookPeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAddressBookPeerRequest copyWith(void Function(GetAddressBookPeerRequest) updates) => super.copyWith((message) => updates(message as GetAddressBookPeerRequest)) as GetAddressBookPeerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAddressBookPeerRequest create() => GetAddressBookPeerRequest._();
  GetAddressBookPeerRequest createEmptyInstance() => create();
  static $pb.PbList<GetAddressBookPeerRequest> createRepeated() => $pb.PbList<GetAddressBookPeerRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAddressBookPeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAddressBookPeerRequest>(create);
  static GetAddressBookPeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class RemoveAddressBookPeerRequest extends $pb.GeneratedMessage {
  factory RemoveAddressBookPeerRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  RemoveAddressBookPeerRequest._() : super();
  factory RemoveAddressBookPeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveAddressBookPeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveAddressBookPeerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveAddressBookPeerRequest clone() => RemoveAddressBookPeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveAddressBookPeerRequest copyWith(void Function(RemoveAddressBookPeerRequest) updates) => super.copyWith((message) => updates(message as RemoveAddressBookPeerRequest)) as RemoveAddressBookPeerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveAddressBookPeerRequest create() => RemoveAddressBookPeerRequest._();
  RemoveAddressBookPeerRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveAddressBookPeerRequest> createRepeated() => $pb.PbList<RemoveAddressBookPeerRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveAddressBookPeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveAddressBookPeerRequest>(create);
  static RemoveAddressBookPeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class PingPeerRequest extends $pb.GeneratedMessage {
  factory PingPeerRequest({
    $core.String? peerId,
    $core.int? intervalMs,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (intervalMs != null) {
      $result.intervalMs = intervalMs;
    }
    return $result;
  }
  PingPeerRequest._() : super();
  factory PingPeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingPeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingPeerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'intervalMs', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingPeerRequest clone() => PingPeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingPeerRequest copyWith(void Function(PingPeerRequest) updates) => super.copyWith((message) => updates(message as PingPeerRequest)) as PingPeerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingPeerRequest create() => PingPeerRequest._();
  PingPeerRequest createEmptyInstance() => create();
  static $pb.PbList<PingPeerRequest> createRepeated() => $pb.PbList<PingPeerRequest>();
  @$core.pragma('dart2js:noInline')
  static PingPeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingPeerRequest>(create);
  static PingPeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get intervalMs => $_getIZ(1);
  @$pb.TagNumber(2)
  set intervalMs($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIntervalMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearIntervalMs() => clearField(2);
}

enum PingPeerEvent_Event {
  connecting, 
  connected, 
  idle, 
  result, 
  error, 
  notSet
}

class PingPeerEvent extends $pb.GeneratedMessage {
  factory PingPeerEvent({
    $core.String? peerId,
    $fixnum.Int64? tickSeq,
    $fixnum.Int64? tsUnixMs,
    PingPeerConnecting? connecting,
    PingPeerConnected? connected,
    PingPeerIdle? idle,
    PingPeerResult? result,
    PingPeerError? error,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (tickSeq != null) {
      $result.tickSeq = tickSeq;
    }
    if (tsUnixMs != null) {
      $result.tsUnixMs = tsUnixMs;
    }
    if (connecting != null) {
      $result.connecting = connecting;
    }
    if (connected != null) {
      $result.connected = connected;
    }
    if (idle != null) {
      $result.idle = idle;
    }
    if (result != null) {
      $result.result = result;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  PingPeerEvent._() : super();
  factory PingPeerEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingPeerEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, PingPeerEvent_Event> _PingPeerEvent_EventByTag = {
    10 : PingPeerEvent_Event.connecting,
    11 : PingPeerEvent_Event.connected,
    12 : PingPeerEvent_Event.idle,
    13 : PingPeerEvent_Event.result,
    14 : PingPeerEvent_Event.error,
    0 : PingPeerEvent_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingPeerEvent', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 14])
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'tickSeq', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(3, _omitFieldNames ? '' : 'tsUnixMs')
    ..aOM<PingPeerConnecting>(10, _omitFieldNames ? '' : 'connecting', subBuilder: PingPeerConnecting.create)
    ..aOM<PingPeerConnected>(11, _omitFieldNames ? '' : 'connected', subBuilder: PingPeerConnected.create)
    ..aOM<PingPeerIdle>(12, _omitFieldNames ? '' : 'idle', subBuilder: PingPeerIdle.create)
    ..aOM<PingPeerResult>(13, _omitFieldNames ? '' : 'result', subBuilder: PingPeerResult.create)
    ..aOM<PingPeerError>(14, _omitFieldNames ? '' : 'error', subBuilder: PingPeerError.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingPeerEvent clone() => PingPeerEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingPeerEvent copyWith(void Function(PingPeerEvent) updates) => super.copyWith((message) => updates(message as PingPeerEvent)) as PingPeerEvent;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingPeerEvent create() => PingPeerEvent._();
  PingPeerEvent createEmptyInstance() => create();
  static $pb.PbList<PingPeerEvent> createRepeated() => $pb.PbList<PingPeerEvent>();
  @$core.pragma('dart2js:noInline')
  static PingPeerEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingPeerEvent>(create);
  static PingPeerEvent? _defaultInstance;

  PingPeerEvent_Event whichEvent() => _PingPeerEvent_EventByTag[$_whichOneof(0)]!;
  void clearEvent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get tickSeq => $_getI64(1);
  @$pb.TagNumber(2)
  set tickSeq($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTickSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearTickSeq() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get tsUnixMs => $_getI64(2);
  @$pb.TagNumber(3)
  set tsUnixMs($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTsUnixMs() => $_has(2);
  @$pb.TagNumber(3)
  void clearTsUnixMs() => clearField(3);

  @$pb.TagNumber(10)
  PingPeerConnecting get connecting => $_getN(3);
  @$pb.TagNumber(10)
  set connecting(PingPeerConnecting v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasConnecting() => $_has(3);
  @$pb.TagNumber(10)
  void clearConnecting() => clearField(10);
  @$pb.TagNumber(10)
  PingPeerConnecting ensureConnecting() => $_ensure(3);

  @$pb.TagNumber(11)
  PingPeerConnected get connected => $_getN(4);
  @$pb.TagNumber(11)
  set connected(PingPeerConnected v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasConnected() => $_has(4);
  @$pb.TagNumber(11)
  void clearConnected() => clearField(11);
  @$pb.TagNumber(11)
  PingPeerConnected ensureConnected() => $_ensure(4);

  @$pb.TagNumber(12)
  PingPeerIdle get idle => $_getN(5);
  @$pb.TagNumber(12)
  set idle(PingPeerIdle v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasIdle() => $_has(5);
  @$pb.TagNumber(12)
  void clearIdle() => clearField(12);
  @$pb.TagNumber(12)
  PingPeerIdle ensureIdle() => $_ensure(5);

  @$pb.TagNumber(13)
  PingPeerResult get result => $_getN(6);
  @$pb.TagNumber(13)
  set result(PingPeerResult v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasResult() => $_has(6);
  @$pb.TagNumber(13)
  void clearResult() => clearField(13);
  @$pb.TagNumber(13)
  PingPeerResult ensureResult() => $_ensure(6);

  @$pb.TagNumber(14)
  PingPeerError get error => $_getN(7);
  @$pb.TagNumber(14)
  set error(PingPeerError v) { setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasError() => $_has(7);
  @$pb.TagNumber(14)
  void clearError() => clearField(14);
  @$pb.TagNumber(14)
  PingPeerError ensureError() => $_ensure(7);
}

class PingPeerConnecting extends $pb.GeneratedMessage {
  factory PingPeerConnecting() => create();
  PingPeerConnecting._() : super();
  factory PingPeerConnecting.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingPeerConnecting.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingPeerConnecting', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingPeerConnecting clone() => PingPeerConnecting()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingPeerConnecting copyWith(void Function(PingPeerConnecting) updates) => super.copyWith((message) => updates(message as PingPeerConnecting)) as PingPeerConnecting;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingPeerConnecting create() => PingPeerConnecting._();
  PingPeerConnecting createEmptyInstance() => create();
  static $pb.PbList<PingPeerConnecting> createRepeated() => $pb.PbList<PingPeerConnecting>();
  @$core.pragma('dart2js:noInline')
  static PingPeerConnecting getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingPeerConnecting>(create);
  static PingPeerConnecting? _defaultInstance;
}

class PingPeerConnected extends $pb.GeneratedMessage {
  factory PingPeerConnected() => create();
  PingPeerConnected._() : super();
  factory PingPeerConnected.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingPeerConnected.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingPeerConnected', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingPeerConnected clone() => PingPeerConnected()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingPeerConnected copyWith(void Function(PingPeerConnected) updates) => super.copyWith((message) => updates(message as PingPeerConnected)) as PingPeerConnected;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingPeerConnected create() => PingPeerConnected._();
  PingPeerConnected createEmptyInstance() => create();
  static $pb.PbList<PingPeerConnected> createRepeated() => $pb.PbList<PingPeerConnected>();
  @$core.pragma('dart2js:noInline')
  static PingPeerConnected getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingPeerConnected>(create);
  static PingPeerConnected? _defaultInstance;
}

class PingPeerIdle extends $pb.GeneratedMessage {
  factory PingPeerIdle() => create();
  PingPeerIdle._() : super();
  factory PingPeerIdle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingPeerIdle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingPeerIdle', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingPeerIdle clone() => PingPeerIdle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingPeerIdle copyWith(void Function(PingPeerIdle) updates) => super.copyWith((message) => updates(message as PingPeerIdle)) as PingPeerIdle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingPeerIdle create() => PingPeerIdle._();
  PingPeerIdle createEmptyInstance() => create();
  static $pb.PbList<PingPeerIdle> createRepeated() => $pb.PbList<PingPeerIdle>();
  @$core.pragma('dart2js:noInline')
  static PingPeerIdle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingPeerIdle>(create);
  static PingPeerIdle? _defaultInstance;
}

class PingPeerResult extends $pb.GeneratedMessage {
  factory PingPeerResult({
    $core.String? connectionId,
    $core.String? direction,
    $core.String? remoteAddr,
    $fixnum.Int64? rttMs,
  }) {
    final $result = create();
    if (connectionId != null) {
      $result.connectionId = connectionId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (remoteAddr != null) {
      $result.remoteAddr = remoteAddr;
    }
    if (rttMs != null) {
      $result.rttMs = rttMs;
    }
    return $result;
  }
  PingPeerResult._() : super();
  factory PingPeerResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingPeerResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingPeerResult', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'connectionId')
    ..aOS(2, _omitFieldNames ? '' : 'direction')
    ..aOS(3, _omitFieldNames ? '' : 'remoteAddr')
    ..a<$fixnum.Int64>(4, _omitFieldNames ? '' : 'rttMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingPeerResult clone() => PingPeerResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingPeerResult copyWith(void Function(PingPeerResult) updates) => super.copyWith((message) => updates(message as PingPeerResult)) as PingPeerResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingPeerResult create() => PingPeerResult._();
  PingPeerResult createEmptyInstance() => create();
  static $pb.PbList<PingPeerResult> createRepeated() => $pb.PbList<PingPeerResult>();
  @$core.pragma('dart2js:noInline')
  static PingPeerResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingPeerResult>(create);
  static PingPeerResult? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get connectionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get direction => $_getSZ(1);
  @$pb.TagNumber(2)
  set direction($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get remoteAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set remoteAddr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoteAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteAddr() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get rttMs => $_getI64(3);
  @$pb.TagNumber(4)
  set rttMs($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRttMs() => $_has(3);
  @$pb.TagNumber(4)
  void clearRttMs() => clearField(4);
}

class PingPeerError extends $pb.GeneratedMessage {
  factory PingPeerError({
    $core.String? connectionId,
    $core.String? direction,
    $core.String? remoteAddr,
    $core.String? message,
  }) {
    final $result = create();
    if (connectionId != null) {
      $result.connectionId = connectionId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (remoteAddr != null) {
      $result.remoteAddr = remoteAddr;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  PingPeerError._() : super();
  factory PingPeerError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PingPeerError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PingPeerError', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'connectionId')
    ..aOS(2, _omitFieldNames ? '' : 'direction')
    ..aOS(3, _omitFieldNames ? '' : 'remoteAddr')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PingPeerError clone() => PingPeerError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PingPeerError copyWith(void Function(PingPeerError) updates) => super.copyWith((message) => updates(message as PingPeerError)) as PingPeerError;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PingPeerError create() => PingPeerError._();
  PingPeerError createEmptyInstance() => create();
  static $pb.PbList<PingPeerError> createRepeated() => $pb.PbList<PingPeerError>();
  @$core.pragma('dart2js:noInline')
  static PingPeerError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PingPeerError>(create);
  static PingPeerError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get connectionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set connectionId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConnectionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearConnectionId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get direction => $_getSZ(1);
  @$pb.TagNumber(2)
  set direction($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDirection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDirection() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get remoteAddr => $_getSZ(2);
  @$pb.TagNumber(3)
  set remoteAddr($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRemoteAddr() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemoteAddr() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);
}

class ListConnectionsRequest extends $pb.GeneratedMessage {
  factory ListConnectionsRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  ListConnectionsRequest._() : super();
  factory ListConnectionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListConnectionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListConnectionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListConnectionsRequest clone() => ListConnectionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListConnectionsRequest copyWith(void Function(ListConnectionsRequest) updates) => super.copyWith((message) => updates(message as ListConnectionsRequest)) as ListConnectionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListConnectionsRequest create() => ListConnectionsRequest._();
  ListConnectionsRequest createEmptyInstance() => create();
  static $pb.PbList<ListConnectionsRequest> createRepeated() => $pb.PbList<ListConnectionsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListConnectionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListConnectionsRequest>(create);
  static ListConnectionsRequest? _defaultInstance;

  /// Optional peer_id filter. Empty means all peers.
  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class ConnectionSnapshot extends $pb.GeneratedMessage {
  factory ConnectionSnapshot({
    $core.String? peerId,
    $core.String? connectionId,
    $core.String? direction,
    $core.String? remoteAddr,
    $core.bool? isRelay,
    $fixnum.Int64? lastRttMs,
    $fixnum.Int64? lastPingUnixMs,
    $fixnum.Int64? activeStreamsTotal,
    $core.Iterable<ProtocolStreamCountSnapshot>? activeStreamsByProtocol,
    $core.String? policyState,
    $core.String? policyReason,
    $core.String? peerAlias,
    $core.String? peerRole,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (connectionId != null) {
      $result.connectionId = connectionId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (remoteAddr != null) {
      $result.remoteAddr = remoteAddr;
    }
    if (isRelay != null) {
      $result.isRelay = isRelay;
    }
    if (lastRttMs != null) {
      $result.lastRttMs = lastRttMs;
    }
    if (lastPingUnixMs != null) {
      $result.lastPingUnixMs = lastPingUnixMs;
    }
    if (activeStreamsTotal != null) {
      $result.activeStreamsTotal = activeStreamsTotal;
    }
    if (activeStreamsByProtocol != null) {
      $result.activeStreamsByProtocol.addAll(activeStreamsByProtocol);
    }
    if (policyState != null) {
      $result.policyState = policyState;
    }
    if (policyReason != null) {
      $result.policyReason = policyReason;
    }
    if (peerAlias != null) {
      $result.peerAlias = peerAlias;
    }
    if (peerRole != null) {
      $result.peerRole = peerRole;
    }
    return $result;
  }
  ConnectionSnapshot._() : super();
  factory ConnectionSnapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectionSnapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConnectionSnapshot', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'connectionId')
    ..aOS(3, _omitFieldNames ? '' : 'direction')
    ..aOS(4, _omitFieldNames ? '' : 'remoteAddr')
    ..aOB(5, _omitFieldNames ? '' : 'isRelay')
    ..a<$fixnum.Int64>(6, _omitFieldNames ? '' : 'lastRttMs', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aInt64(7, _omitFieldNames ? '' : 'lastPingUnixMs')
    ..a<$fixnum.Int64>(8, _omitFieldNames ? '' : 'activeStreamsTotal', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pc<ProtocolStreamCountSnapshot>(9, _omitFieldNames ? '' : 'activeStreamsByProtocol', $pb.PbFieldType.PM, subBuilder: ProtocolStreamCountSnapshot.create)
    ..aOS(10, _omitFieldNames ? '' : 'policyState')
    ..aOS(11, _omitFieldNames ? '' : 'policyReason')
    ..aOS(12, _omitFieldNames ? '' : 'peerAlias')
    ..aOS(13, _omitFieldNames ? '' : 'peerRole')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConnectionSnapshot clone() => ConnectionSnapshot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConnectionSnapshot copyWith(void Function(ConnectionSnapshot) updates) => super.copyWith((message) => updates(message as ConnectionSnapshot)) as ConnectionSnapshot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectionSnapshot create() => ConnectionSnapshot._();
  ConnectionSnapshot createEmptyInstance() => create();
  static $pb.PbList<ConnectionSnapshot> createRepeated() => $pb.PbList<ConnectionSnapshot>();
  @$core.pragma('dart2js:noInline')
  static ConnectionSnapshot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectionSnapshot>(create);
  static ConnectionSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get connectionId => $_getSZ(1);
  @$pb.TagNumber(2)
  set connectionId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasConnectionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearConnectionId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get direction => $_getSZ(2);
  @$pb.TagNumber(3)
  set direction($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get remoteAddr => $_getSZ(3);
  @$pb.TagNumber(4)
  set remoteAddr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRemoteAddr() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemoteAddr() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isRelay => $_getBF(4);
  @$pb.TagNumber(5)
  set isRelay($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsRelay() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsRelay() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastRttMs => $_getI64(5);
  @$pb.TagNumber(6)
  set lastRttMs($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastRttMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastRttMs() => clearField(6);

  /// 0 means no ping has been recorded yet.
  @$pb.TagNumber(7)
  $fixnum.Int64 get lastPingUnixMs => $_getI64(6);
  @$pb.TagNumber(7)
  set lastPingUnixMs($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastPingUnixMs() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastPingUnixMs() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get activeStreamsTotal => $_getI64(7);
  @$pb.TagNumber(8)
  set activeStreamsTotal($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasActiveStreamsTotal() => $_has(7);
  @$pb.TagNumber(8)
  void clearActiveStreamsTotal() => clearField(8);

  @$pb.TagNumber(9)
  $core.List<ProtocolStreamCountSnapshot> get activeStreamsByProtocol => $_getList(8);

  @$pb.TagNumber(10)
  $core.String get policyState => $_getSZ(9);
  @$pb.TagNumber(10)
  set policyState($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasPolicyState() => $_has(9);
  @$pb.TagNumber(10)
  void clearPolicyState() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get policyReason => $_getSZ(10);
  @$pb.TagNumber(11)
  set policyReason($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasPolicyReason() => $_has(10);
  @$pb.TagNumber(11)
  void clearPolicyReason() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get peerAlias => $_getSZ(11);
  @$pb.TagNumber(12)
  set peerAlias($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasPeerAlias() => $_has(11);
  @$pb.TagNumber(12)
  void clearPeerAlias() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get peerRole => $_getSZ(12);
  @$pb.TagNumber(13)
  set peerRole($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasPeerRole() => $_has(12);
  @$pb.TagNumber(13)
  void clearPeerRole() => clearField(13);
}

class ProtocolStreamCountSnapshot extends $pb.GeneratedMessage {
  factory ProtocolStreamCountSnapshot({
    $core.String? protocolName,
    $fixnum.Int64? streamCount,
  }) {
    final $result = create();
    if (protocolName != null) {
      $result.protocolName = protocolName;
    }
    if (streamCount != null) {
      $result.streamCount = streamCount;
    }
    return $result;
  }
  ProtocolStreamCountSnapshot._() : super();
  factory ProtocolStreamCountSnapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProtocolStreamCountSnapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProtocolStreamCountSnapshot', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'protocolName')
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'streamCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProtocolStreamCountSnapshot clone() => ProtocolStreamCountSnapshot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProtocolStreamCountSnapshot copyWith(void Function(ProtocolStreamCountSnapshot) updates) => super.copyWith((message) => updates(message as ProtocolStreamCountSnapshot)) as ProtocolStreamCountSnapshot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProtocolStreamCountSnapshot create() => ProtocolStreamCountSnapshot._();
  ProtocolStreamCountSnapshot createEmptyInstance() => create();
  static $pb.PbList<ProtocolStreamCountSnapshot> createRepeated() => $pb.PbList<ProtocolStreamCountSnapshot>();
  @$core.pragma('dart2js:noInline')
  static ProtocolStreamCountSnapshot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProtocolStreamCountSnapshot>(create);
  static ProtocolStreamCountSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get protocolName => $_getSZ(0);
  @$pb.TagNumber(1)
  set protocolName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProtocolName() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtocolName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get streamCount => $_getI64(1);
  @$pb.TagNumber(2)
  set streamCount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStreamCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearStreamCount() => clearField(2);
}

class ListConnectionsResponse extends $pb.GeneratedMessage {
  factory ListConnectionsResponse({
    $core.Iterable<ConnectionSnapshot>? connections,
  }) {
    final $result = create();
    if (connections != null) {
      $result.connections.addAll(connections);
    }
    return $result;
  }
  ListConnectionsResponse._() : super();
  factory ListConnectionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListConnectionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListConnectionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<ConnectionSnapshot>(1, _omitFieldNames ? '' : 'connections', $pb.PbFieldType.PM, subBuilder: ConnectionSnapshot.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListConnectionsResponse clone() => ListConnectionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListConnectionsResponse copyWith(void Function(ListConnectionsResponse) updates) => super.copyWith((message) => updates(message as ListConnectionsResponse)) as ListConnectionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListConnectionsResponse create() => ListConnectionsResponse._();
  ListConnectionsResponse createEmptyInstance() => create();
  static $pb.PbList<ListConnectionsResponse> createRepeated() => $pb.PbList<ListConnectionsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListConnectionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListConnectionsResponse>(create);
  static ListConnectionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ConnectionSnapshot> get connections => $_getList(0);
}

class ListActiveStreamsRequest extends $pb.GeneratedMessage {
  factory ListActiveStreamsRequest({
    $core.String? peerId,
    $core.String? protocolName,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (protocolName != null) {
      $result.protocolName = protocolName;
    }
    return $result;
  }
  ListActiveStreamsRequest._() : super();
  factory ListActiveStreamsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListActiveStreamsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListActiveStreamsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'protocolName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListActiveStreamsRequest clone() => ListActiveStreamsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListActiveStreamsRequest copyWith(void Function(ListActiveStreamsRequest) updates) => super.copyWith((message) => updates(message as ListActiveStreamsRequest)) as ListActiveStreamsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListActiveStreamsRequest create() => ListActiveStreamsRequest._();
  ListActiveStreamsRequest createEmptyInstance() => create();
  static $pb.PbList<ListActiveStreamsRequest> createRepeated() => $pb.PbList<ListActiveStreamsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListActiveStreamsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListActiveStreamsRequest>(create);
  static ListActiveStreamsRequest? _defaultInstance;

  /// Optional peer_id filter. Empty means all peers.
  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  /// Optional protocol filter. Empty means all protocols.
  @$pb.TagNumber(2)
  $core.String get protocolName => $_getSZ(1);
  @$pb.TagNumber(2)
  set protocolName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProtocolName() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtocolName() => clearField(2);
}

class ActiveStreamSnapshot extends $pb.GeneratedMessage {
  factory ActiveStreamSnapshot({
    $fixnum.Int64? streamId,
    $core.String? peerId,
    $core.String? connectionId,
    $core.String? protocolName,
    $fixnum.Int64? openedAtUnixMs,
  }) {
    final $result = create();
    if (streamId != null) {
      $result.streamId = streamId;
    }
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (connectionId != null) {
      $result.connectionId = connectionId;
    }
    if (protocolName != null) {
      $result.protocolName = protocolName;
    }
    if (openedAtUnixMs != null) {
      $result.openedAtUnixMs = openedAtUnixMs;
    }
    return $result;
  }
  ActiveStreamSnapshot._() : super();
  factory ActiveStreamSnapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ActiveStreamSnapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ActiveStreamSnapshot', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'streamId', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'peerId')
    ..aOS(3, _omitFieldNames ? '' : 'connectionId')
    ..aOS(4, _omitFieldNames ? '' : 'protocolName')
    ..aInt64(5, _omitFieldNames ? '' : 'openedAtUnixMs')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ActiveStreamSnapshot clone() => ActiveStreamSnapshot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ActiveStreamSnapshot copyWith(void Function(ActiveStreamSnapshot) updates) => super.copyWith((message) => updates(message as ActiveStreamSnapshot)) as ActiveStreamSnapshot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ActiveStreamSnapshot create() => ActiveStreamSnapshot._();
  ActiveStreamSnapshot createEmptyInstance() => create();
  static $pb.PbList<ActiveStreamSnapshot> createRepeated() => $pb.PbList<ActiveStreamSnapshot>();
  @$core.pragma('dart2js:noInline')
  static ActiveStreamSnapshot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ActiveStreamSnapshot>(create);
  static ActiveStreamSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get streamId => $_getI64(0);
  @$pb.TagNumber(1)
  set streamId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStreamId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStreamId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get peerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set peerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPeerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPeerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get connectionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set connectionId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasConnectionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearConnectionId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get protocolName => $_getSZ(3);
  @$pb.TagNumber(4)
  set protocolName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProtocolName() => $_has(3);
  @$pb.TagNumber(4)
  void clearProtocolName() => clearField(4);

  /// 0 means unknown.
  @$pb.TagNumber(5)
  $fixnum.Int64 get openedAtUnixMs => $_getI64(4);
  @$pb.TagNumber(5)
  set openedAtUnixMs($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOpenedAtUnixMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpenedAtUnixMs() => clearField(5);
}

class ListActiveStreamsResponse extends $pb.GeneratedMessage {
  factory ListActiveStreamsResponse({
    $core.Iterable<ActiveStreamSnapshot>? streams,
  }) {
    final $result = create();
    if (streams != null) {
      $result.streams.addAll(streams);
    }
    return $result;
  }
  ListActiveStreamsResponse._() : super();
  factory ListActiveStreamsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListActiveStreamsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListActiveStreamsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<ActiveStreamSnapshot>(1, _omitFieldNames ? '' : 'streams', $pb.PbFieldType.PM, subBuilder: ActiveStreamSnapshot.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListActiveStreamsResponse clone() => ListActiveStreamsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListActiveStreamsResponse copyWith(void Function(ListActiveStreamsResponse) updates) => super.copyWith((message) => updates(message as ListActiveStreamsResponse)) as ListActiveStreamsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListActiveStreamsResponse create() => ListActiveStreamsResponse._();
  ListActiveStreamsResponse createEmptyInstance() => create();
  static $pb.PbList<ListActiveStreamsResponse> createRepeated() => $pb.PbList<ListActiveStreamsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListActiveStreamsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListActiveStreamsResponse>(create);
  static ListActiveStreamsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ActiveStreamSnapshot> get streams => $_getList(0);
}

class ExternalAddressSnapshot extends $pb.GeneratedMessage {
  factory ExternalAddressSnapshot({
    $core.String? address,
    $core.String? transport,
    $core.String? freshness,
    $core.bool? recommendRefreshBeforeDcutr,
    $fixnum.Int64? firstObservedAtUnixMs,
    $fixnum.Int64? lastObservedAtUnixMs,
    $fixnum.Int64? confirmedAtUnixMs,
    $fixnum.Int64? expiredAtUnixMs,
    $fixnum.Int64? observationCount,
    $core.Iterable<$core.String>? sources,
  }) {
    final $result = create();
    if (address != null) {
      $result.address = address;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    if (freshness != null) {
      $result.freshness = freshness;
    }
    if (recommendRefreshBeforeDcutr != null) {
      $result.recommendRefreshBeforeDcutr = recommendRefreshBeforeDcutr;
    }
    if (firstObservedAtUnixMs != null) {
      $result.firstObservedAtUnixMs = firstObservedAtUnixMs;
    }
    if (lastObservedAtUnixMs != null) {
      $result.lastObservedAtUnixMs = lastObservedAtUnixMs;
    }
    if (confirmedAtUnixMs != null) {
      $result.confirmedAtUnixMs = confirmedAtUnixMs;
    }
    if (expiredAtUnixMs != null) {
      $result.expiredAtUnixMs = expiredAtUnixMs;
    }
    if (observationCount != null) {
      $result.observationCount = observationCount;
    }
    if (sources != null) {
      $result.sources.addAll(sources);
    }
    return $result;
  }
  ExternalAddressSnapshot._() : super();
  factory ExternalAddressSnapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExternalAddressSnapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExternalAddressSnapshot', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'address')
    ..aOS(2, _omitFieldNames ? '' : 'transport')
    ..aOS(3, _omitFieldNames ? '' : 'freshness')
    ..aOB(4, _omitFieldNames ? '' : 'recommendRefreshBeforeDcutr')
    ..aInt64(5, _omitFieldNames ? '' : 'firstObservedAtUnixMs')
    ..aInt64(6, _omitFieldNames ? '' : 'lastObservedAtUnixMs')
    ..aInt64(7, _omitFieldNames ? '' : 'confirmedAtUnixMs')
    ..aInt64(8, _omitFieldNames ? '' : 'expiredAtUnixMs')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'observationCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..pPS(10, _omitFieldNames ? '' : 'sources')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExternalAddressSnapshot clone() => ExternalAddressSnapshot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExternalAddressSnapshot copyWith(void Function(ExternalAddressSnapshot) updates) => super.copyWith((message) => updates(message as ExternalAddressSnapshot)) as ExternalAddressSnapshot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExternalAddressSnapshot create() => ExternalAddressSnapshot._();
  ExternalAddressSnapshot createEmptyInstance() => create();
  static $pb.PbList<ExternalAddressSnapshot> createRepeated() => $pb.PbList<ExternalAddressSnapshot>();
  @$core.pragma('dart2js:noInline')
  static ExternalAddressSnapshot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExternalAddressSnapshot>(create);
  static ExternalAddressSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get transport => $_getSZ(1);
  @$pb.TagNumber(2)
  set transport($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTransport() => $_has(1);
  @$pb.TagNumber(2)
  void clearTransport() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get freshness => $_getSZ(2);
  @$pb.TagNumber(3)
  set freshness($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFreshness() => $_has(2);
  @$pb.TagNumber(3)
  void clearFreshness() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get recommendRefreshBeforeDcutr => $_getBF(3);
  @$pb.TagNumber(4)
  set recommendRefreshBeforeDcutr($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRecommendRefreshBeforeDcutr() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecommendRefreshBeforeDcutr() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get firstObservedAtUnixMs => $_getI64(4);
  @$pb.TagNumber(5)
  set firstObservedAtUnixMs($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFirstObservedAtUnixMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstObservedAtUnixMs() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastObservedAtUnixMs => $_getI64(5);
  @$pb.TagNumber(6)
  set lastObservedAtUnixMs($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastObservedAtUnixMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastObservedAtUnixMs() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get confirmedAtUnixMs => $_getI64(6);
  @$pb.TagNumber(7)
  set confirmedAtUnixMs($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasConfirmedAtUnixMs() => $_has(6);
  @$pb.TagNumber(7)
  void clearConfirmedAtUnixMs() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get expiredAtUnixMs => $_getI64(7);
  @$pb.TagNumber(8)
  set expiredAtUnixMs($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasExpiredAtUnixMs() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpiredAtUnixMs() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get observationCount => $_getI64(8);
  @$pb.TagNumber(9)
  set observationCount($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasObservationCount() => $_has(8);
  @$pb.TagNumber(9)
  void clearObservationCount() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get sources => $_getList(9);
}

class ListExternalAddressCandidatesResponse extends $pb.GeneratedMessage {
  factory ListExternalAddressCandidatesResponse({
    $core.Iterable<ExternalAddressSnapshot>? candidates,
  }) {
    final $result = create();
    if (candidates != null) {
      $result.candidates.addAll(candidates);
    }
    return $result;
  }
  ListExternalAddressCandidatesResponse._() : super();
  factory ListExternalAddressCandidatesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListExternalAddressCandidatesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListExternalAddressCandidatesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<ExternalAddressSnapshot>(1, _omitFieldNames ? '' : 'candidates', $pb.PbFieldType.PM, subBuilder: ExternalAddressSnapshot.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListExternalAddressCandidatesResponse clone() => ListExternalAddressCandidatesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListExternalAddressCandidatesResponse copyWith(void Function(ListExternalAddressCandidatesResponse) updates) => super.copyWith((message) => updates(message as ListExternalAddressCandidatesResponse)) as ListExternalAddressCandidatesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListExternalAddressCandidatesResponse create() => ListExternalAddressCandidatesResponse._();
  ListExternalAddressCandidatesResponse createEmptyInstance() => create();
  static $pb.PbList<ListExternalAddressCandidatesResponse> createRepeated() => $pb.PbList<ListExternalAddressCandidatesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListExternalAddressCandidatesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListExternalAddressCandidatesResponse>(create);
  static ListExternalAddressCandidatesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ExternalAddressSnapshot> get candidates => $_getList(0);
}

class RelayEndpointStatusSnapshot extends $pb.GeneratedMessage {
  factory RelayEndpointStatusSnapshot({
    $core.String? relayAddr,
    $core.String? relayPeerId,
    $core.String? transport,
    $core.bool? listenerRegistered,
    $core.bool? taskRunning,
    $core.String? currentDirectConnectionId,
    $fixnum.Int64? lastListenerSeenAtUnixMs,
    $fixnum.Int64? lastListenerMissingAtUnixMs,
    $fixnum.Int64? lastReservationAcceptedAtUnixMs,
    $fixnum.Int64? lastReservationEstablishedAtUnixMs,
    $fixnum.Int64? lastReservationRenewedAtUnixMs,
    $fixnum.Int64? lastDirectConnectionClosedAtUnixMs,
    $core.String? lastManagementAction,
    $core.String? lastError,
  }) {
    final $result = create();
    if (relayAddr != null) {
      $result.relayAddr = relayAddr;
    }
    if (relayPeerId != null) {
      $result.relayPeerId = relayPeerId;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    if (listenerRegistered != null) {
      $result.listenerRegistered = listenerRegistered;
    }
    if (taskRunning != null) {
      $result.taskRunning = taskRunning;
    }
    if (currentDirectConnectionId != null) {
      $result.currentDirectConnectionId = currentDirectConnectionId;
    }
    if (lastListenerSeenAtUnixMs != null) {
      $result.lastListenerSeenAtUnixMs = lastListenerSeenAtUnixMs;
    }
    if (lastListenerMissingAtUnixMs != null) {
      $result.lastListenerMissingAtUnixMs = lastListenerMissingAtUnixMs;
    }
    if (lastReservationAcceptedAtUnixMs != null) {
      $result.lastReservationAcceptedAtUnixMs = lastReservationAcceptedAtUnixMs;
    }
    if (lastReservationEstablishedAtUnixMs != null) {
      $result.lastReservationEstablishedAtUnixMs = lastReservationEstablishedAtUnixMs;
    }
    if (lastReservationRenewedAtUnixMs != null) {
      $result.lastReservationRenewedAtUnixMs = lastReservationRenewedAtUnixMs;
    }
    if (lastDirectConnectionClosedAtUnixMs != null) {
      $result.lastDirectConnectionClosedAtUnixMs = lastDirectConnectionClosedAtUnixMs;
    }
    if (lastManagementAction != null) {
      $result.lastManagementAction = lastManagementAction;
    }
    if (lastError != null) {
      $result.lastError = lastError;
    }
    return $result;
  }
  RelayEndpointStatusSnapshot._() : super();
  factory RelayEndpointStatusSnapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RelayEndpointStatusSnapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RelayEndpointStatusSnapshot', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'relayAddr')
    ..aOS(2, _omitFieldNames ? '' : 'relayPeerId')
    ..aOS(3, _omitFieldNames ? '' : 'transport')
    ..aOB(4, _omitFieldNames ? '' : 'listenerRegistered')
    ..aOB(5, _omitFieldNames ? '' : 'taskRunning')
    ..aOS(6, _omitFieldNames ? '' : 'currentDirectConnectionId')
    ..aInt64(7, _omitFieldNames ? '' : 'lastListenerSeenAtUnixMs')
    ..aInt64(8, _omitFieldNames ? '' : 'lastListenerMissingAtUnixMs')
    ..aInt64(9, _omitFieldNames ? '' : 'lastReservationAcceptedAtUnixMs')
    ..aInt64(10, _omitFieldNames ? '' : 'lastReservationEstablishedAtUnixMs')
    ..aInt64(11, _omitFieldNames ? '' : 'lastReservationRenewedAtUnixMs')
    ..aInt64(12, _omitFieldNames ? '' : 'lastDirectConnectionClosedAtUnixMs')
    ..aOS(13, _omitFieldNames ? '' : 'lastManagementAction')
    ..aOS(14, _omitFieldNames ? '' : 'lastError')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RelayEndpointStatusSnapshot clone() => RelayEndpointStatusSnapshot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RelayEndpointStatusSnapshot copyWith(void Function(RelayEndpointStatusSnapshot) updates) => super.copyWith((message) => updates(message as RelayEndpointStatusSnapshot)) as RelayEndpointStatusSnapshot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RelayEndpointStatusSnapshot create() => RelayEndpointStatusSnapshot._();
  RelayEndpointStatusSnapshot createEmptyInstance() => create();
  static $pb.PbList<RelayEndpointStatusSnapshot> createRepeated() => $pb.PbList<RelayEndpointStatusSnapshot>();
  @$core.pragma('dart2js:noInline')
  static RelayEndpointStatusSnapshot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RelayEndpointStatusSnapshot>(create);
  static RelayEndpointStatusSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get relayAddr => $_getSZ(0);
  @$pb.TagNumber(1)
  set relayAddr($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRelayAddr() => $_has(0);
  @$pb.TagNumber(1)
  void clearRelayAddr() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get relayPeerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set relayPeerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRelayPeerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelayPeerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get transport => $_getSZ(2);
  @$pb.TagNumber(3)
  set transport($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransport() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransport() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get listenerRegistered => $_getBF(3);
  @$pb.TagNumber(4)
  set listenerRegistered($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasListenerRegistered() => $_has(3);
  @$pb.TagNumber(4)
  void clearListenerRegistered() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get taskRunning => $_getBF(4);
  @$pb.TagNumber(5)
  set taskRunning($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTaskRunning() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaskRunning() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get currentDirectConnectionId => $_getSZ(5);
  @$pb.TagNumber(6)
  set currentDirectConnectionId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCurrentDirectConnectionId() => $_has(5);
  @$pb.TagNumber(6)
  void clearCurrentDirectConnectionId() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get lastListenerSeenAtUnixMs => $_getI64(6);
  @$pb.TagNumber(7)
  set lastListenerSeenAtUnixMs($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLastListenerSeenAtUnixMs() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastListenerSeenAtUnixMs() => clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get lastListenerMissingAtUnixMs => $_getI64(7);
  @$pb.TagNumber(8)
  set lastListenerMissingAtUnixMs($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastListenerMissingAtUnixMs() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastListenerMissingAtUnixMs() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get lastReservationAcceptedAtUnixMs => $_getI64(8);
  @$pb.TagNumber(9)
  set lastReservationAcceptedAtUnixMs($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasLastReservationAcceptedAtUnixMs() => $_has(8);
  @$pb.TagNumber(9)
  void clearLastReservationAcceptedAtUnixMs() => clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get lastReservationEstablishedAtUnixMs => $_getI64(9);
  @$pb.TagNumber(10)
  set lastReservationEstablishedAtUnixMs($fixnum.Int64 v) { $_setInt64(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasLastReservationEstablishedAtUnixMs() => $_has(9);
  @$pb.TagNumber(10)
  void clearLastReservationEstablishedAtUnixMs() => clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get lastReservationRenewedAtUnixMs => $_getI64(10);
  @$pb.TagNumber(11)
  set lastReservationRenewedAtUnixMs($fixnum.Int64 v) { $_setInt64(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLastReservationRenewedAtUnixMs() => $_has(10);
  @$pb.TagNumber(11)
  void clearLastReservationRenewedAtUnixMs() => clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get lastDirectConnectionClosedAtUnixMs => $_getI64(11);
  @$pb.TagNumber(12)
  set lastDirectConnectionClosedAtUnixMs($fixnum.Int64 v) { $_setInt64(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasLastDirectConnectionClosedAtUnixMs() => $_has(11);
  @$pb.TagNumber(12)
  void clearLastDirectConnectionClosedAtUnixMs() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get lastManagementAction => $_getSZ(12);
  @$pb.TagNumber(13)
  set lastManagementAction($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasLastManagementAction() => $_has(12);
  @$pb.TagNumber(13)
  void clearLastManagementAction() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get lastError => $_getSZ(13);
  @$pb.TagNumber(14)
  set lastError($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasLastError() => $_has(13);
  @$pb.TagNumber(14)
  void clearLastError() => clearField(14);
}

class ListRelayEndpointStatusesResponse extends $pb.GeneratedMessage {
  factory ListRelayEndpointStatusesResponse({
    $core.Iterable<RelayEndpointStatusSnapshot>? statuses,
  }) {
    final $result = create();
    if (statuses != null) {
      $result.statuses.addAll(statuses);
    }
    return $result;
  }
  ListRelayEndpointStatusesResponse._() : super();
  factory ListRelayEndpointStatusesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRelayEndpointStatusesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRelayEndpointStatusesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<RelayEndpointStatusSnapshot>(1, _omitFieldNames ? '' : 'statuses', $pb.PbFieldType.PM, subBuilder: RelayEndpointStatusSnapshot.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRelayEndpointStatusesResponse clone() => ListRelayEndpointStatusesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRelayEndpointStatusesResponse copyWith(void Function(ListRelayEndpointStatusesResponse) updates) => super.copyWith((message) => updates(message as ListRelayEndpointStatusesResponse)) as ListRelayEndpointStatusesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRelayEndpointStatusesResponse create() => ListRelayEndpointStatusesResponse._();
  ListRelayEndpointStatusesResponse createEmptyInstance() => create();
  static $pb.PbList<ListRelayEndpointStatusesResponse> createRepeated() => $pb.PbList<ListRelayEndpointStatusesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListRelayEndpointStatusesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRelayEndpointStatusesResponse>(create);
  static ListRelayEndpointStatusesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RelayEndpointStatusSnapshot> get statuses => $_getList(0);
}

class PeerAddressSnapshot extends $pb.GeneratedMessage {
  factory PeerAddressSnapshot({
    $core.String? peerId,
    $core.String? address,
    $core.String? transport,
    $core.String? source,
    $fixnum.Int64? firstObservedAtUnixMs,
    $fixnum.Int64? lastObservedAtUnixMs,
    $fixnum.Int64? observationCount,
    $core.String? freshness,
    $fixnum.Int64? expiredAtUnixMs,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (address != null) {
      $result.address = address;
    }
    if (transport != null) {
      $result.transport = transport;
    }
    if (source != null) {
      $result.source = source;
    }
    if (firstObservedAtUnixMs != null) {
      $result.firstObservedAtUnixMs = firstObservedAtUnixMs;
    }
    if (lastObservedAtUnixMs != null) {
      $result.lastObservedAtUnixMs = lastObservedAtUnixMs;
    }
    if (observationCount != null) {
      $result.observationCount = observationCount;
    }
    if (freshness != null) {
      $result.freshness = freshness;
    }
    if (expiredAtUnixMs != null) {
      $result.expiredAtUnixMs = expiredAtUnixMs;
    }
    return $result;
  }
  PeerAddressSnapshot._() : super();
  factory PeerAddressSnapshot.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PeerAddressSnapshot.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PeerAddressSnapshot', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..aOS(3, _omitFieldNames ? '' : 'transport')
    ..aOS(4, _omitFieldNames ? '' : 'source')
    ..aInt64(5, _omitFieldNames ? '' : 'firstObservedAtUnixMs')
    ..aInt64(6, _omitFieldNames ? '' : 'lastObservedAtUnixMs')
    ..a<$fixnum.Int64>(7, _omitFieldNames ? '' : 'observationCount', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(8, _omitFieldNames ? '' : 'freshness')
    ..aInt64(9, _omitFieldNames ? '' : 'expiredAtUnixMs')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PeerAddressSnapshot clone() => PeerAddressSnapshot()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PeerAddressSnapshot copyWith(void Function(PeerAddressSnapshot) updates) => super.copyWith((message) => updates(message as PeerAddressSnapshot)) as PeerAddressSnapshot;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PeerAddressSnapshot create() => PeerAddressSnapshot._();
  PeerAddressSnapshot createEmptyInstance() => create();
  static $pb.PbList<PeerAddressSnapshot> createRepeated() => $pb.PbList<PeerAddressSnapshot>();
  @$core.pragma('dart2js:noInline')
  static PeerAddressSnapshot getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PeerAddressSnapshot>(create);
  static PeerAddressSnapshot? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get transport => $_getSZ(2);
  @$pb.TagNumber(3)
  set transport($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTransport() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransport() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get source => $_getSZ(3);
  @$pb.TagNumber(4)
  set source($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSource() => $_has(3);
  @$pb.TagNumber(4)
  void clearSource() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get firstObservedAtUnixMs => $_getI64(4);
  @$pb.TagNumber(5)
  set firstObservedAtUnixMs($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFirstObservedAtUnixMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstObservedAtUnixMs() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get lastObservedAtUnixMs => $_getI64(5);
  @$pb.TagNumber(6)
  set lastObservedAtUnixMs($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastObservedAtUnixMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastObservedAtUnixMs() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get observationCount => $_getI64(6);
  @$pb.TagNumber(7)
  set observationCount($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasObservationCount() => $_has(6);
  @$pb.TagNumber(7)
  void clearObservationCount() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get freshness => $_getSZ(7);
  @$pb.TagNumber(8)
  set freshness($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFreshness() => $_has(7);
  @$pb.TagNumber(8)
  void clearFreshness() => clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get expiredAtUnixMs => $_getI64(8);
  @$pb.TagNumber(9)
  set expiredAtUnixMs($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasExpiredAtUnixMs() => $_has(8);
  @$pb.TagNumber(9)
  void clearExpiredAtUnixMs() => clearField(9);
}

class ListPeerAddressesResponse extends $pb.GeneratedMessage {
  factory ListPeerAddressesResponse({
    $core.Iterable<PeerAddressSnapshot>? addresses,
  }) {
    final $result = create();
    if (addresses != null) {
      $result.addresses.addAll(addresses);
    }
    return $result;
  }
  ListPeerAddressesResponse._() : super();
  factory ListPeerAddressesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPeerAddressesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPeerAddressesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..pc<PeerAddressSnapshot>(1, _omitFieldNames ? '' : 'addresses', $pb.PbFieldType.PM, subBuilder: PeerAddressSnapshot.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPeerAddressesResponse clone() => ListPeerAddressesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPeerAddressesResponse copyWith(void Function(ListPeerAddressesResponse) updates) => super.copyWith((message) => updates(message as ListPeerAddressesResponse)) as ListPeerAddressesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPeerAddressesResponse create() => ListPeerAddressesResponse._();
  ListPeerAddressesResponse createEmptyInstance() => create();
  static $pb.PbList<ListPeerAddressesResponse> createRepeated() => $pb.PbList<ListPeerAddressesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPeerAddressesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPeerAddressesResponse>(create);
  static ListPeerAddressesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PeerAddressSnapshot> get addresses => $_getList(0);
}

class PullServiceRequest extends $pb.GeneratedMessage {
  factory PullServiceRequest({
    $core.String? manifestYaml,
    $core.String? manifestBaseDir,
  }) {
    final $result = create();
    if (manifestYaml != null) {
      $result.manifestYaml = manifestYaml;
    }
    if (manifestBaseDir != null) {
      $result.manifestBaseDir = manifestBaseDir;
    }
    return $result;
  }
  PullServiceRequest._() : super();
  factory PullServiceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PullServiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PullServiceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'manifestYaml')
    ..aOS(2, _omitFieldNames ? '' : 'manifestBaseDir')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PullServiceRequest clone() => PullServiceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PullServiceRequest copyWith(void Function(PullServiceRequest) updates) => super.copyWith((message) => updates(message as PullServiceRequest)) as PullServiceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PullServiceRequest create() => PullServiceRequest._();
  PullServiceRequest createEmptyInstance() => create();
  static $pb.PbList<PullServiceRequest> createRepeated() => $pb.PbList<PullServiceRequest>();
  @$core.pragma('dart2js:noInline')
  static PullServiceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PullServiceRequest>(create);
  static PullServiceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get manifestYaml => $_getSZ(0);
  @$pb.TagNumber(1)
  set manifestYaml($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasManifestYaml() => $_has(0);
  @$pb.TagNumber(1)
  void clearManifestYaml() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get manifestBaseDir => $_getSZ(1);
  @$pb.TagNumber(2)
  set manifestBaseDir($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasManifestBaseDir() => $_has(1);
  @$pb.TagNumber(2)
  void clearManifestBaseDir() => clearField(2);
}

class ServiceNameRequest extends $pb.GeneratedMessage {
  factory ServiceNameRequest({
    ServiceRuntimeKind? runtime,
    $core.String? name,
  }) {
    final $result = create();
    if (runtime != null) {
      $result.runtime = runtime;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  ServiceNameRequest._() : super();
  factory ServiceNameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceNameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceNameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..e<ServiceRuntimeKind>(1, _omitFieldNames ? '' : 'runtime', $pb.PbFieldType.OE, defaultOrMaker: ServiceRuntimeKind.SERVICE_RUNTIME_KIND_UNSPECIFIED, valueOf: ServiceRuntimeKind.valueOf, enumValues: ServiceRuntimeKind.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceNameRequest clone() => ServiceNameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceNameRequest copyWith(void Function(ServiceNameRequest) updates) => super.copyWith((message) => updates(message as ServiceNameRequest)) as ServiceNameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceNameRequest create() => ServiceNameRequest._();
  ServiceNameRequest createEmptyInstance() => create();
  static $pb.PbList<ServiceNameRequest> createRepeated() => $pb.PbList<ServiceNameRequest>();
  @$core.pragma('dart2js:noInline')
  static ServiceNameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceNameRequest>(create);
  static ServiceNameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ServiceRuntimeKind get runtime => $_getN(0);
  @$pb.TagNumber(1)
  set runtime(ServiceRuntimeKind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRuntime() => $_has(0);
  @$pb.TagNumber(1)
  void clearRuntime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class GetServiceLogsRequest extends $pb.GeneratedMessage {
  factory GetServiceLogsRequest({
    ServiceRuntimeKind? runtime,
    $core.String? name,
    $core.String? tail,
  }) {
    final $result = create();
    if (runtime != null) {
      $result.runtime = runtime;
    }
    if (name != null) {
      $result.name = name;
    }
    if (tail != null) {
      $result.tail = tail;
    }
    return $result;
  }
  GetServiceLogsRequest._() : super();
  factory GetServiceLogsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetServiceLogsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetServiceLogsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..e<ServiceRuntimeKind>(1, _omitFieldNames ? '' : 'runtime', $pb.PbFieldType.OE, defaultOrMaker: ServiceRuntimeKind.SERVICE_RUNTIME_KIND_UNSPECIFIED, valueOf: ServiceRuntimeKind.valueOf, enumValues: ServiceRuntimeKind.values)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'tail')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetServiceLogsRequest clone() => GetServiceLogsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetServiceLogsRequest copyWith(void Function(GetServiceLogsRequest) updates) => super.copyWith((message) => updates(message as GetServiceLogsRequest)) as GetServiceLogsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetServiceLogsRequest create() => GetServiceLogsRequest._();
  GetServiceLogsRequest createEmptyInstance() => create();
  static $pb.PbList<GetServiceLogsRequest> createRepeated() => $pb.PbList<GetServiceLogsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetServiceLogsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetServiceLogsRequest>(create);
  static GetServiceLogsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ServiceRuntimeKind get runtime => $_getN(0);
  @$pb.TagNumber(1)
  set runtime(ServiceRuntimeKind v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasRuntime() => $_has(0);
  @$pb.TagNumber(1)
  void clearRuntime() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get tail => $_getSZ(2);
  @$pb.TagNumber(3)
  set tail($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTail() => $_has(2);
  @$pb.TagNumber(3)
  void clearTail() => clearField(3);
}

class ServiceInstanceResponse extends $pb.GeneratedMessage {
  factory ServiceInstanceResponse({
    $core.String? instanceJson,
  }) {
    final $result = create();
    if (instanceJson != null) {
      $result.instanceJson = instanceJson;
    }
    return $result;
  }
  ServiceInstanceResponse._() : super();
  factory ServiceInstanceResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceInstanceResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceInstanceResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'instanceJson')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceInstanceResponse clone() => ServiceInstanceResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceInstanceResponse copyWith(void Function(ServiceInstanceResponse) updates) => super.copyWith((message) => updates(message as ServiceInstanceResponse)) as ServiceInstanceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceInstanceResponse create() => ServiceInstanceResponse._();
  ServiceInstanceResponse createEmptyInstance() => create();
  static $pb.PbList<ServiceInstanceResponse> createRepeated() => $pb.PbList<ServiceInstanceResponse>();
  @$core.pragma('dart2js:noInline')
  static ServiceInstanceResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceInstanceResponse>(create);
  static ServiceInstanceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get instanceJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set instanceJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInstanceJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstanceJson() => clearField(1);
}

class ServiceLogsResponse extends $pb.GeneratedMessage {
  factory ServiceLogsResponse({
    $core.List<$core.int>? raw,
    $core.String? text,
  }) {
    final $result = create();
    if (raw != null) {
      $result.raw = raw;
    }
    if (text != null) {
      $result.text = text;
    }
    return $result;
  }
  ServiceLogsResponse._() : super();
  factory ServiceLogsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceLogsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceLogsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'raw', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceLogsResponse clone() => ServiceLogsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceLogsResponse copyWith(void Function(ServiceLogsResponse) updates) => super.copyWith((message) => updates(message as ServiceLogsResponse)) as ServiceLogsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceLogsResponse create() => ServiceLogsResponse._();
  ServiceLogsResponse createEmptyInstance() => create();
  static $pb.PbList<ServiceLogsResponse> createRepeated() => $pb.PbList<ServiceLogsResponse>();
  @$core.pragma('dart2js:noInline')
  static ServiceLogsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceLogsResponse>(create);
  static ServiceLogsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get raw => $_getN(0);
  @$pb.TagNumber(1)
  set raw($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRaw() => $_has(0);
  @$pb.TagNumber(1)
  void clearRaw() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);
}

class ListServicesResponse extends $pb.GeneratedMessage {
  factory ListServicesResponse({
    $core.String? servicesJson,
  }) {
    final $result = create();
    if (servicesJson != null) {
      $result.servicesJson = servicesJson;
    }
    return $result;
  }
  ListServicesResponse._() : super();
  factory ListServicesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListServicesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServicesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'servicesJson')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListServicesResponse clone() => ListServicesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListServicesResponse copyWith(void Function(ListServicesResponse) updates) => super.copyWith((message) => updates(message as ListServicesResponse)) as ListServicesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServicesResponse create() => ListServicesResponse._();
  ListServicesResponse createEmptyInstance() => create();
  static $pb.PbList<ListServicesResponse> createRepeated() => $pb.PbList<ListServicesResponse>();
  @$core.pragma('dart2js:noInline')
  static ListServicesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServicesResponse>(create);
  static ListServicesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get servicesJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set servicesJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServicesJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearServicesJson() => clearField(1);
}

class ListPeerCatalogRequest extends $pb.GeneratedMessage {
  factory ListPeerCatalogRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  ListPeerCatalogRequest._() : super();
  factory ListPeerCatalogRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPeerCatalogRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPeerCatalogRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPeerCatalogRequest clone() => ListPeerCatalogRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPeerCatalogRequest copyWith(void Function(ListPeerCatalogRequest) updates) => super.copyWith((message) => updates(message as ListPeerCatalogRequest)) as ListPeerCatalogRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPeerCatalogRequest create() => ListPeerCatalogRequest._();
  ListPeerCatalogRequest createEmptyInstance() => create();
  static $pb.PbList<ListPeerCatalogRequest> createRepeated() => $pb.PbList<ListPeerCatalogRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPeerCatalogRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPeerCatalogRequest>(create);
  static ListPeerCatalogRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class ListPeerCatalogResponse extends $pb.GeneratedMessage {
  factory ListPeerCatalogResponse({
    $core.String? servicesJson,
  }) {
    final $result = create();
    if (servicesJson != null) {
      $result.servicesJson = servicesJson;
    }
    return $result;
  }
  ListPeerCatalogResponse._() : super();
  factory ListPeerCatalogResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListPeerCatalogResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListPeerCatalogResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'servicesJson')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListPeerCatalogResponse clone() => ListPeerCatalogResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListPeerCatalogResponse copyWith(void Function(ListPeerCatalogResponse) updates) => super.copyWith((message) => updates(message as ListPeerCatalogResponse)) as ListPeerCatalogResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPeerCatalogResponse create() => ListPeerCatalogResponse._();
  ListPeerCatalogResponse createEmptyInstance() => create();
  static $pb.PbList<ListPeerCatalogResponse> createRepeated() => $pb.PbList<ListPeerCatalogResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPeerCatalogResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListPeerCatalogResponse>(create);
  static ListPeerCatalogResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get servicesJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set servicesJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServicesJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearServicesJson() => clearField(1);
}

class GetPeerCapabilitySummaryRequest extends $pb.GeneratedMessage {
  factory GetPeerCapabilitySummaryRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  GetPeerCapabilitySummaryRequest._() : super();
  factory GetPeerCapabilitySummaryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPeerCapabilitySummaryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPeerCapabilitySummaryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPeerCapabilitySummaryRequest clone() => GetPeerCapabilitySummaryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPeerCapabilitySummaryRequest copyWith(void Function(GetPeerCapabilitySummaryRequest) updates) => super.copyWith((message) => updates(message as GetPeerCapabilitySummaryRequest)) as GetPeerCapabilitySummaryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPeerCapabilitySummaryRequest create() => GetPeerCapabilitySummaryRequest._();
  GetPeerCapabilitySummaryRequest createEmptyInstance() => create();
  static $pb.PbList<GetPeerCapabilitySummaryRequest> createRepeated() => $pb.PbList<GetPeerCapabilitySummaryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPeerCapabilitySummaryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPeerCapabilitySummaryRequest>(create);
  static GetPeerCapabilitySummaryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class GetPeerCapabilitySummaryResponse extends $pb.GeneratedMessage {
  factory GetPeerCapabilitySummaryResponse({
    $core.String? capabilitySummaryJson,
  }) {
    final $result = create();
    if (capabilitySummaryJson != null) {
      $result.capabilitySummaryJson = capabilitySummaryJson;
    }
    return $result;
  }
  GetPeerCapabilitySummaryResponse._() : super();
  factory GetPeerCapabilitySummaryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPeerCapabilitySummaryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPeerCapabilitySummaryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'capabilitySummaryJson')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPeerCapabilitySummaryResponse clone() => GetPeerCapabilitySummaryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPeerCapabilitySummaryResponse copyWith(void Function(GetPeerCapabilitySummaryResponse) updates) => super.copyWith((message) => updates(message as GetPeerCapabilitySummaryResponse)) as GetPeerCapabilitySummaryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPeerCapabilitySummaryResponse create() => GetPeerCapabilitySummaryResponse._();
  GetPeerCapabilitySummaryResponse createEmptyInstance() => create();
  static $pb.PbList<GetPeerCapabilitySummaryResponse> createRepeated() => $pb.PbList<GetPeerCapabilitySummaryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPeerCapabilitySummaryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPeerCapabilitySummaryResponse>(create);
  static GetPeerCapabilitySummaryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get capabilitySummaryJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set capabilitySummaryJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCapabilitySummaryJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearCapabilitySummaryJson() => clearField(1);
}

class RemotePullServiceRequest extends $pb.GeneratedMessage {
  factory RemotePullServiceRequest({
    $core.String? peerId,
    $core.String? manifestYaml,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (manifestYaml != null) {
      $result.manifestYaml = manifestYaml;
    }
    return $result;
  }
  RemotePullServiceRequest._() : super();
  factory RemotePullServiceRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemotePullServiceRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemotePullServiceRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'manifestYaml')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemotePullServiceRequest clone() => RemotePullServiceRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemotePullServiceRequest copyWith(void Function(RemotePullServiceRequest) updates) => super.copyWith((message) => updates(message as RemotePullServiceRequest)) as RemotePullServiceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemotePullServiceRequest create() => RemotePullServiceRequest._();
  RemotePullServiceRequest createEmptyInstance() => create();
  static $pb.PbList<RemotePullServiceRequest> createRepeated() => $pb.PbList<RemotePullServiceRequest>();
  @$core.pragma('dart2js:noInline')
  static RemotePullServiceRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemotePullServiceRequest>(create);
  static RemotePullServiceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get manifestYaml => $_getSZ(1);
  @$pb.TagNumber(2)
  set manifestYaml($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasManifestYaml() => $_has(1);
  @$pb.TagNumber(2)
  void clearManifestYaml() => clearField(2);
}

class RemoteServiceNameRequest extends $pb.GeneratedMessage {
  factory RemoteServiceNameRequest({
    $core.String? peerId,
    $core.String? name,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  RemoteServiceNameRequest._() : super();
  factory RemoteServiceNameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteServiceNameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoteServiceNameRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteServiceNameRequest clone() => RemoteServiceNameRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteServiceNameRequest copyWith(void Function(RemoteServiceNameRequest) updates) => super.copyWith((message) => updates(message as RemoteServiceNameRequest)) as RemoteServiceNameRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteServiceNameRequest create() => RemoteServiceNameRequest._();
  RemoteServiceNameRequest createEmptyInstance() => create();
  static $pb.PbList<RemoteServiceNameRequest> createRepeated() => $pb.PbList<RemoteServiceNameRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoteServiceNameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteServiceNameRequest>(create);
  static RemoteServiceNameRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class RemotePeerRequest extends $pb.GeneratedMessage {
  factory RemotePeerRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  RemotePeerRequest._() : super();
  factory RemotePeerRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemotePeerRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemotePeerRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemotePeerRequest clone() => RemotePeerRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemotePeerRequest copyWith(void Function(RemotePeerRequest) updates) => super.copyWith((message) => updates(message as RemotePeerRequest)) as RemotePeerRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemotePeerRequest create() => RemotePeerRequest._();
  RemotePeerRequest createEmptyInstance() => create();
  static $pb.PbList<RemotePeerRequest> createRepeated() => $pb.PbList<RemotePeerRequest>();
  @$core.pragma('dart2js:noInline')
  static RemotePeerRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemotePeerRequest>(create);
  static RemotePeerRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class RemoteServiceControlResponse extends $pb.GeneratedMessage {
  factory RemoteServiceControlResponse({
    $core.String? serviceName,
  }) {
    final $result = create();
    if (serviceName != null) {
      $result.serviceName = serviceName;
    }
    return $result;
  }
  RemoteServiceControlResponse._() : super();
  factory RemoteServiceControlResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteServiceControlResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoteServiceControlResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteServiceControlResponse clone() => RemoteServiceControlResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteServiceControlResponse copyWith(void Function(RemoteServiceControlResponse) updates) => super.copyWith((message) => updates(message as RemoteServiceControlResponse)) as RemoteServiceControlResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteServiceControlResponse create() => RemoteServiceControlResponse._();
  RemoteServiceControlResponse createEmptyInstance() => create();
  static $pb.PbList<RemoteServiceControlResponse> createRepeated() => $pb.PbList<RemoteServiceControlResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoteServiceControlResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteServiceControlResponse>(create);
  static RemoteServiceControlResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceName => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceName() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceName() => clearField(1);
}

class AttachServiceAccessRequest extends $pb.GeneratedMessage {
  factory AttachServiceAccessRequest({
    $core.String? peerId,
    $core.String? serviceId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (serviceId != null) {
      $result.serviceId = serviceId;
    }
    return $result;
  }
  AttachServiceAccessRequest._() : super();
  factory AttachServiceAccessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AttachServiceAccessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AttachServiceAccessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'serviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AttachServiceAccessRequest clone() => AttachServiceAccessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AttachServiceAccessRequest copyWith(void Function(AttachServiceAccessRequest) updates) => super.copyWith((message) => updates(message as AttachServiceAccessRequest)) as AttachServiceAccessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AttachServiceAccessRequest create() => AttachServiceAccessRequest._();
  AttachServiceAccessRequest createEmptyInstance() => create();
  static $pb.PbList<AttachServiceAccessRequest> createRepeated() => $pb.PbList<AttachServiceAccessRequest>();
  @$core.pragma('dart2js:noInline')
  static AttachServiceAccessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AttachServiceAccessRequest>(create);
  static AttachServiceAccessRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set serviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServiceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearServiceId() => clearField(2);
}

class DetachServiceAccessRequest extends $pb.GeneratedMessage {
  factory DetachServiceAccessRequest({
    $core.String? peerId,
    $core.String? serviceId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    if (serviceId != null) {
      $result.serviceId = serviceId;
    }
    return $result;
  }
  DetachServiceAccessRequest._() : super();
  factory DetachServiceAccessRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DetachServiceAccessRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DetachServiceAccessRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..aOS(2, _omitFieldNames ? '' : 'serviceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DetachServiceAccessRequest clone() => DetachServiceAccessRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DetachServiceAccessRequest copyWith(void Function(DetachServiceAccessRequest) updates) => super.copyWith((message) => updates(message as DetachServiceAccessRequest)) as DetachServiceAccessRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DetachServiceAccessRequest create() => DetachServiceAccessRequest._();
  DetachServiceAccessRequest createEmptyInstance() => create();
  static $pb.PbList<DetachServiceAccessRequest> createRepeated() => $pb.PbList<DetachServiceAccessRequest>();
  @$core.pragma('dart2js:noInline')
  static DetachServiceAccessRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetachServiceAccessRequest>(create);
  static DetachServiceAccessRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get serviceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set serviceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasServiceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearServiceId() => clearField(2);
}

class ListServiceAccessesRequest extends $pb.GeneratedMessage {
  factory ListServiceAccessesRequest({
    $core.String? peerId,
  }) {
    final $result = create();
    if (peerId != null) {
      $result.peerId = peerId;
    }
    return $result;
  }
  ListServiceAccessesRequest._() : super();
  factory ListServiceAccessesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListServiceAccessesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListServiceAccessesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'peerId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListServiceAccessesRequest clone() => ListServiceAccessesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListServiceAccessesRequest copyWith(void Function(ListServiceAccessesRequest) updates) => super.copyWith((message) => updates(message as ListServiceAccessesRequest)) as ListServiceAccessesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListServiceAccessesRequest create() => ListServiceAccessesRequest._();
  ListServiceAccessesRequest createEmptyInstance() => create();
  static $pb.PbList<ListServiceAccessesRequest> createRepeated() => $pb.PbList<ListServiceAccessesRequest>();
  @$core.pragma('dart2js:noInline')
  static ListServiceAccessesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListServiceAccessesRequest>(create);
  static ListServiceAccessesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get peerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set peerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPeerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPeerId() => clearField(1);
}

class ServiceAccessResponse extends $pb.GeneratedMessage {
  factory ServiceAccessResponse({
    $core.String? serviceAccessJson,
  }) {
    final $result = create();
    if (serviceAccessJson != null) {
      $result.serviceAccessJson = serviceAccessJson;
    }
    return $result;
  }
  ServiceAccessResponse._() : super();
  factory ServiceAccessResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceAccessResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceAccessResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceAccessJson')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceAccessResponse clone() => ServiceAccessResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceAccessResponse copyWith(void Function(ServiceAccessResponse) updates) => super.copyWith((message) => updates(message as ServiceAccessResponse)) as ServiceAccessResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceAccessResponse create() => ServiceAccessResponse._();
  ServiceAccessResponse createEmptyInstance() => create();
  static $pb.PbList<ServiceAccessResponse> createRepeated() => $pb.PbList<ServiceAccessResponse>();
  @$core.pragma('dart2js:noInline')
  static ServiceAccessResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceAccessResponse>(create);
  static ServiceAccessResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceAccessJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceAccessJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceAccessJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceAccessJson() => clearField(1);
}

class ServiceAccessesResponse extends $pb.GeneratedMessage {
  factory ServiceAccessesResponse({
    $core.String? serviceAccessesJson,
  }) {
    final $result = create();
    if (serviceAccessesJson != null) {
      $result.serviceAccessesJson = serviceAccessesJson;
    }
    return $result;
  }
  ServiceAccessesResponse._() : super();
  factory ServiceAccessesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServiceAccessesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ServiceAccessesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'fungi_daemon'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'serviceAccessesJson')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServiceAccessesResponse clone() => ServiceAccessesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServiceAccessesResponse copyWith(void Function(ServiceAccessesResponse) updates) => super.copyWith((message) => updates(message as ServiceAccessesResponse)) as ServiceAccessesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServiceAccessesResponse create() => ServiceAccessesResponse._();
  ServiceAccessesResponse createEmptyInstance() => create();
  static $pb.PbList<ServiceAccessesResponse> createRepeated() => $pb.PbList<ServiceAccessesResponse>();
  @$core.pragma('dart2js:noInline')
  static ServiceAccessesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServiceAccessesResponse>(create);
  static ServiceAccessesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get serviceAccessesJson => $_getSZ(0);
  @$pb.TagNumber(1)
  set serviceAccessesJson($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasServiceAccessesJson() => $_has(0);
  @$pb.TagNumber(1)
  void clearServiceAccessesJson() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');

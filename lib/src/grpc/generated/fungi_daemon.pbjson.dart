//
//  Generated code. Do not modify.
//  source: fungi_daemon.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serviceRuntimeKindDescriptor instead')
const ServiceRuntimeKind$json = {
  '1': 'ServiceRuntimeKind',
  '2': [
    {'1': 'SERVICE_RUNTIME_KIND_UNSPECIFIED', '2': 0},
    {'1': 'SERVICE_RUNTIME_KIND_DOCKER', '2': 1},
    {'1': 'SERVICE_RUNTIME_KIND_WASMTIME', '2': 2},
  ],
};

/// Descriptor for `ServiceRuntimeKind`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serviceRuntimeKindDescriptor = $convert.base64Decode(
    'ChJTZXJ2aWNlUnVudGltZUtpbmQSJAogU0VSVklDRV9SVU5USU1FX0tJTkRfVU5TUEVDSUZJRU'
    'QQABIfChtTRVJWSUNFX1JVTlRJTUVfS0lORF9ET0NLRVIQARIhCh1TRVJWSUNFX1JVTlRJTUVf'
    'S0lORF9XQVNNVElNRRAC');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use versionResponseDescriptor instead')
const VersionResponse$json = {
  '1': 'VersionResponse',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 9, '10': 'version'},
    {'1': 'channel', '3': 2, '4': 1, '5': 9, '10': 'channel'},
    {'1': 'commit', '3': 3, '4': 1, '5': 9, '10': 'commit'},
    {'1': 'build_time', '3': 4, '4': 1, '5': 9, '10': 'buildTime'},
    {'1': 'default_fungi_dir', '3': 5, '4': 1, '5': 9, '10': 'defaultFungiDir'},
    {'1': 'default_rpc_address', '3': 6, '4': 1, '5': 9, '10': 'defaultRpcAddress'},
  ],
};

/// Descriptor for `VersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionResponseDescriptor = $convert.base64Decode(
    'Cg9WZXJzaW9uUmVzcG9uc2USGAoHdmVyc2lvbhgBIAEoCVIHdmVyc2lvbhIYCgdjaGFubmVsGA'
    'IgASgJUgdjaGFubmVsEhYKBmNvbW1pdBgDIAEoCVIGY29tbWl0Eh0KCmJ1aWxkX3RpbWUYBCAB'
    'KAlSCWJ1aWxkVGltZRIqChFkZWZhdWx0X2Z1bmdpX2RpchgFIAEoCVIPZGVmYXVsdEZ1bmdpRG'
    'lyEi4KE2RlZmF1bHRfcnBjX2FkZHJlc3MYBiABKAlSEWRlZmF1bHRScGNBZGRyZXNz');

@$core.Deprecated('Use hostnameResponseDescriptor instead')
const HostnameResponse$json = {
  '1': 'HostnameResponse',
  '2': [
    {'1': 'hostname', '3': 1, '4': 1, '5': 9, '10': 'hostname'},
  ],
};

/// Descriptor for `HostnameResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostnameResponseDescriptor = $convert.base64Decode(
    'ChBIb3N0bmFtZVJlc3BvbnNlEhoKCGhvc3RuYW1lGAEgASgJUghob3N0bmFtZQ==');

@$core.Deprecated('Use peerIdResponseDescriptor instead')
const PeerIdResponse$json = {
  '1': 'PeerIdResponse',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `PeerIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerIdResponseDescriptor = $convert.base64Decode(
    'Cg5QZWVySWRSZXNwb25zZRIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQ=');

@$core.Deprecated('Use configFilePathResponseDescriptor instead')
const ConfigFilePathResponse$json = {
  '1': 'ConfigFilePathResponse',
  '2': [
    {'1': 'config_file_path', '3': 1, '4': 1, '5': 9, '10': 'configFilePath'},
  ],
};

/// Descriptor for `ConfigFilePathResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configFilePathResponseDescriptor = $convert.base64Decode(
    'ChZDb25maWdGaWxlUGF0aFJlc3BvbnNlEigKEGNvbmZpZ19maWxlX3BhdGgYASABKAlSDmNvbm'
    'ZpZ0ZpbGVQYXRo');

@$core.Deprecated('Use incomingAllowedPeersListResponseDescriptor instead')
const IncomingAllowedPeersListResponse$json = {
  '1': 'IncomingAllowedPeersListResponse',
  '2': [
    {'1': 'peers', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.PeerInfo', '10': 'peers'},
  ],
};

/// Descriptor for `IncomingAllowedPeersListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List incomingAllowedPeersListResponseDescriptor = $convert.base64Decode(
    'CiBJbmNvbWluZ0FsbG93ZWRQZWVyc0xpc3RSZXNwb25zZRIsCgVwZWVycxgBIAMoCzIWLmZ1bm'
    'dpX2RhZW1vbi5QZWVySW5mb1IFcGVlcnM=');

@$core.Deprecated('Use addIncomingAllowedPeerRequestDescriptor instead')
const AddIncomingAllowedPeerRequest$json = {
  '1': 'AddIncomingAllowedPeerRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `AddIncomingAllowedPeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addIncomingAllowedPeerRequestDescriptor = $convert.base64Decode(
    'Ch1BZGRJbmNvbWluZ0FsbG93ZWRQZWVyUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZWVySW'
    'Q=');

@$core.Deprecated('Use removeIncomingAllowedPeerRequestDescriptor instead')
const RemoveIncomingAllowedPeerRequest$json = {
  '1': 'RemoveIncomingAllowedPeerRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `RemoveIncomingAllowedPeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeIncomingAllowedPeerRequestDescriptor = $convert.base64Decode(
    'CiBSZW1vdmVJbmNvbWluZ0FsbG93ZWRQZWVyUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZW'
    'VySWQ=');

@$core.Deprecated('Use relayEnabledRequestDescriptor instead')
const RelayEnabledRequest$json = {
  '1': 'RelayEnabledRequest',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `RelayEnabledRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List relayEnabledRequestDescriptor = $convert.base64Decode(
    'ChNSZWxheUVuYWJsZWRSZXF1ZXN0EhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZWQ=');

@$core.Deprecated('Use useCommunityRelaysRequestDescriptor instead')
const UseCommunityRelaysRequest$json = {
  '1': 'UseCommunityRelaysRequest',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `UseCommunityRelaysRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List useCommunityRelaysRequestDescriptor = $convert.base64Decode(
    'ChlVc2VDb21tdW5pdHlSZWxheXNSZXF1ZXN0EhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZWQ=');

@$core.Deprecated('Use relayAddressRequestDescriptor instead')
const RelayAddressRequest$json = {
  '1': 'RelayAddressRequest',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
  ],
};

/// Descriptor for `RelayAddressRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List relayAddressRequestDescriptor = $convert.base64Decode(
    'ChNSZWxheUFkZHJlc3NSZXF1ZXN0EhgKB2FkZHJlc3MYASABKAlSB2FkZHJlc3M=');

@$core.Deprecated('Use effectiveRelayAddressDescriptor instead')
const EffectiveRelayAddress$json = {
  '1': 'EffectiveRelayAddress',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'source', '3': 2, '4': 1, '5': 9, '10': 'source'},
  ],
};

/// Descriptor for `EffectiveRelayAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List effectiveRelayAddressDescriptor = $convert.base64Decode(
    'ChVFZmZlY3RpdmVSZWxheUFkZHJlc3MSGAoHYWRkcmVzcxgBIAEoCVIHYWRkcmVzcxIWCgZzb3'
    'VyY2UYAiABKAlSBnNvdXJjZQ==');

@$core.Deprecated('Use relayConfigResponseDescriptor instead')
const RelayConfigResponse$json = {
  '1': 'RelayConfigResponse',
  '2': [
    {'1': 'relay_enabled', '3': 1, '4': 1, '5': 8, '10': 'relayEnabled'},
    {'1': 'use_community_relays', '3': 2, '4': 1, '5': 8, '10': 'useCommunityRelays'},
    {'1': 'custom_relay_addresses', '3': 3, '4': 3, '5': 9, '10': 'customRelayAddresses'},
    {'1': 'effective_relay_addresses', '3': 4, '4': 3, '5': 11, '6': '.fungi_daemon.EffectiveRelayAddress', '10': 'effectiveRelayAddresses'},
  ],
};

/// Descriptor for `RelayConfigResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List relayConfigResponseDescriptor = $convert.base64Decode(
    'ChNSZWxheUNvbmZpZ1Jlc3BvbnNlEiMKDXJlbGF5X2VuYWJsZWQYASABKAhSDHJlbGF5RW5hYm'
    'xlZBIwChR1c2VfY29tbXVuaXR5X3JlbGF5cxgCIAEoCFISdXNlQ29tbXVuaXR5UmVsYXlzEjQK'
    'FmN1c3RvbV9yZWxheV9hZGRyZXNzZXMYAyADKAlSFGN1c3RvbVJlbGF5QWRkcmVzc2VzEl8KGW'
    'VmZmVjdGl2ZV9yZWxheV9hZGRyZXNzZXMYBCADKAsyIy5mdW5naV9kYWVtb24uRWZmZWN0aXZl'
    'UmVsYXlBZGRyZXNzUhdlZmZlY3RpdmVSZWxheUFkZHJlc3Nlcw==');

@$core.Deprecated('Use runtimeAllowedHostPathRequestDescriptor instead')
const RuntimeAllowedHostPathRequest$json = {
  '1': 'RuntimeAllowedHostPathRequest',
  '2': [
    {'1': 'path', '3': 1, '4': 1, '5': 9, '10': 'path'},
  ],
};

/// Descriptor for `RuntimeAllowedHostPathRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeAllowedHostPathRequestDescriptor = $convert.base64Decode(
    'Ch1SdW50aW1lQWxsb3dlZEhvc3RQYXRoUmVxdWVzdBISCgRwYXRoGAEgASgJUgRwYXRo');

@$core.Deprecated('Use runtimeAllowedPortRequestDescriptor instead')
const RuntimeAllowedPortRequest$json = {
  '1': 'RuntimeAllowedPortRequest',
  '2': [
    {'1': 'port', '3': 1, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `RuntimeAllowedPortRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeAllowedPortRequestDescriptor = $convert.base64Decode(
    'ChlSdW50aW1lQWxsb3dlZFBvcnRSZXF1ZXN0EhIKBHBvcnQYASABKAVSBHBvcnQ=');

@$core.Deprecated('Use runtimeAllowedPortRangeRequestDescriptor instead')
const RuntimeAllowedPortRangeRequest$json = {
  '1': 'RuntimeAllowedPortRangeRequest',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 5, '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 5, '10': 'end'},
  ],
};

/// Descriptor for `RuntimeAllowedPortRangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeAllowedPortRangeRequestDescriptor = $convert.base64Decode(
    'Ch5SdW50aW1lQWxsb3dlZFBvcnRSYW5nZVJlcXVlc3QSFAoFc3RhcnQYASABKAVSBXN0YXJ0Eh'
    'AKA2VuZBgCIAEoBVIDZW5k');

@$core.Deprecated('Use runtimeAllowedPortRangeDescriptor instead')
const RuntimeAllowedPortRange$json = {
  '1': 'RuntimeAllowedPortRange',
  '2': [
    {'1': 'start', '3': 1, '4': 1, '5': 5, '10': 'start'},
    {'1': 'end', '3': 2, '4': 1, '5': 5, '10': 'end'},
  ],
};

/// Descriptor for `RuntimeAllowedPortRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeAllowedPortRangeDescriptor = $convert.base64Decode(
    'ChdSdW50aW1lQWxsb3dlZFBvcnRSYW5nZRIUCgVzdGFydBgBIAEoBVIFc3RhcnQSEAoDZW5kGA'
    'IgASgFUgNlbmQ=');

@$core.Deprecated('Use runtimeConfigResponseDescriptor instead')
const RuntimeConfigResponse$json = {
  '1': 'RuntimeConfigResponse',
  '2': [
    {'1': 'disable_docker', '3': 1, '4': 1, '5': 8, '10': 'disableDocker'},
    {'1': 'disable_wasmtime', '3': 2, '4': 1, '5': 8, '10': 'disableWasmtime'},
    {'1': 'allowed_host_paths', '3': 3, '4': 3, '5': 9, '10': 'allowedHostPaths'},
    {'1': 'allowed_ports', '3': 4, '4': 3, '5': 5, '10': 'allowedPorts'},
    {'1': 'allowed_port_ranges', '3': 5, '4': 3, '5': 11, '6': '.fungi_daemon.RuntimeAllowedPortRange', '10': 'allowedPortRanges'},
  ],
};

/// Descriptor for `RuntimeConfigResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeConfigResponseDescriptor = $convert.base64Decode(
    'ChVSdW50aW1lQ29uZmlnUmVzcG9uc2USJQoOZGlzYWJsZV9kb2NrZXIYASABKAhSDWRpc2FibG'
    'VEb2NrZXISKQoQZGlzYWJsZV93YXNtdGltZRgCIAEoCFIPZGlzYWJsZVdhc210aW1lEiwKEmFs'
    'bG93ZWRfaG9zdF9wYXRocxgDIAMoCVIQYWxsb3dlZEhvc3RQYXRocxIjCg1hbGxvd2VkX3Bvcn'
    'RzGAQgAygFUgxhbGxvd2VkUG9ydHMSVQoTYWxsb3dlZF9wb3J0X3JhbmdlcxgFIAMoCzIlLmZ1'
    'bmdpX2RhZW1vbi5SdW50aW1lQWxsb3dlZFBvcnRSYW5nZVIRYWxsb3dlZFBvcnRSYW5nZXM=');

@$core.Deprecated('Use runtimeAvailabilityStatusDescriptor instead')
const RuntimeAvailabilityStatus$json = {
  '1': 'RuntimeAvailabilityStatus',
  '2': [
    {'1': 'config_enabled', '3': 1, '4': 1, '5': 8, '10': 'configEnabled'},
    {'1': 'detected', '3': 2, '4': 1, '5': 8, '10': 'detected'},
    {'1': 'active', '3': 3, '4': 1, '5': 8, '10': 'active'},
    {'1': 'endpoint', '3': 4, '4': 1, '5': 9, '10': 'endpoint'},
  ],
};

/// Descriptor for `RuntimeAvailabilityStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List runtimeAvailabilityStatusDescriptor = $convert.base64Decode(
    'ChlSdW50aW1lQXZhaWxhYmlsaXR5U3RhdHVzEiUKDmNvbmZpZ19lbmFibGVkGAEgASgIUg1jb2'
    '5maWdFbmFibGVkEhoKCGRldGVjdGVkGAIgASgIUghkZXRlY3RlZBIWCgZhY3RpdmUYAyABKAhS'
    'BmFjdGl2ZRIaCghlbmRwb2ludBgEIAEoCVIIZW5kcG9pbnQ=');

@$core.Deprecated('Use localRuntimeStatusResponseDescriptor instead')
const LocalRuntimeStatusResponse$json = {
  '1': 'LocalRuntimeStatusResponse',
  '2': [
    {'1': 'docker', '3': 1, '4': 1, '5': 11, '6': '.fungi_daemon.RuntimeAvailabilityStatus', '10': 'docker'},
    {'1': 'wasmtime', '3': 2, '4': 1, '5': 11, '6': '.fungi_daemon.RuntimeAvailabilityStatus', '10': 'wasmtime'},
  ],
};

/// Descriptor for `LocalRuntimeStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localRuntimeStatusResponseDescriptor = $convert.base64Decode(
    'ChpMb2NhbFJ1bnRpbWVTdGF0dXNSZXNwb25zZRI/CgZkb2NrZXIYASABKAsyJy5mdW5naV9kYW'
    'Vtb24uUnVudGltZUF2YWlsYWJpbGl0eVN0YXR1c1IGZG9ja2VyEkMKCHdhc210aW1lGAIgASgL'
    'MicuZnVuZ2lfZGFlbW9uLlJ1bnRpbWVBdmFpbGFiaWxpdHlTdGF0dXNSCHdhc210aW1l');

@$core.Deprecated('Use fileTransferServiceEnabledResponseDescriptor instead')
const FileTransferServiceEnabledResponse$json = {
  '1': 'FileTransferServiceEnabledResponse',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `FileTransferServiceEnabledResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileTransferServiceEnabledResponseDescriptor = $convert.base64Decode(
    'CiJGaWxlVHJhbnNmZXJTZXJ2aWNlRW5hYmxlZFJlc3BvbnNlEhgKB2VuYWJsZWQYASABKAhSB2'
    'VuYWJsZWQ=');

@$core.Deprecated('Use fileTransferServiceRootDirResponseDescriptor instead')
const FileTransferServiceRootDirResponse$json = {
  '1': 'FileTransferServiceRootDirResponse',
  '2': [
    {'1': 'root_dir', '3': 1, '4': 1, '5': 9, '10': 'rootDir'},
  ],
};

/// Descriptor for `FileTransferServiceRootDirResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileTransferServiceRootDirResponseDescriptor = $convert.base64Decode(
    'CiJGaWxlVHJhbnNmZXJTZXJ2aWNlUm9vdERpclJlc3BvbnNlEhkKCHJvb3RfZGlyGAEgASgJUg'
    'dyb290RGly');

@$core.Deprecated('Use startFileTransferServiceRequestDescriptor instead')
const StartFileTransferServiceRequest$json = {
  '1': 'StartFileTransferServiceRequest',
  '2': [
    {'1': 'root_dir', '3': 1, '4': 1, '5': 9, '10': 'rootDir'},
  ],
};

/// Descriptor for `StartFileTransferServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List startFileTransferServiceRequestDescriptor = $convert.base64Decode(
    'Ch9TdGFydEZpbGVUcmFuc2ZlclNlcnZpY2VSZXF1ZXN0EhkKCHJvb3RfZGlyGAEgASgJUgdyb2'
    '90RGly');

@$core.Deprecated('Use addFileTransferClientRequestDescriptor instead')
const AddFileTransferClientRequest$json = {
  '1': 'AddFileTransferClientRequest',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'peer_id', '3': 3, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `AddFileTransferClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addFileTransferClientRequestDescriptor = $convert.base64Decode(
    'ChxBZGRGaWxlVHJhbnNmZXJDbGllbnRSZXF1ZXN0EhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZW'
    'QSEgoEbmFtZRgCIAEoCVIEbmFtZRIXCgdwZWVyX2lkGAMgASgJUgZwZWVySWQ=');

@$core.Deprecated('Use removeFileTransferClientRequestDescriptor instead')
const RemoveFileTransferClientRequest$json = {
  '1': 'RemoveFileTransferClientRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `RemoveFileTransferClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeFileTransferClientRequestDescriptor = $convert.base64Decode(
    'Ch9SZW1vdmVGaWxlVHJhbnNmZXJDbGllbnRSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZX'
    'JJZA==');

@$core.Deprecated('Use enableFileTransferClientRequestDescriptor instead')
const EnableFileTransferClientRequest$json = {
  '1': 'EnableFileTransferClientRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'enabled', '3': 2, '4': 1, '5': 8, '10': 'enabled'},
  ],
};

/// Descriptor for `EnableFileTransferClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enableFileTransferClientRequestDescriptor = $convert.base64Decode(
    'Ch9FbmFibGVGaWxlVHJhbnNmZXJDbGllbnRSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZX'
    'JJZBIYCgdlbmFibGVkGAIgASgIUgdlbmFibGVk');

@$core.Deprecated('Use fileTransferClientDescriptor instead')
const FileTransferClient$json = {
  '1': 'FileTransferClient',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'peer_id', '3': 3, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `FileTransferClient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileTransferClientDescriptor = $convert.base64Decode(
    'ChJGaWxlVHJhbnNmZXJDbGllbnQSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBISCgRuYW1lGA'
    'IgASgJUgRuYW1lEhcKB3BlZXJfaWQYAyABKAlSBnBlZXJJZA==');

@$core.Deprecated('Use fileTransferClientsResponseDescriptor instead')
const FileTransferClientsResponse$json = {
  '1': 'FileTransferClientsResponse',
  '2': [
    {'1': 'clients', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.FileTransferClient', '10': 'clients'},
  ],
};

/// Descriptor for `FileTransferClientsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileTransferClientsResponseDescriptor = $convert.base64Decode(
    'ChtGaWxlVHJhbnNmZXJDbGllbnRzUmVzcG9uc2USOgoHY2xpZW50cxgBIAMoCzIgLmZ1bmdpX2'
    'RhZW1vbi5GaWxlVHJhbnNmZXJDbGllbnRSB2NsaWVudHM=');

@$core.Deprecated('Use ftpProxyResponseDescriptor instead')
const FtpProxyResponse$json = {
  '1': 'FtpProxyResponse',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'host', '3': 2, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 3, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `FtpProxyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ftpProxyResponseDescriptor = $convert.base64Decode(
    'ChBGdHBQcm94eVJlc3BvbnNlEhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZWQSEgoEaG9zdBgCIA'
    'EoCVIEaG9zdBISCgRwb3J0GAMgASgFUgRwb3J0');

@$core.Deprecated('Use updateFtpProxyRequestDescriptor instead')
const UpdateFtpProxyRequest$json = {
  '1': 'UpdateFtpProxyRequest',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'host', '3': 2, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 3, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `UpdateFtpProxyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateFtpProxyRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVGdHBQcm94eVJlcXVlc3QSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBISCgRob3'
    'N0GAIgASgJUgRob3N0EhIKBHBvcnQYAyABKAVSBHBvcnQ=');

@$core.Deprecated('Use webdavProxyResponseDescriptor instead')
const WebdavProxyResponse$json = {
  '1': 'WebdavProxyResponse',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'host', '3': 2, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 3, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `WebdavProxyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List webdavProxyResponseDescriptor = $convert.base64Decode(
    'ChNXZWJkYXZQcm94eVJlc3BvbnNlEhgKB2VuYWJsZWQYASABKAhSB2VuYWJsZWQSEgoEaG9zdB'
    'gCIAEoCVIEaG9zdBISCgRwb3J0GAMgASgFUgRwb3J0');

@$core.Deprecated('Use updateWebdavProxyRequestDescriptor instead')
const UpdateWebdavProxyRequest$json = {
  '1': 'UpdateWebdavProxyRequest',
  '2': [
    {'1': 'enabled', '3': 1, '4': 1, '5': 8, '10': 'enabled'},
    {'1': 'host', '3': 2, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 3, '4': 1, '5': 5, '10': 'port'},
  ],
};

/// Descriptor for `UpdateWebdavProxyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateWebdavProxyRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVXZWJkYXZQcm94eVJlcXVlc3QSGAoHZW5hYmxlZBgBIAEoCFIHZW5hYmxlZBISCg'
    'Rob3N0GAIgASgJUgRob3N0EhIKBHBvcnQYAyABKAVSBHBvcnQ=');

@$core.Deprecated('Use forwardingRuleDescriptor instead')
const ForwardingRule$json = {
  '1': 'ForwardingRule',
  '2': [
    {'1': 'local_host', '3': 1, '4': 1, '5': 9, '10': 'localHost'},
    {'1': 'local_port', '3': 2, '4': 1, '5': 5, '10': 'localPort'},
    {'1': 'remote_peer_id', '3': 3, '4': 1, '5': 9, '10': 'remotePeerId'},
    {'1': 'remote_port', '3': 4, '4': 1, '5': 5, '10': 'remotePort'},
    {'1': 'remote_protocol', '3': 5, '4': 1, '5': 9, '10': 'remoteProtocol'},
    {'1': 'remote_service_id', '3': 6, '4': 1, '5': 9, '10': 'remoteServiceId'},
    {'1': 'remote_service_name', '3': 7, '4': 1, '5': 9, '10': 'remoteServiceName'},
    {'1': 'remote_service_port_name', '3': 8, '4': 1, '5': 9, '10': 'remoteServicePortName'},
  ],
};

/// Descriptor for `ForwardingRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forwardingRuleDescriptor = $convert.base64Decode(
    'Cg5Gb3J3YXJkaW5nUnVsZRIdCgpsb2NhbF9ob3N0GAEgASgJUglsb2NhbEhvc3QSHQoKbG9jYW'
    'xfcG9ydBgCIAEoBVIJbG9jYWxQb3J0EiQKDnJlbW90ZV9wZWVyX2lkGAMgASgJUgxyZW1vdGVQ'
    'ZWVySWQSHwoLcmVtb3RlX3BvcnQYBCABKAVSCnJlbW90ZVBvcnQSJwoPcmVtb3RlX3Byb3RvY2'
    '9sGAUgASgJUg5yZW1vdGVQcm90b2NvbBIqChFyZW1vdGVfc2VydmljZV9pZBgGIAEoCVIPcmVt'
    'b3RlU2VydmljZUlkEi4KE3JlbW90ZV9zZXJ2aWNlX25hbWUYByABKAlSEXJlbW90ZVNlcnZpY2'
    'VOYW1lEjcKGHJlbW90ZV9zZXJ2aWNlX3BvcnRfbmFtZRgIIAEoCVIVcmVtb3RlU2VydmljZVBv'
    'cnROYW1l');

@$core.Deprecated('Use listeningRuleDescriptor instead')
const ListeningRule$json = {
  '1': 'ListeningRule',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 2, '4': 1, '5': 5, '10': 'port'},
    {'1': 'allowed_peers', '3': 3, '4': 3, '5': 9, '10': 'allowedPeers'},
    {'1': 'protocol', '3': 4, '4': 1, '5': 9, '10': 'protocol'},
  ],
};

/// Descriptor for `ListeningRule`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listeningRuleDescriptor = $convert.base64Decode(
    'Cg1MaXN0ZW5pbmdSdWxlEhIKBGhvc3QYASABKAlSBGhvc3QSEgoEcG9ydBgCIAEoBVIEcG9ydB'
    'IjCg1hbGxvd2VkX3BlZXJzGAMgAygJUgxhbGxvd2VkUGVlcnMSGgoIcHJvdG9jb2wYBCABKAlS'
    'CHByb3RvY29s');

@$core.Deprecated('Use tcpTunnelingConfigResponseDescriptor instead')
const TcpTunnelingConfigResponse$json = {
  '1': 'TcpTunnelingConfigResponse',
  '2': [
    {'1': 'forwarding_enabled', '3': 1, '4': 1, '5': 8, '10': 'forwardingEnabled'},
    {'1': 'listening_enabled', '3': 2, '4': 1, '5': 8, '10': 'listeningEnabled'},
    {'1': 'forwarding_rules', '3': 3, '4': 3, '5': 11, '6': '.fungi_daemon.ForwardingRule', '10': 'forwardingRules'},
    {'1': 'listening_rules', '3': 4, '4': 3, '5': 11, '6': '.fungi_daemon.ListeningRule', '10': 'listeningRules'},
  ],
};

/// Descriptor for `TcpTunnelingConfigResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tcpTunnelingConfigResponseDescriptor = $convert.base64Decode(
    'ChpUY3BUdW5uZWxpbmdDb25maWdSZXNwb25zZRItChJmb3J3YXJkaW5nX2VuYWJsZWQYASABKA'
    'hSEWZvcndhcmRpbmdFbmFibGVkEisKEWxpc3RlbmluZ19lbmFibGVkGAIgASgIUhBsaXN0ZW5p'
    'bmdFbmFibGVkEkcKEGZvcndhcmRpbmdfcnVsZXMYAyADKAsyHC5mdW5naV9kYWVtb24uRm9yd2'
    'FyZGluZ1J1bGVSD2ZvcndhcmRpbmdSdWxlcxJECg9saXN0ZW5pbmdfcnVsZXMYBCADKAsyGy5m'
    'dW5naV9kYWVtb24uTGlzdGVuaW5nUnVsZVIObGlzdGVuaW5nUnVsZXM=');

@$core.Deprecated('Use addTcpForwardingRuleRequestDescriptor instead')
const AddTcpForwardingRuleRequest$json = {
  '1': 'AddTcpForwardingRuleRequest',
  '2': [
    {'1': 'local_host', '3': 1, '4': 1, '5': 9, '10': 'localHost'},
    {'1': 'local_port', '3': 2, '4': 1, '5': 5, '10': 'localPort'},
    {'1': 'peer_id', '3': 3, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'remote_port', '3': 4, '4': 1, '5': 5, '10': 'remotePort'},
    {'1': 'remote_protocol', '3': 5, '4': 1, '5': 9, '10': 'remoteProtocol'},
    {'1': 'remote_service_id', '3': 6, '4': 1, '5': 9, '10': 'remoteServiceId'},
    {'1': 'remote_service_name', '3': 7, '4': 1, '5': 9, '10': 'remoteServiceName'},
    {'1': 'remote_service_port_name', '3': 8, '4': 1, '5': 9, '10': 'remoteServicePortName'},
  ],
};

/// Descriptor for `AddTcpForwardingRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTcpForwardingRuleRequestDescriptor = $convert.base64Decode(
    'ChtBZGRUY3BGb3J3YXJkaW5nUnVsZVJlcXVlc3QSHQoKbG9jYWxfaG9zdBgBIAEoCVIJbG9jYW'
    'xIb3N0Eh0KCmxvY2FsX3BvcnQYAiABKAVSCWxvY2FsUG9ydBIXCgdwZWVyX2lkGAMgASgJUgZw'
    'ZWVySWQSHwoLcmVtb3RlX3BvcnQYBCABKAVSCnJlbW90ZVBvcnQSJwoPcmVtb3RlX3Byb3RvY2'
    '9sGAUgASgJUg5yZW1vdGVQcm90b2NvbBIqChFyZW1vdGVfc2VydmljZV9pZBgGIAEoCVIPcmVt'
    'b3RlU2VydmljZUlkEi4KE3JlbW90ZV9zZXJ2aWNlX25hbWUYByABKAlSEXJlbW90ZVNlcnZpY2'
    'VOYW1lEjcKGHJlbW90ZV9zZXJ2aWNlX3BvcnRfbmFtZRgIIAEoCVIVcmVtb3RlU2VydmljZVBv'
    'cnROYW1l');

@$core.Deprecated('Use tcpForwardingRuleResponseDescriptor instead')
const TcpForwardingRuleResponse$json = {
  '1': 'TcpForwardingRuleResponse',
  '2': [
    {'1': 'rule_id', '3': 1, '4': 1, '5': 9, '10': 'ruleId'},
  ],
};

/// Descriptor for `TcpForwardingRuleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tcpForwardingRuleResponseDescriptor = $convert.base64Decode(
    'ChlUY3BGb3J3YXJkaW5nUnVsZVJlc3BvbnNlEhcKB3J1bGVfaWQYASABKAlSBnJ1bGVJZA==');

@$core.Deprecated('Use removeTcpForwardingRuleRequestDescriptor instead')
const RemoveTcpForwardingRuleRequest$json = {
  '1': 'RemoveTcpForwardingRuleRequest',
  '2': [
    {'1': 'local_host', '3': 1, '4': 1, '5': 9, '10': 'localHost'},
    {'1': 'local_port', '3': 2, '4': 1, '5': 5, '10': 'localPort'},
    {'1': 'peer_id', '3': 3, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'remote_port', '3': 4, '4': 1, '5': 5, '10': 'remotePort'},
    {'1': 'remote_protocol', '3': 5, '4': 1, '5': 9, '10': 'remoteProtocol'},
  ],
};

/// Descriptor for `RemoveTcpForwardingRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTcpForwardingRuleRequestDescriptor = $convert.base64Decode(
    'Ch5SZW1vdmVUY3BGb3J3YXJkaW5nUnVsZVJlcXVlc3QSHQoKbG9jYWxfaG9zdBgBIAEoCVIJbG'
    '9jYWxIb3N0Eh0KCmxvY2FsX3BvcnQYAiABKAVSCWxvY2FsUG9ydBIXCgdwZWVyX2lkGAMgASgJ'
    'UgZwZWVySWQSHwoLcmVtb3RlX3BvcnQYBCABKAVSCnJlbW90ZVBvcnQSJwoPcmVtb3RlX3Byb3'
    'RvY29sGAUgASgJUg5yZW1vdGVQcm90b2NvbA==');

@$core.Deprecated('Use addTcpListeningRuleRequestDescriptor instead')
const AddTcpListeningRuleRequest$json = {
  '1': 'AddTcpListeningRuleRequest',
  '2': [
    {'1': 'local_host', '3': 1, '4': 1, '5': 9, '10': 'localHost'},
    {'1': 'local_port', '3': 2, '4': 1, '5': 5, '10': 'localPort'},
    {'1': 'allowed_peers', '3': 3, '4': 3, '5': 9, '10': 'allowedPeers'},
    {'1': 'protocol', '3': 4, '4': 1, '5': 9, '10': 'protocol'},
  ],
};

/// Descriptor for `AddTcpListeningRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTcpListeningRuleRequestDescriptor = $convert.base64Decode(
    'ChpBZGRUY3BMaXN0ZW5pbmdSdWxlUmVxdWVzdBIdCgpsb2NhbF9ob3N0GAEgASgJUglsb2NhbE'
    'hvc3QSHQoKbG9jYWxfcG9ydBgCIAEoBVIJbG9jYWxQb3J0EiMKDWFsbG93ZWRfcGVlcnMYAyAD'
    'KAlSDGFsbG93ZWRQZWVycxIaCghwcm90b2NvbBgEIAEoCVIIcHJvdG9jb2w=');

@$core.Deprecated('Use tcpListeningRuleResponseDescriptor instead')
const TcpListeningRuleResponse$json = {
  '1': 'TcpListeningRuleResponse',
  '2': [
    {'1': 'rule_id', '3': 1, '4': 1, '5': 9, '10': 'ruleId'},
  ],
};

/// Descriptor for `TcpListeningRuleResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tcpListeningRuleResponseDescriptor = $convert.base64Decode(
    'ChhUY3BMaXN0ZW5pbmdSdWxlUmVzcG9uc2USFwoHcnVsZV9pZBgBIAEoCVIGcnVsZUlk');

@$core.Deprecated('Use removeTcpListeningRuleRequestDescriptor instead')
const RemoveTcpListeningRuleRequest$json = {
  '1': 'RemoveTcpListeningRuleRequest',
  '2': [
    {'1': 'local_host', '3': 1, '4': 1, '5': 9, '10': 'localHost'},
    {'1': 'local_port', '3': 2, '4': 1, '5': 5, '10': 'localPort'},
    {'1': 'protocol', '3': 3, '4': 1, '5': 9, '10': 'protocol'},
  ],
};

/// Descriptor for `RemoveTcpListeningRuleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeTcpListeningRuleRequestDescriptor = $convert.base64Decode(
    'Ch1SZW1vdmVUY3BMaXN0ZW5pbmdSdWxlUmVxdWVzdBIdCgpsb2NhbF9ob3N0GAEgASgJUglsb2'
    'NhbEhvc3QSHQoKbG9jYWxfcG9ydBgCIAEoBVIJbG9jYWxQb3J0EhoKCHByb3RvY29sGAMgASgJ'
    'Ughwcm90b2NvbA==');

@$core.Deprecated('Use peerInfoDescriptor instead')
const PeerInfo$json = {
  '1': 'PeerInfo',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'alias', '3': 2, '4': 1, '5': 9, '10': 'alias'},
    {'1': 'hostname', '3': 3, '4': 1, '5': 9, '10': 'hostname'},
    {'1': 'os', '3': 4, '4': 1, '5': 9, '10': 'os'},
    {'1': 'public_ip', '3': 5, '4': 1, '5': 9, '10': 'publicIp'},
    {'1': 'private_ips', '3': 6, '4': 3, '5': 9, '10': 'privateIps'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'last_connected', '3': 8, '4': 1, '5': 3, '10': 'lastConnected'},
    {'1': 'version', '3': 9, '4': 1, '5': 9, '10': 'version'},
  ],
};

/// Descriptor for `PeerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerInfoDescriptor = $convert.base64Decode(
    'CghQZWVySW5mbxIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQSFAoFYWxpYXMYAiABKAlSBWFsaW'
    'FzEhoKCGhvc3RuYW1lGAMgASgJUghob3N0bmFtZRIOCgJvcxgEIAEoCVICb3MSGwoJcHVibGlj'
    'X2lwGAUgASgJUghwdWJsaWNJcBIfCgtwcml2YXRlX2lwcxgGIAMoCVIKcHJpdmF0ZUlwcxIdCg'
    'pjcmVhdGVkX2F0GAcgASgDUgljcmVhdGVkQXQSJQoObGFzdF9jb25uZWN0ZWQYCCABKANSDWxh'
    'c3RDb25uZWN0ZWQSGAoHdmVyc2lvbhgJIAEoCVIHdmVyc2lvbg==');

@$core.Deprecated('Use peerInfoListResponseDescriptor instead')
const PeerInfoListResponse$json = {
  '1': 'PeerInfoListResponse',
  '2': [
    {'1': 'peers', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.PeerInfo', '10': 'peers'},
  ],
};

/// Descriptor for `PeerInfoListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerInfoListResponseDescriptor = $convert.base64Decode(
    'ChRQZWVySW5mb0xpc3RSZXNwb25zZRIsCgVwZWVycxgBIAMoCzIWLmZ1bmdpX2RhZW1vbi5QZW'
    'VySW5mb1IFcGVlcnM=');

@$core.Deprecated('Use peerInfoResponseDescriptor instead')
const PeerInfoResponse$json = {
  '1': 'PeerInfoResponse',
  '2': [
    {'1': 'peer_info', '3': 1, '4': 1, '5': 11, '6': '.fungi_daemon.PeerInfo', '10': 'peerInfo'},
  ],
};

/// Descriptor for `PeerInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerInfoResponseDescriptor = $convert.base64Decode(
    'ChBQZWVySW5mb1Jlc3BvbnNlEjMKCXBlZXJfaW5mbxgBIAEoCzIWLmZ1bmdpX2RhZW1vbi5QZW'
    'VySW5mb1IIcGVlckluZm8=');

@$core.Deprecated('Use updateAddressBookPeerRequestDescriptor instead')
const UpdateAddressBookPeerRequest$json = {
  '1': 'UpdateAddressBookPeerRequest',
  '2': [
    {'1': 'peer_info', '3': 1, '4': 1, '5': 11, '6': '.fungi_daemon.PeerInfo', '10': 'peerInfo'},
  ],
};

/// Descriptor for `UpdateAddressBookPeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAddressBookPeerRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVBZGRyZXNzQm9va1BlZXJSZXF1ZXN0EjMKCXBlZXJfaW5mbxgBIAEoCzIWLmZ1bm'
    'dpX2RhZW1vbi5QZWVySW5mb1IIcGVlckluZm8=');

@$core.Deprecated('Use getAddressBookPeerRequestDescriptor instead')
const GetAddressBookPeerRequest$json = {
  '1': 'GetAddressBookPeerRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `GetAddressBookPeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAddressBookPeerRequestDescriptor = $convert.base64Decode(
    'ChlHZXRBZGRyZXNzQm9va1BlZXJSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZXJJZA==');

@$core.Deprecated('Use removeAddressBookPeerRequestDescriptor instead')
const RemoveAddressBookPeerRequest$json = {
  '1': 'RemoveAddressBookPeerRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `RemoveAddressBookPeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeAddressBookPeerRequestDescriptor = $convert.base64Decode(
    'ChxSZW1vdmVBZGRyZXNzQm9va1BlZXJSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZXJJZA'
    '==');

@$core.Deprecated('Use pingPeerRequestDescriptor instead')
const PingPeerRequest$json = {
  '1': 'PingPeerRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'interval_ms', '3': 2, '4': 1, '5': 13, '10': 'intervalMs'},
  ],
};

/// Descriptor for `PingPeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingPeerRequestDescriptor = $convert.base64Decode(
    'Cg9QaW5nUGVlclJlcXVlc3QSFwoHcGVlcl9pZBgBIAEoCVIGcGVlcklkEh8KC2ludGVydmFsX2'
    '1zGAIgASgNUgppbnRlcnZhbE1z');

@$core.Deprecated('Use pingPeerEventDescriptor instead')
const PingPeerEvent$json = {
  '1': 'PingPeerEvent',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'tick_seq', '3': 2, '4': 1, '5': 4, '10': 'tickSeq'},
    {'1': 'ts_unix_ms', '3': 3, '4': 1, '5': 3, '10': 'tsUnixMs'},
    {'1': 'connecting', '3': 10, '4': 1, '5': 11, '6': '.fungi_daemon.PingPeerConnecting', '9': 0, '10': 'connecting'},
    {'1': 'connected', '3': 11, '4': 1, '5': 11, '6': '.fungi_daemon.PingPeerConnected', '9': 0, '10': 'connected'},
    {'1': 'idle', '3': 12, '4': 1, '5': 11, '6': '.fungi_daemon.PingPeerIdle', '9': 0, '10': 'idle'},
    {'1': 'result', '3': 13, '4': 1, '5': 11, '6': '.fungi_daemon.PingPeerResult', '9': 0, '10': 'result'},
    {'1': 'error', '3': 14, '4': 1, '5': 11, '6': '.fungi_daemon.PingPeerError', '9': 0, '10': 'error'},
  ],
  '8': [
    {'1': 'event'},
  ],
};

/// Descriptor for `PingPeerEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingPeerEventDescriptor = $convert.base64Decode(
    'Cg1QaW5nUGVlckV2ZW50EhcKB3BlZXJfaWQYASABKAlSBnBlZXJJZBIZCgh0aWNrX3NlcRgCIA'
    'EoBFIHdGlja1NlcRIcCgp0c191bml4X21zGAMgASgDUgh0c1VuaXhNcxJCCgpjb25uZWN0aW5n'
    'GAogASgLMiAuZnVuZ2lfZGFlbW9uLlBpbmdQZWVyQ29ubmVjdGluZ0gAUgpjb25uZWN0aW5nEj'
    '8KCWNvbm5lY3RlZBgLIAEoCzIfLmZ1bmdpX2RhZW1vbi5QaW5nUGVlckNvbm5lY3RlZEgAUglj'
    'b25uZWN0ZWQSMAoEaWRsZRgMIAEoCzIaLmZ1bmdpX2RhZW1vbi5QaW5nUGVlcklkbGVIAFIEaW'
    'RsZRI2CgZyZXN1bHQYDSABKAsyHC5mdW5naV9kYWVtb24uUGluZ1BlZXJSZXN1bHRIAFIGcmVz'
    'dWx0EjMKBWVycm9yGA4gASgLMhsuZnVuZ2lfZGFlbW9uLlBpbmdQZWVyRXJyb3JIAFIFZXJyb3'
    'JCBwoFZXZlbnQ=');

@$core.Deprecated('Use pingPeerConnectingDescriptor instead')
const PingPeerConnecting$json = {
  '1': 'PingPeerConnecting',
};

/// Descriptor for `PingPeerConnecting`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingPeerConnectingDescriptor = $convert.base64Decode(
    'ChJQaW5nUGVlckNvbm5lY3Rpbmc=');

@$core.Deprecated('Use pingPeerConnectedDescriptor instead')
const PingPeerConnected$json = {
  '1': 'PingPeerConnected',
};

/// Descriptor for `PingPeerConnected`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingPeerConnectedDescriptor = $convert.base64Decode(
    'ChFQaW5nUGVlckNvbm5lY3RlZA==');

@$core.Deprecated('Use pingPeerIdleDescriptor instead')
const PingPeerIdle$json = {
  '1': 'PingPeerIdle',
};

/// Descriptor for `PingPeerIdle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingPeerIdleDescriptor = $convert.base64Decode(
    'CgxQaW5nUGVlcklkbGU=');

@$core.Deprecated('Use pingPeerResultDescriptor instead')
const PingPeerResult$json = {
  '1': 'PingPeerResult',
  '2': [
    {'1': 'connection_id', '3': 1, '4': 1, '5': 9, '10': 'connectionId'},
    {'1': 'direction', '3': 2, '4': 1, '5': 9, '10': 'direction'},
    {'1': 'remote_addr', '3': 3, '4': 1, '5': 9, '10': 'remoteAddr'},
    {'1': 'rtt_ms', '3': 4, '4': 1, '5': 4, '10': 'rttMs'},
  ],
};

/// Descriptor for `PingPeerResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingPeerResultDescriptor = $convert.base64Decode(
    'Cg5QaW5nUGVlclJlc3VsdBIjCg1jb25uZWN0aW9uX2lkGAEgASgJUgxjb25uZWN0aW9uSWQSHA'
    'oJZGlyZWN0aW9uGAIgASgJUglkaXJlY3Rpb24SHwoLcmVtb3RlX2FkZHIYAyABKAlSCnJlbW90'
    'ZUFkZHISFQoGcnR0X21zGAQgASgEUgVydHRNcw==');

@$core.Deprecated('Use pingPeerErrorDescriptor instead')
const PingPeerError$json = {
  '1': 'PingPeerError',
  '2': [
    {'1': 'connection_id', '3': 1, '4': 1, '5': 9, '10': 'connectionId'},
    {'1': 'direction', '3': 2, '4': 1, '5': 9, '10': 'direction'},
    {'1': 'remote_addr', '3': 3, '4': 1, '5': 9, '10': 'remoteAddr'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `PingPeerError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingPeerErrorDescriptor = $convert.base64Decode(
    'Cg1QaW5nUGVlckVycm9yEiMKDWNvbm5lY3Rpb25faWQYASABKAlSDGNvbm5lY3Rpb25JZBIcCg'
    'lkaXJlY3Rpb24YAiABKAlSCWRpcmVjdGlvbhIfCgtyZW1vdGVfYWRkchgDIAEoCVIKcmVtb3Rl'
    'QWRkchIYCgdtZXNzYWdlGAQgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use listConnectionsRequestDescriptor instead')
const ListConnectionsRequest$json = {
  '1': 'ListConnectionsRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `ListConnectionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listConnectionsRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0Q29ubmVjdGlvbnNSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZXJJZA==');

@$core.Deprecated('Use connectionSnapshotDescriptor instead')
const ConnectionSnapshot$json = {
  '1': 'ConnectionSnapshot',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'connection_id', '3': 2, '4': 1, '5': 9, '10': 'connectionId'},
    {'1': 'direction', '3': 3, '4': 1, '5': 9, '10': 'direction'},
    {'1': 'remote_addr', '3': 4, '4': 1, '5': 9, '10': 'remoteAddr'},
    {'1': 'is_relay', '3': 5, '4': 1, '5': 8, '10': 'isRelay'},
    {'1': 'last_rtt_ms', '3': 6, '4': 1, '5': 4, '10': 'lastRttMs'},
    {'1': 'last_ping_unix_ms', '3': 7, '4': 1, '5': 3, '10': 'lastPingUnixMs'},
    {'1': 'active_streams_total', '3': 8, '4': 1, '5': 4, '10': 'activeStreamsTotal'},
    {'1': 'active_streams_by_protocol', '3': 9, '4': 3, '5': 11, '6': '.fungi_daemon.ProtocolStreamCountSnapshot', '10': 'activeStreamsByProtocol'},
    {'1': 'policy_state', '3': 10, '4': 1, '5': 9, '10': 'policyState'},
    {'1': 'policy_reason', '3': 11, '4': 1, '5': 9, '10': 'policyReason'},
    {'1': 'peer_alias', '3': 12, '4': 1, '5': 9, '10': 'peerAlias'},
    {'1': 'peer_role', '3': 13, '4': 1, '5': 9, '10': 'peerRole'},
  ],
};

/// Descriptor for `ConnectionSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List connectionSnapshotDescriptor = $convert.base64Decode(
    'ChJDb25uZWN0aW9uU25hcHNob3QSFwoHcGVlcl9pZBgBIAEoCVIGcGVlcklkEiMKDWNvbm5lY3'
    'Rpb25faWQYAiABKAlSDGNvbm5lY3Rpb25JZBIcCglkaXJlY3Rpb24YAyABKAlSCWRpcmVjdGlv'
    'bhIfCgtyZW1vdGVfYWRkchgEIAEoCVIKcmVtb3RlQWRkchIZCghpc19yZWxheRgFIAEoCFIHaX'
    'NSZWxheRIeCgtsYXN0X3J0dF9tcxgGIAEoBFIJbGFzdFJ0dE1zEikKEWxhc3RfcGluZ191bml4'
    'X21zGAcgASgDUg5sYXN0UGluZ1VuaXhNcxIwChRhY3RpdmVfc3RyZWFtc190b3RhbBgIIAEoBF'
    'ISYWN0aXZlU3RyZWFtc1RvdGFsEmYKGmFjdGl2ZV9zdHJlYW1zX2J5X3Byb3RvY29sGAkgAygL'
    'MikuZnVuZ2lfZGFlbW9uLlByb3RvY29sU3RyZWFtQ291bnRTbmFwc2hvdFIXYWN0aXZlU3RyZW'
    'Ftc0J5UHJvdG9jb2wSIQoMcG9saWN5X3N0YXRlGAogASgJUgtwb2xpY3lTdGF0ZRIjCg1wb2xp'
    'Y3lfcmVhc29uGAsgASgJUgxwb2xpY3lSZWFzb24SHQoKcGVlcl9hbGlhcxgMIAEoCVIJcGVlck'
    'FsaWFzEhsKCXBlZXJfcm9sZRgNIAEoCVIIcGVlclJvbGU=');

@$core.Deprecated('Use protocolStreamCountSnapshotDescriptor instead')
const ProtocolStreamCountSnapshot$json = {
  '1': 'ProtocolStreamCountSnapshot',
  '2': [
    {'1': 'protocol_name', '3': 1, '4': 1, '5': 9, '10': 'protocolName'},
    {'1': 'stream_count', '3': 2, '4': 1, '5': 4, '10': 'streamCount'},
  ],
};

/// Descriptor for `ProtocolStreamCountSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List protocolStreamCountSnapshotDescriptor = $convert.base64Decode(
    'ChtQcm90b2NvbFN0cmVhbUNvdW50U25hcHNob3QSIwoNcHJvdG9jb2xfbmFtZRgBIAEoCVIMcH'
    'JvdG9jb2xOYW1lEiEKDHN0cmVhbV9jb3VudBgCIAEoBFILc3RyZWFtQ291bnQ=');

@$core.Deprecated('Use listConnectionsResponseDescriptor instead')
const ListConnectionsResponse$json = {
  '1': 'ListConnectionsResponse',
  '2': [
    {'1': 'connections', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.ConnectionSnapshot', '10': 'connections'},
  ],
};

/// Descriptor for `ListConnectionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listConnectionsResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0Q29ubmVjdGlvbnNSZXNwb25zZRJCCgtjb25uZWN0aW9ucxgBIAMoCzIgLmZ1bmdpX2'
    'RhZW1vbi5Db25uZWN0aW9uU25hcHNob3RSC2Nvbm5lY3Rpb25z');

@$core.Deprecated('Use listActiveStreamsRequestDescriptor instead')
const ListActiveStreamsRequest$json = {
  '1': 'ListActiveStreamsRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'protocol_name', '3': 2, '4': 1, '5': 9, '10': 'protocolName'},
  ],
};

/// Descriptor for `ListActiveStreamsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listActiveStreamsRequestDescriptor = $convert.base64Decode(
    'ChhMaXN0QWN0aXZlU3RyZWFtc1JlcXVlc3QSFwoHcGVlcl9pZBgBIAEoCVIGcGVlcklkEiMKDX'
    'Byb3RvY29sX25hbWUYAiABKAlSDHByb3RvY29sTmFtZQ==');

@$core.Deprecated('Use activeStreamSnapshotDescriptor instead')
const ActiveStreamSnapshot$json = {
  '1': 'ActiveStreamSnapshot',
  '2': [
    {'1': 'stream_id', '3': 1, '4': 1, '5': 4, '10': 'streamId'},
    {'1': 'peer_id', '3': 2, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'connection_id', '3': 3, '4': 1, '5': 9, '10': 'connectionId'},
    {'1': 'protocol_name', '3': 4, '4': 1, '5': 9, '10': 'protocolName'},
    {'1': 'opened_at_unix_ms', '3': 5, '4': 1, '5': 3, '10': 'openedAtUnixMs'},
  ],
};

/// Descriptor for `ActiveStreamSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List activeStreamSnapshotDescriptor = $convert.base64Decode(
    'ChRBY3RpdmVTdHJlYW1TbmFwc2hvdBIbCglzdHJlYW1faWQYASABKARSCHN0cmVhbUlkEhcKB3'
    'BlZXJfaWQYAiABKAlSBnBlZXJJZBIjCg1jb25uZWN0aW9uX2lkGAMgASgJUgxjb25uZWN0aW9u'
    'SWQSIwoNcHJvdG9jb2xfbmFtZRgEIAEoCVIMcHJvdG9jb2xOYW1lEikKEW9wZW5lZF9hdF91bm'
    'l4X21zGAUgASgDUg5vcGVuZWRBdFVuaXhNcw==');

@$core.Deprecated('Use listActiveStreamsResponseDescriptor instead')
const ListActiveStreamsResponse$json = {
  '1': 'ListActiveStreamsResponse',
  '2': [
    {'1': 'streams', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.ActiveStreamSnapshot', '10': 'streams'},
  ],
};

/// Descriptor for `ListActiveStreamsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listActiveStreamsResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0QWN0aXZlU3RyZWFtc1Jlc3BvbnNlEjwKB3N0cmVhbXMYASADKAsyIi5mdW5naV9kYW'
    'Vtb24uQWN0aXZlU3RyZWFtU25hcHNob3RSB3N0cmVhbXM=');

@$core.Deprecated('Use externalAddressSnapshotDescriptor instead')
const ExternalAddressSnapshot$json = {
  '1': 'ExternalAddressSnapshot',
  '2': [
    {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    {'1': 'transport', '3': 2, '4': 1, '5': 9, '10': 'transport'},
    {'1': 'freshness', '3': 3, '4': 1, '5': 9, '10': 'freshness'},
    {'1': 'recommend_refresh_before_dcutr', '3': 4, '4': 1, '5': 8, '10': 'recommendRefreshBeforeDcutr'},
    {'1': 'first_observed_at_unix_ms', '3': 5, '4': 1, '5': 3, '10': 'firstObservedAtUnixMs'},
    {'1': 'last_observed_at_unix_ms', '3': 6, '4': 1, '5': 3, '10': 'lastObservedAtUnixMs'},
    {'1': 'confirmed_at_unix_ms', '3': 7, '4': 1, '5': 3, '10': 'confirmedAtUnixMs'},
    {'1': 'expired_at_unix_ms', '3': 8, '4': 1, '5': 3, '10': 'expiredAtUnixMs'},
    {'1': 'observation_count', '3': 9, '4': 1, '5': 4, '10': 'observationCount'},
    {'1': 'sources', '3': 10, '4': 3, '5': 9, '10': 'sources'},
  ],
};

/// Descriptor for `ExternalAddressSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List externalAddressSnapshotDescriptor = $convert.base64Decode(
    'ChdFeHRlcm5hbEFkZHJlc3NTbmFwc2hvdBIYCgdhZGRyZXNzGAEgASgJUgdhZGRyZXNzEhwKCX'
    'RyYW5zcG9ydBgCIAEoCVIJdHJhbnNwb3J0EhwKCWZyZXNobmVzcxgDIAEoCVIJZnJlc2huZXNz'
    'EkMKHnJlY29tbWVuZF9yZWZyZXNoX2JlZm9yZV9kY3V0chgEIAEoCFIbcmVjb21tZW5kUmVmcm'
    'VzaEJlZm9yZURjdXRyEjgKGWZpcnN0X29ic2VydmVkX2F0X3VuaXhfbXMYBSABKANSFWZpcnN0'
    'T2JzZXJ2ZWRBdFVuaXhNcxI2ChhsYXN0X29ic2VydmVkX2F0X3VuaXhfbXMYBiABKANSFGxhc3'
    'RPYnNlcnZlZEF0VW5peE1zEi8KFGNvbmZpcm1lZF9hdF91bml4X21zGAcgASgDUhFjb25maXJt'
    'ZWRBdFVuaXhNcxIrChJleHBpcmVkX2F0X3VuaXhfbXMYCCABKANSD2V4cGlyZWRBdFVuaXhNcx'
    'IrChFvYnNlcnZhdGlvbl9jb3VudBgJIAEoBFIQb2JzZXJ2YXRpb25Db3VudBIYCgdzb3VyY2Vz'
    'GAogAygJUgdzb3VyY2Vz');

@$core.Deprecated('Use listExternalAddressCandidatesResponseDescriptor instead')
const ListExternalAddressCandidatesResponse$json = {
  '1': 'ListExternalAddressCandidatesResponse',
  '2': [
    {'1': 'candidates', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.ExternalAddressSnapshot', '10': 'candidates'},
  ],
};

/// Descriptor for `ListExternalAddressCandidatesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listExternalAddressCandidatesResponseDescriptor = $convert.base64Decode(
    'CiVMaXN0RXh0ZXJuYWxBZGRyZXNzQ2FuZGlkYXRlc1Jlc3BvbnNlEkUKCmNhbmRpZGF0ZXMYAS'
    'ADKAsyJS5mdW5naV9kYWVtb24uRXh0ZXJuYWxBZGRyZXNzU25hcHNob3RSCmNhbmRpZGF0ZXM=');

@$core.Deprecated('Use relayEndpointStatusSnapshotDescriptor instead')
const RelayEndpointStatusSnapshot$json = {
  '1': 'RelayEndpointStatusSnapshot',
  '2': [
    {'1': 'relay_addr', '3': 1, '4': 1, '5': 9, '10': 'relayAddr'},
    {'1': 'relay_peer_id', '3': 2, '4': 1, '5': 9, '10': 'relayPeerId'},
    {'1': 'transport', '3': 3, '4': 1, '5': 9, '10': 'transport'},
    {'1': 'listener_registered', '3': 4, '4': 1, '5': 8, '10': 'listenerRegistered'},
    {'1': 'task_running', '3': 5, '4': 1, '5': 8, '10': 'taskRunning'},
    {'1': 'current_direct_connection_id', '3': 6, '4': 1, '5': 9, '10': 'currentDirectConnectionId'},
    {'1': 'last_listener_seen_at_unix_ms', '3': 7, '4': 1, '5': 3, '10': 'lastListenerSeenAtUnixMs'},
    {'1': 'last_listener_missing_at_unix_ms', '3': 8, '4': 1, '5': 3, '10': 'lastListenerMissingAtUnixMs'},
    {'1': 'last_reservation_accepted_at_unix_ms', '3': 9, '4': 1, '5': 3, '10': 'lastReservationAcceptedAtUnixMs'},
    {'1': 'last_reservation_established_at_unix_ms', '3': 10, '4': 1, '5': 3, '10': 'lastReservationEstablishedAtUnixMs'},
    {'1': 'last_reservation_renewed_at_unix_ms', '3': 11, '4': 1, '5': 3, '10': 'lastReservationRenewedAtUnixMs'},
    {'1': 'last_direct_connection_closed_at_unix_ms', '3': 12, '4': 1, '5': 3, '10': 'lastDirectConnectionClosedAtUnixMs'},
    {'1': 'last_management_action', '3': 13, '4': 1, '5': 9, '10': 'lastManagementAction'},
    {'1': 'last_error', '3': 14, '4': 1, '5': 9, '10': 'lastError'},
  ],
};

/// Descriptor for `RelayEndpointStatusSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List relayEndpointStatusSnapshotDescriptor = $convert.base64Decode(
    'ChtSZWxheUVuZHBvaW50U3RhdHVzU25hcHNob3QSHQoKcmVsYXlfYWRkchgBIAEoCVIJcmVsYX'
    'lBZGRyEiIKDXJlbGF5X3BlZXJfaWQYAiABKAlSC3JlbGF5UGVlcklkEhwKCXRyYW5zcG9ydBgD'
    'IAEoCVIJdHJhbnNwb3J0Ei8KE2xpc3RlbmVyX3JlZ2lzdGVyZWQYBCABKAhSEmxpc3RlbmVyUm'
    'VnaXN0ZXJlZBIhCgx0YXNrX3J1bm5pbmcYBSABKAhSC3Rhc2tSdW5uaW5nEj8KHGN1cnJlbnRf'
    'ZGlyZWN0X2Nvbm5lY3Rpb25faWQYBiABKAlSGWN1cnJlbnREaXJlY3RDb25uZWN0aW9uSWQSPw'
    'odbGFzdF9saXN0ZW5lcl9zZWVuX2F0X3VuaXhfbXMYByABKANSGGxhc3RMaXN0ZW5lclNlZW5B'
    'dFVuaXhNcxJFCiBsYXN0X2xpc3RlbmVyX21pc3NpbmdfYXRfdW5peF9tcxgIIAEoA1IbbGFzdE'
    'xpc3RlbmVyTWlzc2luZ0F0VW5peE1zEk0KJGxhc3RfcmVzZXJ2YXRpb25fYWNjZXB0ZWRfYXRf'
    'dW5peF9tcxgJIAEoA1IfbGFzdFJlc2VydmF0aW9uQWNjZXB0ZWRBdFVuaXhNcxJTCidsYXN0X3'
    'Jlc2VydmF0aW9uX2VzdGFibGlzaGVkX2F0X3VuaXhfbXMYCiABKANSImxhc3RSZXNlcnZhdGlv'
    'bkVzdGFibGlzaGVkQXRVbml4TXMSSwojbGFzdF9yZXNlcnZhdGlvbl9yZW5ld2VkX2F0X3VuaX'
    'hfbXMYCyABKANSHmxhc3RSZXNlcnZhdGlvblJlbmV3ZWRBdFVuaXhNcxJUCihsYXN0X2RpcmVj'
    'dF9jb25uZWN0aW9uX2Nsb3NlZF9hdF91bml4X21zGAwgASgDUiJsYXN0RGlyZWN0Q29ubmVjdG'
    'lvbkNsb3NlZEF0VW5peE1zEjQKFmxhc3RfbWFuYWdlbWVudF9hY3Rpb24YDSABKAlSFGxhc3RN'
    'YW5hZ2VtZW50QWN0aW9uEh0KCmxhc3RfZXJyb3IYDiABKAlSCWxhc3RFcnJvcg==');

@$core.Deprecated('Use listRelayEndpointStatusesResponseDescriptor instead')
const ListRelayEndpointStatusesResponse$json = {
  '1': 'ListRelayEndpointStatusesResponse',
  '2': [
    {'1': 'statuses', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.RelayEndpointStatusSnapshot', '10': 'statuses'},
  ],
};

/// Descriptor for `ListRelayEndpointStatusesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRelayEndpointStatusesResponseDescriptor = $convert.base64Decode(
    'CiFMaXN0UmVsYXlFbmRwb2ludFN0YXR1c2VzUmVzcG9uc2USRQoIc3RhdHVzZXMYASADKAsyKS'
    '5mdW5naV9kYWVtb24uUmVsYXlFbmRwb2ludFN0YXR1c1NuYXBzaG90UghzdGF0dXNlcw==');

@$core.Deprecated('Use peerAddressSnapshotDescriptor instead')
const PeerAddressSnapshot$json = {
  '1': 'PeerAddressSnapshot',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'address', '3': 2, '4': 1, '5': 9, '10': 'address'},
    {'1': 'transport', '3': 3, '4': 1, '5': 9, '10': 'transport'},
    {'1': 'source', '3': 4, '4': 1, '5': 9, '10': 'source'},
    {'1': 'first_observed_at_unix_ms', '3': 5, '4': 1, '5': 3, '10': 'firstObservedAtUnixMs'},
    {'1': 'last_observed_at_unix_ms', '3': 6, '4': 1, '5': 3, '10': 'lastObservedAtUnixMs'},
    {'1': 'observation_count', '3': 7, '4': 1, '5': 4, '10': 'observationCount'},
    {'1': 'freshness', '3': 8, '4': 1, '5': 9, '10': 'freshness'},
    {'1': 'expired_at_unix_ms', '3': 9, '4': 1, '5': 3, '10': 'expiredAtUnixMs'},
  ],
};

/// Descriptor for `PeerAddressSnapshot`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List peerAddressSnapshotDescriptor = $convert.base64Decode(
    'ChNQZWVyQWRkcmVzc1NuYXBzaG90EhcKB3BlZXJfaWQYASABKAlSBnBlZXJJZBIYCgdhZGRyZX'
    'NzGAIgASgJUgdhZGRyZXNzEhwKCXRyYW5zcG9ydBgDIAEoCVIJdHJhbnNwb3J0EhYKBnNvdXJj'
    'ZRgEIAEoCVIGc291cmNlEjgKGWZpcnN0X29ic2VydmVkX2F0X3VuaXhfbXMYBSABKANSFWZpcn'
    'N0T2JzZXJ2ZWRBdFVuaXhNcxI2ChhsYXN0X29ic2VydmVkX2F0X3VuaXhfbXMYBiABKANSFGxh'
    'c3RPYnNlcnZlZEF0VW5peE1zEisKEW9ic2VydmF0aW9uX2NvdW50GAcgASgEUhBvYnNlcnZhdG'
    'lvbkNvdW50EhwKCWZyZXNobmVzcxgIIAEoCVIJZnJlc2huZXNzEisKEmV4cGlyZWRfYXRfdW5p'
    'eF9tcxgJIAEoA1IPZXhwaXJlZEF0VW5peE1z');

@$core.Deprecated('Use listPeerAddressesResponseDescriptor instead')
const ListPeerAddressesResponse$json = {
  '1': 'ListPeerAddressesResponse',
  '2': [
    {'1': 'addresses', '3': 1, '4': 3, '5': 11, '6': '.fungi_daemon.PeerAddressSnapshot', '10': 'addresses'},
  ],
};

/// Descriptor for `ListPeerAddressesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPeerAddressesResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0UGVlckFkZHJlc3Nlc1Jlc3BvbnNlEj8KCWFkZHJlc3NlcxgBIAMoCzIhLmZ1bmdpX2'
    'RhZW1vbi5QZWVyQWRkcmVzc1NuYXBzaG90UglhZGRyZXNzZXM=');

@$core.Deprecated('Use pullServiceRequestDescriptor instead')
const PullServiceRequest$json = {
  '1': 'PullServiceRequest',
  '2': [
    {'1': 'manifest_yaml', '3': 1, '4': 1, '5': 9, '10': 'manifestYaml'},
    {'1': 'manifest_base_dir', '3': 2, '4': 1, '5': 9, '10': 'manifestBaseDir'},
  ],
};

/// Descriptor for `PullServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pullServiceRequestDescriptor = $convert.base64Decode(
    'ChJQdWxsU2VydmljZVJlcXVlc3QSIwoNbWFuaWZlc3RfeWFtbBgBIAEoCVIMbWFuaWZlc3RZYW'
    '1sEioKEW1hbmlmZXN0X2Jhc2VfZGlyGAIgASgJUg9tYW5pZmVzdEJhc2VEaXI=');

@$core.Deprecated('Use serviceNameRequestDescriptor instead')
const ServiceNameRequest$json = {
  '1': 'ServiceNameRequest',
  '2': [
    {'1': 'runtime', '3': 1, '4': 1, '5': 14, '6': '.fungi_daemon.ServiceRuntimeKind', '10': 'runtime'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `ServiceNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceNameRequestDescriptor = $convert.base64Decode(
    'ChJTZXJ2aWNlTmFtZVJlcXVlc3QSOgoHcnVudGltZRgBIAEoDjIgLmZ1bmdpX2RhZW1vbi5TZX'
    'J2aWNlUnVudGltZUtpbmRSB3J1bnRpbWUSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');

@$core.Deprecated('Use getServiceLogsRequestDescriptor instead')
const GetServiceLogsRequest$json = {
  '1': 'GetServiceLogsRequest',
  '2': [
    {'1': 'runtime', '3': 1, '4': 1, '5': 14, '6': '.fungi_daemon.ServiceRuntimeKind', '10': 'runtime'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'tail', '3': 3, '4': 1, '5': 9, '10': 'tail'},
  ],
};

/// Descriptor for `GetServiceLogsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getServiceLogsRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTZXJ2aWNlTG9nc1JlcXVlc3QSOgoHcnVudGltZRgBIAEoDjIgLmZ1bmdpX2RhZW1vbi'
    '5TZXJ2aWNlUnVudGltZUtpbmRSB3J1bnRpbWUSEgoEbmFtZRgCIAEoCVIEbmFtZRISCgR0YWls'
    'GAMgASgJUgR0YWls');

@$core.Deprecated('Use serviceInstanceResponseDescriptor instead')
const ServiceInstanceResponse$json = {
  '1': 'ServiceInstanceResponse',
  '2': [
    {'1': 'instance_json', '3': 1, '4': 1, '5': 9, '10': 'instanceJson'},
  ],
};

/// Descriptor for `ServiceInstanceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceInstanceResponseDescriptor = $convert.base64Decode(
    'ChdTZXJ2aWNlSW5zdGFuY2VSZXNwb25zZRIjCg1pbnN0YW5jZV9qc29uGAEgASgJUgxpbnN0YW'
    '5jZUpzb24=');

@$core.Deprecated('Use serviceLogsResponseDescriptor instead')
const ServiceLogsResponse$json = {
  '1': 'ServiceLogsResponse',
  '2': [
    {'1': 'raw', '3': 1, '4': 1, '5': 12, '10': 'raw'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '10': 'text'},
  ],
};

/// Descriptor for `ServiceLogsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceLogsResponseDescriptor = $convert.base64Decode(
    'ChNTZXJ2aWNlTG9nc1Jlc3BvbnNlEhAKA3JhdxgBIAEoDFIDcmF3EhIKBHRleHQYAiABKAlSBH'
    'RleHQ=');

@$core.Deprecated('Use listServicesResponseDescriptor instead')
const ListServicesResponse$json = {
  '1': 'ListServicesResponse',
  '2': [
    {'1': 'services_json', '3': 1, '4': 1, '5': 9, '10': 'servicesJson'},
  ],
};

/// Descriptor for `ListServicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServicesResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0U2VydmljZXNSZXNwb25zZRIjCg1zZXJ2aWNlc19qc29uGAEgASgJUgxzZXJ2aWNlc0'
    'pzb24=');

@$core.Deprecated('Use listPeerCatalogRequestDescriptor instead')
const ListPeerCatalogRequest$json = {
  '1': 'ListPeerCatalogRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `ListPeerCatalogRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPeerCatalogRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0UGVlckNhdGFsb2dSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZXJJZA==');

@$core.Deprecated('Use listPeerCatalogResponseDescriptor instead')
const ListPeerCatalogResponse$json = {
  '1': 'ListPeerCatalogResponse',
  '2': [
    {'1': 'services_json', '3': 1, '4': 1, '5': 9, '10': 'servicesJson'},
  ],
};

/// Descriptor for `ListPeerCatalogResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPeerCatalogResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0UGVlckNhdGFsb2dSZXNwb25zZRIjCg1zZXJ2aWNlc19qc29uGAEgASgJUgxzZXJ2aW'
    'Nlc0pzb24=');

@$core.Deprecated('Use getPeerCapabilitySummaryRequestDescriptor instead')
const GetPeerCapabilitySummaryRequest$json = {
  '1': 'GetPeerCapabilitySummaryRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `GetPeerCapabilitySummaryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPeerCapabilitySummaryRequestDescriptor = $convert.base64Decode(
    'Ch9HZXRQZWVyQ2FwYWJpbGl0eVN1bW1hcnlSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZX'
    'JJZA==');

@$core.Deprecated('Use getPeerCapabilitySummaryResponseDescriptor instead')
const GetPeerCapabilitySummaryResponse$json = {
  '1': 'GetPeerCapabilitySummaryResponse',
  '2': [
    {'1': 'capability_summary_json', '3': 1, '4': 1, '5': 9, '10': 'capabilitySummaryJson'},
  ],
};

/// Descriptor for `GetPeerCapabilitySummaryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPeerCapabilitySummaryResponseDescriptor = $convert.base64Decode(
    'CiBHZXRQZWVyQ2FwYWJpbGl0eVN1bW1hcnlSZXNwb25zZRI2ChdjYXBhYmlsaXR5X3N1bW1hcn'
    'lfanNvbhgBIAEoCVIVY2FwYWJpbGl0eVN1bW1hcnlKc29u');

@$core.Deprecated('Use remotePullServiceRequestDescriptor instead')
const RemotePullServiceRequest$json = {
  '1': 'RemotePullServiceRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'manifest_yaml', '3': 2, '4': 1, '5': 9, '10': 'manifestYaml'},
  ],
};

/// Descriptor for `RemotePullServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePullServiceRequestDescriptor = $convert.base64Decode(
    'ChhSZW1vdGVQdWxsU2VydmljZVJlcXVlc3QSFwoHcGVlcl9pZBgBIAEoCVIGcGVlcklkEiMKDW'
    '1hbmlmZXN0X3lhbWwYAiABKAlSDG1hbmlmZXN0WWFtbA==');

@$core.Deprecated('Use remoteServiceNameRequestDescriptor instead')
const RemoteServiceNameRequest$json = {
  '1': 'RemoteServiceNameRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `RemoteServiceNameRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteServiceNameRequestDescriptor = $convert.base64Decode(
    'ChhSZW1vdGVTZXJ2aWNlTmFtZVJlcXVlc3QSFwoHcGVlcl9pZBgBIAEoCVIGcGVlcklkEhIKBG'
    '5hbWUYAiABKAlSBG5hbWU=');

@$core.Deprecated('Use remotePeerRequestDescriptor instead')
const RemotePeerRequest$json = {
  '1': 'RemotePeerRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `RemotePeerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remotePeerRequestDescriptor = $convert.base64Decode(
    'ChFSZW1vdGVQZWVyUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQ=');

@$core.Deprecated('Use remoteServiceControlResponseDescriptor instead')
const RemoteServiceControlResponse$json = {
  '1': 'RemoteServiceControlResponse',
  '2': [
    {'1': 'service_name', '3': 1, '4': 1, '5': 9, '10': 'serviceName'},
  ],
};

/// Descriptor for `RemoteServiceControlResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteServiceControlResponseDescriptor = $convert.base64Decode(
    'ChxSZW1vdGVTZXJ2aWNlQ29udHJvbFJlc3BvbnNlEiEKDHNlcnZpY2VfbmFtZRgBIAEoCVILc2'
    'VydmljZU5hbWU=');

@$core.Deprecated('Use attachServiceAccessRequestDescriptor instead')
const AttachServiceAccessRequest$json = {
  '1': 'AttachServiceAccessRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'service_id', '3': 2, '4': 1, '5': 9, '10': 'serviceId'},
  ],
};

/// Descriptor for `AttachServiceAccessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List attachServiceAccessRequestDescriptor = $convert.base64Decode(
    'ChpBdHRhY2hTZXJ2aWNlQWNjZXNzUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQSHQ'
    'oKc2VydmljZV9pZBgCIAEoCVIJc2VydmljZUlk');

@$core.Deprecated('Use detachServiceAccessRequestDescriptor instead')
const DetachServiceAccessRequest$json = {
  '1': 'DetachServiceAccessRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'service_id', '3': 2, '4': 1, '5': 9, '10': 'serviceId'},
  ],
};

/// Descriptor for `DetachServiceAccessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detachServiceAccessRequestDescriptor = $convert.base64Decode(
    'ChpEZXRhY2hTZXJ2aWNlQWNjZXNzUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQSHQ'
    'oKc2VydmljZV9pZBgCIAEoCVIJc2VydmljZUlk');

@$core.Deprecated('Use listServiceAccessesRequestDescriptor instead')
const ListServiceAccessesRequest$json = {
  '1': 'ListServiceAccessesRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `ListServiceAccessesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listServiceAccessesRequestDescriptor = $convert.base64Decode(
    'ChpMaXN0U2VydmljZUFjY2Vzc2VzUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQ=');

@$core.Deprecated('Use serviceAccessResponseDescriptor instead')
const ServiceAccessResponse$json = {
  '1': 'ServiceAccessResponse',
  '2': [
    {'1': 'service_access_json', '3': 1, '4': 1, '5': 9, '10': 'serviceAccessJson'},
  ],
};

/// Descriptor for `ServiceAccessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceAccessResponseDescriptor = $convert.base64Decode(
    'ChVTZXJ2aWNlQWNjZXNzUmVzcG9uc2USLgoTc2VydmljZV9hY2Nlc3NfanNvbhgBIAEoCVIRc2'
    'VydmljZUFjY2Vzc0pzb24=');

@$core.Deprecated('Use serviceAccessesResponseDescriptor instead')
const ServiceAccessesResponse$json = {
  '1': 'ServiceAccessesResponse',
  '2': [
    {'1': 'service_accesses_json', '3': 1, '4': 1, '5': 9, '10': 'serviceAccessesJson'},
  ],
};

/// Descriptor for `ServiceAccessesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serviceAccessesResponseDescriptor = $convert.base64Decode(
    'ChdTZXJ2aWNlQWNjZXNzZXNSZXNwb25zZRIyChVzZXJ2aWNlX2FjY2Vzc2VzX2pzb24YASABKA'
    'lSE3NlcnZpY2VBY2Nlc3Nlc0pzb24=');


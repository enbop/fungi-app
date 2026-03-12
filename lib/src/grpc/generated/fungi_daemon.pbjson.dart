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
  ],
};

/// Descriptor for `VersionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List versionResponseDescriptor = $convert.base64Decode(
    'Cg9WZXJzaW9uUmVzcG9uc2USGAoHdmVyc2lvbhgBIAEoCVIHdmVyc2lvbg==');

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
    'Ftc0J5UHJvdG9jb2w=');

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

@$core.Deprecated('Use deployServiceRequestDescriptor instead')
const DeployServiceRequest$json = {
  '1': 'DeployServiceRequest',
  '2': [
    {'1': 'manifest_yaml', '3': 1, '4': 1, '5': 9, '10': 'manifestYaml'},
    {'1': 'manifest_base_dir', '3': 2, '4': 1, '5': 9, '10': 'manifestBaseDir'},
  ],
};

/// Descriptor for `DeployServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deployServiceRequestDescriptor = $convert.base64Decode(
    'ChREZXBsb3lTZXJ2aWNlUmVxdWVzdBIjCg1tYW5pZmVzdF95YW1sGAEgASgJUgxtYW5pZmVzdF'
    'lhbWwSKgoRbWFuaWZlc3RfYmFzZV9kaXIYAiABKAlSD21hbmlmZXN0QmFzZURpcg==');

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

@$core.Deprecated('Use discoverPeerServicesRequestDescriptor instead')
const DiscoverPeerServicesRequest$json = {
  '1': 'DiscoverPeerServicesRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `DiscoverPeerServicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoverPeerServicesRequestDescriptor = $convert.base64Decode(
    'ChtEaXNjb3ZlclBlZXJTZXJ2aWNlc1JlcXVlc3QSFwoHcGVlcl9pZBgBIAEoCVIGcGVlcklk');

@$core.Deprecated('Use discoverPeerServicesResponseDescriptor instead')
const DiscoverPeerServicesResponse$json = {
  '1': 'DiscoverPeerServicesResponse',
  '2': [
    {'1': 'services_json', '3': 1, '4': 1, '5': 9, '10': 'servicesJson'},
  ],
};

/// Descriptor for `DiscoverPeerServicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoverPeerServicesResponseDescriptor = $convert.base64Decode(
    'ChxEaXNjb3ZlclBlZXJTZXJ2aWNlc1Jlc3BvbnNlEiMKDXNlcnZpY2VzX2pzb24YASABKAlSDH'
    'NlcnZpY2VzSnNvbg==');

@$core.Deprecated('Use discoverPeerCapabilitiesRequestDescriptor instead')
const DiscoverPeerCapabilitiesRequest$json = {
  '1': 'DiscoverPeerCapabilitiesRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `DiscoverPeerCapabilitiesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoverPeerCapabilitiesRequestDescriptor = $convert.base64Decode(
    'Ch9EaXNjb3ZlclBlZXJDYXBhYmlsaXRpZXNSZXF1ZXN0EhcKB3BlZXJfaWQYASABKAlSBnBlZX'
    'JJZA==');

@$core.Deprecated('Use discoverPeerCapabilitiesResponseDescriptor instead')
const DiscoverPeerCapabilitiesResponse$json = {
  '1': 'DiscoverPeerCapabilitiesResponse',
  '2': [
    {'1': 'capabilities_json', '3': 1, '4': 1, '5': 9, '10': 'capabilitiesJson'},
  ],
};

/// Descriptor for `DiscoverPeerCapabilitiesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List discoverPeerCapabilitiesResponseDescriptor = $convert.base64Decode(
    'CiBEaXNjb3ZlclBlZXJDYXBhYmlsaXRpZXNSZXNwb25zZRIrChFjYXBhYmlsaXRpZXNfanNvbh'
    'gBIAEoCVIQY2FwYWJpbGl0aWVzSnNvbg==');

@$core.Deprecated('Use remoteDeployServiceRequestDescriptor instead')
const RemoteDeployServiceRequest$json = {
  '1': 'RemoteDeployServiceRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'manifest_yaml', '3': 2, '4': 1, '5': 9, '10': 'manifestYaml'},
  ],
};

/// Descriptor for `RemoteDeployServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteDeployServiceRequestDescriptor = $convert.base64Decode(
    'ChpSZW1vdGVEZXBsb3lTZXJ2aWNlUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQSIw'
    'oNbWFuaWZlc3RfeWFtbBgCIAEoCVIMbWFuaWZlc3RZYW1s');

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

@$core.Deprecated('Use enableRemoteServiceRequestDescriptor instead')
const EnableRemoteServiceRequest$json = {
  '1': 'EnableRemoteServiceRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'service_id', '3': 2, '4': 1, '5': 9, '10': 'serviceId'},
  ],
};

/// Descriptor for `EnableRemoteServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enableRemoteServiceRequestDescriptor = $convert.base64Decode(
    'ChpFbmFibGVSZW1vdGVTZXJ2aWNlUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZWVySWQSHQ'
    'oKc2VydmljZV9pZBgCIAEoCVIJc2VydmljZUlk');

@$core.Deprecated('Use disableRemoteServiceRequestDescriptor instead')
const DisableRemoteServiceRequest$json = {
  '1': 'DisableRemoteServiceRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
    {'1': 'service_id', '3': 2, '4': 1, '5': 9, '10': 'serviceId'},
  ],
};

/// Descriptor for `DisableRemoteServiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List disableRemoteServiceRequestDescriptor = $convert.base64Decode(
    'ChtEaXNhYmxlUmVtb3RlU2VydmljZVJlcXVlc3QSFwoHcGVlcl9pZBgBIAEoCVIGcGVlcklkEh'
    '0KCnNlcnZpY2VfaWQYAiABKAlSCXNlcnZpY2VJZA==');

@$core.Deprecated('Use listEnabledRemoteServicesRequestDescriptor instead')
const ListEnabledRemoteServicesRequest$json = {
  '1': 'ListEnabledRemoteServicesRequest',
  '2': [
    {'1': 'peer_id', '3': 1, '4': 1, '5': 9, '10': 'peerId'},
  ],
};

/// Descriptor for `ListEnabledRemoteServicesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listEnabledRemoteServicesRequestDescriptor = $convert.base64Decode(
    'CiBMaXN0RW5hYmxlZFJlbW90ZVNlcnZpY2VzUmVxdWVzdBIXCgdwZWVyX2lkGAEgASgJUgZwZW'
    'VySWQ=');

@$core.Deprecated('Use enabledRemoteServiceResponseDescriptor instead')
const EnabledRemoteServiceResponse$json = {
  '1': 'EnabledRemoteServiceResponse',
  '2': [
    {'1': 'enabled_service_json', '3': 1, '4': 1, '5': 9, '10': 'enabledServiceJson'},
  ],
};

/// Descriptor for `EnabledRemoteServiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enabledRemoteServiceResponseDescriptor = $convert.base64Decode(
    'ChxFbmFibGVkUmVtb3RlU2VydmljZVJlc3BvbnNlEjAKFGVuYWJsZWRfc2VydmljZV9qc29uGA'
    'EgASgJUhJlbmFibGVkU2VydmljZUpzb24=');

@$core.Deprecated('Use enabledRemoteServicesResponseDescriptor instead')
const EnabledRemoteServicesResponse$json = {
  '1': 'EnabledRemoteServicesResponse',
  '2': [
    {'1': 'enabled_services_json', '3': 1, '4': 1, '5': 9, '10': 'enabledServicesJson'},
  ],
};

/// Descriptor for `EnabledRemoteServicesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List enabledRemoteServicesResponseDescriptor = $convert.base64Decode(
    'Ch1FbmFibGVkUmVtb3RlU2VydmljZXNSZXNwb25zZRIyChVlbmFibGVkX3NlcnZpY2VzX2pzb2'
    '4YASABKAlSE2VuYWJsZWRTZXJ2aWNlc0pzb24=');


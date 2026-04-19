//
//  Generated code. Do not modify.
//  source: fungi_daemon.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'fungi_daemon.pb.dart' as $0;

export 'fungi_daemon.pb.dart';

@$pb.GrpcServiceName('fungi_daemon.FungiDaemon')
class FungiDaemonClient extends $grpc.Client {
  static final _$version = $grpc.ClientMethod<$0.Empty, $0.VersionResponse>(
      '/fungi_daemon.FungiDaemon/Version',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VersionResponse.fromBuffer(value));
  static final _$peerId = $grpc.ClientMethod<$0.Empty, $0.PeerIdResponse>(
      '/fungi_daemon.FungiDaemon/PeerId',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PeerIdResponse.fromBuffer(value));
  static final _$configFilePath = $grpc.ClientMethod<$0.Empty, $0.ConfigFilePathResponse>(
      '/fungi_daemon.FungiDaemon/ConfigFilePath',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ConfigFilePathResponse.fromBuffer(value));
  static final _$hostname = $grpc.ClientMethod<$0.Empty, $0.HostnameResponse>(
      '/fungi_daemon.FungiDaemon/Hostname',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HostnameResponse.fromBuffer(value));
  static final _$getIncomingAllowedPeers = $grpc.ClientMethod<$0.Empty, $0.IncomingAllowedPeersListResponse>(
      '/fungi_daemon.FungiDaemon/GetIncomingAllowedPeers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.IncomingAllowedPeersListResponse.fromBuffer(value));
  static final _$addIncomingAllowedPeer = $grpc.ClientMethod<$0.AddIncomingAllowedPeerRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/AddIncomingAllowedPeer',
      ($0.AddIncomingAllowedPeerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeIncomingAllowedPeer = $grpc.ClientMethod<$0.RemoveIncomingAllowedPeerRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveIncomingAllowedPeer',
      ($0.RemoveIncomingAllowedPeerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getRelayConfig = $grpc.ClientMethod<$0.Empty, $0.RelayConfigResponse>(
      '/fungi_daemon.FungiDaemon/GetRelayConfig',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RelayConfigResponse.fromBuffer(value));
  static final _$setRelayEnabled = $grpc.ClientMethod<$0.RelayEnabledRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/SetRelayEnabled',
      ($0.RelayEnabledRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$setUseCommunityRelays = $grpc.ClientMethod<$0.UseCommunityRelaysRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/SetUseCommunityRelays',
      ($0.UseCommunityRelaysRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$addCustomRelayAddress = $grpc.ClientMethod<$0.RelayAddressRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/AddCustomRelayAddress',
      ($0.RelayAddressRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeCustomRelayAddress = $grpc.ClientMethod<$0.RelayAddressRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveCustomRelayAddress',
      ($0.RelayAddressRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getRuntimeConfig = $grpc.ClientMethod<$0.Empty, $0.RuntimeConfigResponse>(
      '/fungi_daemon.FungiDaemon/GetRuntimeConfig',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RuntimeConfigResponse.fromBuffer(value));
  static final _$getLocalRuntimeStatus = $grpc.ClientMethod<$0.Empty, $0.LocalRuntimeStatusResponse>(
      '/fungi_daemon.FungiDaemon/GetLocalRuntimeStatus',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LocalRuntimeStatusResponse.fromBuffer(value));
  static final _$addRuntimeAllowedHostPath = $grpc.ClientMethod<$0.RuntimeAllowedHostPathRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/AddRuntimeAllowedHostPath',
      ($0.RuntimeAllowedHostPathRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeRuntimeAllowedHostPath = $grpc.ClientMethod<$0.RuntimeAllowedHostPathRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveRuntimeAllowedHostPath',
      ($0.RuntimeAllowedHostPathRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$addRuntimeAllowedPort = $grpc.ClientMethod<$0.RuntimeAllowedPortRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/AddRuntimeAllowedPort',
      ($0.RuntimeAllowedPortRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeRuntimeAllowedPort = $grpc.ClientMethod<$0.RuntimeAllowedPortRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveRuntimeAllowedPort',
      ($0.RuntimeAllowedPortRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$addRuntimeAllowedPortRange = $grpc.ClientMethod<$0.RuntimeAllowedPortRangeRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/AddRuntimeAllowedPortRange',
      ($0.RuntimeAllowedPortRangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeRuntimeAllowedPortRange = $grpc.ClientMethod<$0.RuntimeAllowedPortRangeRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveRuntimeAllowedPortRange',
      ($0.RuntimeAllowedPortRangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getFileTransferServiceEnabled = $grpc.ClientMethod<$0.Empty, $0.FileTransferServiceEnabledResponse>(
      '/fungi_daemon.FungiDaemon/GetFileTransferServiceEnabled',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileTransferServiceEnabledResponse.fromBuffer(value));
  static final _$getFileTransferServiceRootDir = $grpc.ClientMethod<$0.Empty, $0.FileTransferServiceRootDirResponse>(
      '/fungi_daemon.FungiDaemon/GetFileTransferServiceRootDir',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileTransferServiceRootDirResponse.fromBuffer(value));
  static final _$startFileTransferService = $grpc.ClientMethod<$0.StartFileTransferServiceRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/StartFileTransferService',
      ($0.StartFileTransferServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$stopFileTransferService = $grpc.ClientMethod<$0.Empty, $0.Empty>(
      '/fungi_daemon.FungiDaemon/StopFileTransferService',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$addFileTransferClient = $grpc.ClientMethod<$0.AddFileTransferClientRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/AddFileTransferClient',
      ($0.AddFileTransferClientRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeFileTransferClient = $grpc.ClientMethod<$0.RemoveFileTransferClientRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveFileTransferClient',
      ($0.RemoveFileTransferClientRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$enableFileTransferClient = $grpc.ClientMethod<$0.EnableFileTransferClientRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/EnableFileTransferClient',
      ($0.EnableFileTransferClientRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getAllFileTransferClients = $grpc.ClientMethod<$0.Empty, $0.FileTransferClientsResponse>(
      '/fungi_daemon.FungiDaemon/GetAllFileTransferClients',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FileTransferClientsResponse.fromBuffer(value));
  static final _$getFtpProxy = $grpc.ClientMethod<$0.Empty, $0.FtpProxyResponse>(
      '/fungi_daemon.FungiDaemon/GetFtpProxy',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FtpProxyResponse.fromBuffer(value));
  static final _$updateFtpProxy = $grpc.ClientMethod<$0.UpdateFtpProxyRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/UpdateFtpProxy',
      ($0.UpdateFtpProxyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getWebdavProxy = $grpc.ClientMethod<$0.Empty, $0.WebdavProxyResponse>(
      '/fungi_daemon.FungiDaemon/GetWebdavProxy',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WebdavProxyResponse.fromBuffer(value));
  static final _$updateWebdavProxy = $grpc.ClientMethod<$0.UpdateWebdavProxyRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/UpdateWebdavProxy',
      ($0.UpdateWebdavProxyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getTcpTunnelingConfig = $grpc.ClientMethod<$0.Empty, $0.TcpTunnelingConfigResponse>(
      '/fungi_daemon.FungiDaemon/GetTcpTunnelingConfig',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TcpTunnelingConfigResponse.fromBuffer(value));
  static final _$addTcpForwardingRule = $grpc.ClientMethod<$0.AddTcpForwardingRuleRequest, $0.TcpForwardingRuleResponse>(
      '/fungi_daemon.FungiDaemon/AddTcpForwardingRule',
      ($0.AddTcpForwardingRuleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TcpForwardingRuleResponse.fromBuffer(value));
  static final _$removeTcpForwardingRule = $grpc.ClientMethod<$0.RemoveTcpForwardingRuleRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveTcpForwardingRule',
      ($0.RemoveTcpForwardingRuleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$addTcpListeningRule = $grpc.ClientMethod<$0.AddTcpListeningRuleRequest, $0.TcpListeningRuleResponse>(
      '/fungi_daemon.FungiDaemon/AddTcpListeningRule',
      ($0.AddTcpListeningRuleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TcpListeningRuleResponse.fromBuffer(value));
  static final _$removeTcpListeningRule = $grpc.ClientMethod<$0.RemoveTcpListeningRuleRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveTcpListeningRule',
      ($0.RemoveTcpListeningRuleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listMdnsDevices = $grpc.ClientMethod<$0.Empty, $0.PeerInfoListResponse>(
      '/fungi_daemon.FungiDaemon/ListMdnsDevices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PeerInfoListResponse.fromBuffer(value));
  static final _$listAddressBookPeers = $grpc.ClientMethod<$0.Empty, $0.PeerInfoListResponse>(
      '/fungi_daemon.FungiDaemon/ListAddressBookPeers',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PeerInfoListResponse.fromBuffer(value));
  static final _$updateAddressBookPeer = $grpc.ClientMethod<$0.UpdateAddressBookPeerRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/UpdateAddressBookPeer',
      ($0.UpdateAddressBookPeerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getAddressBookPeer = $grpc.ClientMethod<$0.GetAddressBookPeerRequest, $0.PeerInfoResponse>(
      '/fungi_daemon.FungiDaemon/GetAddressBookPeer',
      ($0.GetAddressBookPeerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PeerInfoResponse.fromBuffer(value));
  static final _$removeAddressBookPeer = $grpc.ClientMethod<$0.RemoveAddressBookPeerRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveAddressBookPeer',
      ($0.RemoveAddressBookPeerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$pingPeer = $grpc.ClientMethod<$0.PingPeerRequest, $0.PingPeerEvent>(
      '/fungi_daemon.FungiDaemon/PingPeer',
      ($0.PingPeerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PingPeerEvent.fromBuffer(value));
  static final _$listConnections = $grpc.ClientMethod<$0.ListConnectionsRequest, $0.ListConnectionsResponse>(
      '/fungi_daemon.FungiDaemon/ListConnections',
      ($0.ListConnectionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListConnectionsResponse.fromBuffer(value));
  static final _$listActiveStreams = $grpc.ClientMethod<$0.ListActiveStreamsRequest, $0.ListActiveStreamsResponse>(
      '/fungi_daemon.FungiDaemon/ListActiveStreams',
      ($0.ListActiveStreamsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListActiveStreamsResponse.fromBuffer(value));
  static final _$listExternalAddressCandidates = $grpc.ClientMethod<$0.Empty, $0.ListExternalAddressCandidatesResponse>(
      '/fungi_daemon.FungiDaemon/ListExternalAddressCandidates',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListExternalAddressCandidatesResponse.fromBuffer(value));
  static final _$listRelayEndpointStatuses = $grpc.ClientMethod<$0.Empty, $0.ListRelayEndpointStatusesResponse>(
      '/fungi_daemon.FungiDaemon/ListRelayEndpointStatuses',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListRelayEndpointStatusesResponse.fromBuffer(value));
  static final _$listPeerAddresses = $grpc.ClientMethod<$0.Empty, $0.ListPeerAddressesResponse>(
      '/fungi_daemon.FungiDaemon/ListPeerAddresses',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListPeerAddressesResponse.fromBuffer(value));
  static final _$pullService = $grpc.ClientMethod<$0.PullServiceRequest, $0.ServiceInstanceResponse>(
      '/fungi_daemon.FungiDaemon/PullService',
      ($0.PullServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServiceInstanceResponse.fromBuffer(value));
  static final _$startService = $grpc.ClientMethod<$0.ServiceNameRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/StartService',
      ($0.ServiceNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$stopService = $grpc.ClientMethod<$0.ServiceNameRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/StopService',
      ($0.ServiceNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$removeService = $grpc.ClientMethod<$0.ServiceNameRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveService',
      ($0.ServiceNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$inspectService = $grpc.ClientMethod<$0.ServiceNameRequest, $0.ServiceInstanceResponse>(
      '/fungi_daemon.FungiDaemon/InspectService',
      ($0.ServiceNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServiceInstanceResponse.fromBuffer(value));
  static final _$getServiceLogs = $grpc.ClientMethod<$0.GetServiceLogsRequest, $0.ServiceLogsResponse>(
      '/fungi_daemon.FungiDaemon/GetServiceLogs',
      ($0.GetServiceLogsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServiceLogsResponse.fromBuffer(value));
  static final _$listServices = $grpc.ClientMethod<$0.Empty, $0.ListServicesResponse>(
      '/fungi_daemon.FungiDaemon/ListServices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListServicesResponse.fromBuffer(value));
  static final _$listPeerCatalog = $grpc.ClientMethod<$0.ListPeerCatalogRequest, $0.ListPeerCatalogResponse>(
      '/fungi_daemon.FungiDaemon/ListPeerCatalog',
      ($0.ListPeerCatalogRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListPeerCatalogResponse.fromBuffer(value));
  static final _$getPeerCapabilitySummary = $grpc.ClientMethod<$0.GetPeerCapabilitySummaryRequest, $0.GetPeerCapabilitySummaryResponse>(
      '/fungi_daemon.FungiDaemon/GetPeerCapabilitySummary',
      ($0.GetPeerCapabilitySummaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPeerCapabilitySummaryResponse.fromBuffer(value));
  static final _$remotePullService = $grpc.ClientMethod<$0.RemotePullServiceRequest, $0.RemoteServiceControlResponse>(
      '/fungi_daemon.FungiDaemon/RemotePullService',
      ($0.RemotePullServiceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoteServiceControlResponse.fromBuffer(value));
  static final _$remoteStartService = $grpc.ClientMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
      '/fungi_daemon.FungiDaemon/RemoteStartService',
      ($0.RemoteServiceNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoteServiceControlResponse.fromBuffer(value));
  static final _$remoteStopService = $grpc.ClientMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
      '/fungi_daemon.FungiDaemon/RemoteStopService',
      ($0.RemoteServiceNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoteServiceControlResponse.fromBuffer(value));
  static final _$remoteRemoveService = $grpc.ClientMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
      '/fungi_daemon.FungiDaemon/RemoteRemoveService',
      ($0.RemoteServiceNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.RemoteServiceControlResponse.fromBuffer(value));
  static final _$remoteListServices = $grpc.ClientMethod<$0.RemotePeerRequest, $0.ListServicesResponse>(
      '/fungi_daemon.FungiDaemon/RemoteListServices',
      ($0.RemotePeerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListServicesResponse.fromBuffer(value));
  static final _$attachServiceAccess = $grpc.ClientMethod<$0.AttachServiceAccessRequest, $0.ServiceAccessResponse>(
      '/fungi_daemon.FungiDaemon/AttachServiceAccess',
      ($0.AttachServiceAccessRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServiceAccessResponse.fromBuffer(value));
  static final _$detachServiceAccess = $grpc.ClientMethod<$0.DetachServiceAccessRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/DetachServiceAccess',
      ($0.DetachServiceAccessRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$listServiceAccesses = $grpc.ClientMethod<$0.ListServiceAccessesRequest, $0.ServiceAccessesResponse>(
      '/fungi_daemon.FungiDaemon/ListServiceAccesses',
      ($0.ListServiceAccessesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServiceAccessesResponse.fromBuffer(value));

  FungiDaemonClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.VersionResponse> version($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$version, request, options: options);
  }

  $grpc.ResponseFuture<$0.PeerIdResponse> peerId($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$peerId, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConfigFilePathResponse> configFilePath($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$configFilePath, request, options: options);
  }

  $grpc.ResponseFuture<$0.HostnameResponse> hostname($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$hostname, request, options: options);
  }

  $grpc.ResponseFuture<$0.IncomingAllowedPeersListResponse> getIncomingAllowedPeers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getIncomingAllowedPeers, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addIncomingAllowedPeer($0.AddIncomingAllowedPeerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addIncomingAllowedPeer, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeIncomingAllowedPeer($0.RemoveIncomingAllowedPeerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeIncomingAllowedPeer, request, options: options);
  }

  $grpc.ResponseFuture<$0.RelayConfigResponse> getRelayConfig($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRelayConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> setRelayEnabled($0.RelayEnabledRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setRelayEnabled, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> setUseCommunityRelays($0.UseCommunityRelaysRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setUseCommunityRelays, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addCustomRelayAddress($0.RelayAddressRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addCustomRelayAddress, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeCustomRelayAddress($0.RelayAddressRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeCustomRelayAddress, request, options: options);
  }

  $grpc.ResponseFuture<$0.RuntimeConfigResponse> getRuntimeConfig($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRuntimeConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.LocalRuntimeStatusResponse> getLocalRuntimeStatus($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLocalRuntimeStatus, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addRuntimeAllowedHostPath($0.RuntimeAllowedHostPathRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addRuntimeAllowedHostPath, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeRuntimeAllowedHostPath($0.RuntimeAllowedHostPathRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeRuntimeAllowedHostPath, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addRuntimeAllowedPort($0.RuntimeAllowedPortRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addRuntimeAllowedPort, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeRuntimeAllowedPort($0.RuntimeAllowedPortRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeRuntimeAllowedPort, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addRuntimeAllowedPortRange($0.RuntimeAllowedPortRangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addRuntimeAllowedPortRange, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeRuntimeAllowedPortRange($0.RuntimeAllowedPortRangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeRuntimeAllowedPortRange, request, options: options);
  }

  $grpc.ResponseFuture<$0.FileTransferServiceEnabledResponse> getFileTransferServiceEnabled($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFileTransferServiceEnabled, request, options: options);
  }

  $grpc.ResponseFuture<$0.FileTransferServiceRootDirResponse> getFileTransferServiceRootDir($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFileTransferServiceRootDir, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> startFileTransferService($0.StartFileTransferServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startFileTransferService, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> stopFileTransferService($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$stopFileTransferService, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> addFileTransferClient($0.AddFileTransferClientRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addFileTransferClient, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeFileTransferClient($0.RemoveFileTransferClientRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeFileTransferClient, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> enableFileTransferClient($0.EnableFileTransferClientRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$enableFileTransferClient, request, options: options);
  }

  $grpc.ResponseFuture<$0.FileTransferClientsResponse> getAllFileTransferClients($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAllFileTransferClients, request, options: options);
  }

  $grpc.ResponseFuture<$0.FtpProxyResponse> getFtpProxy($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFtpProxy, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateFtpProxy($0.UpdateFtpProxyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateFtpProxy, request, options: options);
  }

  $grpc.ResponseFuture<$0.WebdavProxyResponse> getWebdavProxy($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getWebdavProxy, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateWebdavProxy($0.UpdateWebdavProxyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateWebdavProxy, request, options: options);
  }

  $grpc.ResponseFuture<$0.TcpTunnelingConfigResponse> getTcpTunnelingConfig($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTcpTunnelingConfig, request, options: options);
  }

  $grpc.ResponseFuture<$0.TcpForwardingRuleResponse> addTcpForwardingRule($0.AddTcpForwardingRuleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTcpForwardingRule, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeTcpForwardingRule($0.RemoveTcpForwardingRuleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTcpForwardingRule, request, options: options);
  }

  $grpc.ResponseFuture<$0.TcpListeningRuleResponse> addTcpListeningRule($0.AddTcpListeningRuleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTcpListeningRule, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeTcpListeningRule($0.RemoveTcpListeningRuleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTcpListeningRule, request, options: options);
  }

  $grpc.ResponseFuture<$0.PeerInfoListResponse> listMdnsDevices($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listMdnsDevices, request, options: options);
  }

  $grpc.ResponseFuture<$0.PeerInfoListResponse> listAddressBookPeers($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listAddressBookPeers, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateAddressBookPeer($0.UpdateAddressBookPeerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAddressBookPeer, request, options: options);
  }

  $grpc.ResponseFuture<$0.PeerInfoResponse> getAddressBookPeer($0.GetAddressBookPeerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAddressBookPeer, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeAddressBookPeer($0.RemoveAddressBookPeerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeAddressBookPeer, request, options: options);
  }

  $grpc.ResponseStream<$0.PingPeerEvent> pingPeer($0.PingPeerRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$pingPeer, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.ListConnectionsResponse> listConnections($0.ListConnectionsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listConnections, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListActiveStreamsResponse> listActiveStreams($0.ListActiveStreamsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listActiveStreams, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListExternalAddressCandidatesResponse> listExternalAddressCandidates($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listExternalAddressCandidates, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListRelayEndpointStatusesResponse> listRelayEndpointStatuses($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRelayEndpointStatuses, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListPeerAddressesResponse> listPeerAddresses($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPeerAddresses, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceInstanceResponse> pullService($0.PullServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$pullService, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> startService($0.ServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$startService, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> stopService($0.ServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$stopService, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeService($0.ServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeService, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceInstanceResponse> inspectService($0.ServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$inspectService, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceLogsResponse> getServiceLogs($0.GetServiceLogsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getServiceLogs, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListServicesResponse> listServices($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServices, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListPeerCatalogResponse> listPeerCatalog($0.ListPeerCatalogRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listPeerCatalog, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPeerCapabilitySummaryResponse> getPeerCapabilitySummary($0.GetPeerCapabilitySummaryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPeerCapabilitySummary, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoteServiceControlResponse> remotePullService($0.RemotePullServiceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$remotePullService, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoteServiceControlResponse> remoteStartService($0.RemoteServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$remoteStartService, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoteServiceControlResponse> remoteStopService($0.RemoteServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$remoteStopService, request, options: options);
  }

  $grpc.ResponseFuture<$0.RemoteServiceControlResponse> remoteRemoveService($0.RemoteServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$remoteRemoveService, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListServicesResponse> remoteListServices($0.RemotePeerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$remoteListServices, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceAccessResponse> attachServiceAccess($0.AttachServiceAccessRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$attachServiceAccess, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> detachServiceAccess($0.DetachServiceAccessRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$detachServiceAccess, request, options: options);
  }

  $grpc.ResponseFuture<$0.ServiceAccessesResponse> listServiceAccesses($0.ListServiceAccessesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listServiceAccesses, request, options: options);
  }
}

@$pb.GrpcServiceName('fungi_daemon.FungiDaemon')
abstract class FungiDaemonServiceBase extends $grpc.Service {
  $core.String get $name => 'fungi_daemon.FungiDaemon';

  FungiDaemonServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.VersionResponse>(
        'Version',
        version_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.VersionResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.PeerIdResponse>(
        'PeerId',
        peerId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.PeerIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ConfigFilePathResponse>(
        'ConfigFilePath',
        configFilePath_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ConfigFilePathResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.HostnameResponse>(
        'Hostname',
        hostname_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.HostnameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.IncomingAllowedPeersListResponse>(
        'GetIncomingAllowedPeers',
        getIncomingAllowedPeers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.IncomingAllowedPeersListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddIncomingAllowedPeerRequest, $0.Empty>(
        'AddIncomingAllowedPeer',
        addIncomingAllowedPeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddIncomingAllowedPeerRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveIncomingAllowedPeerRequest, $0.Empty>(
        'RemoveIncomingAllowedPeer',
        removeIncomingAllowedPeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveIncomingAllowedPeerRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.RelayConfigResponse>(
        'GetRelayConfig',
        getRelayConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.RelayConfigResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RelayEnabledRequest, $0.Empty>(
        'SetRelayEnabled',
        setRelayEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RelayEnabledRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UseCommunityRelaysRequest, $0.Empty>(
        'SetUseCommunityRelays',
        setUseCommunityRelays_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UseCommunityRelaysRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RelayAddressRequest, $0.Empty>(
        'AddCustomRelayAddress',
        addCustomRelayAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RelayAddressRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RelayAddressRequest, $0.Empty>(
        'RemoveCustomRelayAddress',
        removeCustomRelayAddress_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RelayAddressRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.RuntimeConfigResponse>(
        'GetRuntimeConfig',
        getRuntimeConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.RuntimeConfigResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.LocalRuntimeStatusResponse>(
        'GetLocalRuntimeStatus',
        getLocalRuntimeStatus_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.LocalRuntimeStatusResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RuntimeAllowedHostPathRequest, $0.Empty>(
        'AddRuntimeAllowedHostPath',
        addRuntimeAllowedHostPath_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RuntimeAllowedHostPathRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RuntimeAllowedHostPathRequest, $0.Empty>(
        'RemoveRuntimeAllowedHostPath',
        removeRuntimeAllowedHostPath_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RuntimeAllowedHostPathRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RuntimeAllowedPortRequest, $0.Empty>(
        'AddRuntimeAllowedPort',
        addRuntimeAllowedPort_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RuntimeAllowedPortRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RuntimeAllowedPortRequest, $0.Empty>(
        'RemoveRuntimeAllowedPort',
        removeRuntimeAllowedPort_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RuntimeAllowedPortRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RuntimeAllowedPortRangeRequest, $0.Empty>(
        'AddRuntimeAllowedPortRange',
        addRuntimeAllowedPortRange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RuntimeAllowedPortRangeRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RuntimeAllowedPortRangeRequest, $0.Empty>(
        'RemoveRuntimeAllowedPortRange',
        removeRuntimeAllowedPortRange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RuntimeAllowedPortRangeRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.FileTransferServiceEnabledResponse>(
        'GetFileTransferServiceEnabled',
        getFileTransferServiceEnabled_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.FileTransferServiceEnabledResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.FileTransferServiceRootDirResponse>(
        'GetFileTransferServiceRootDir',
        getFileTransferServiceRootDir_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.FileTransferServiceRootDirResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.StartFileTransferServiceRequest, $0.Empty>(
        'StartFileTransferService',
        startFileTransferService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.StartFileTransferServiceRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Empty>(
        'StopFileTransferService',
        stopFileTransferService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddFileTransferClientRequest, $0.Empty>(
        'AddFileTransferClient',
        addFileTransferClient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddFileTransferClientRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveFileTransferClientRequest, $0.Empty>(
        'RemoveFileTransferClient',
        removeFileTransferClient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveFileTransferClientRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.EnableFileTransferClientRequest, $0.Empty>(
        'EnableFileTransferClient',
        enableFileTransferClient_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.EnableFileTransferClientRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.FileTransferClientsResponse>(
        'GetAllFileTransferClients',
        getAllFileTransferClients_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.FileTransferClientsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.FtpProxyResponse>(
        'GetFtpProxy',
        getFtpProxy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.FtpProxyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateFtpProxyRequest, $0.Empty>(
        'UpdateFtpProxy',
        updateFtpProxy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateFtpProxyRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.WebdavProxyResponse>(
        'GetWebdavProxy',
        getWebdavProxy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.WebdavProxyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateWebdavProxyRequest, $0.Empty>(
        'UpdateWebdavProxy',
        updateWebdavProxy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateWebdavProxyRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TcpTunnelingConfigResponse>(
        'GetTcpTunnelingConfig',
        getTcpTunnelingConfig_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TcpTunnelingConfigResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddTcpForwardingRuleRequest, $0.TcpForwardingRuleResponse>(
        'AddTcpForwardingRule',
        addTcpForwardingRule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTcpForwardingRuleRequest.fromBuffer(value),
        ($0.TcpForwardingRuleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveTcpForwardingRuleRequest, $0.Empty>(
        'RemoveTcpForwardingRule',
        removeTcpForwardingRule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveTcpForwardingRuleRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddTcpListeningRuleRequest, $0.TcpListeningRuleResponse>(
        'AddTcpListeningRule',
        addTcpListeningRule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddTcpListeningRuleRequest.fromBuffer(value),
        ($0.TcpListeningRuleResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveTcpListeningRuleRequest, $0.Empty>(
        'RemoveTcpListeningRule',
        removeTcpListeningRule_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveTcpListeningRuleRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.PeerInfoListResponse>(
        'ListMdnsDevices',
        listMdnsDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.PeerInfoListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.PeerInfoListResponse>(
        'ListAddressBookPeers',
        listAddressBookPeers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.PeerInfoListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateAddressBookPeerRequest, $0.Empty>(
        'UpdateAddressBookPeer',
        updateAddressBookPeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateAddressBookPeerRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetAddressBookPeerRequest, $0.PeerInfoResponse>(
        'GetAddressBookPeer',
        getAddressBookPeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetAddressBookPeerRequest.fromBuffer(value),
        ($0.PeerInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveAddressBookPeerRequest, $0.Empty>(
        'RemoveAddressBookPeer',
        removeAddressBookPeer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveAddressBookPeerRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PingPeerRequest, $0.PingPeerEvent>(
        'PingPeer',
        pingPeer_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.PingPeerRequest.fromBuffer(value),
        ($0.PingPeerEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListConnectionsRequest, $0.ListConnectionsResponse>(
        'ListConnections',
        listConnections_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListConnectionsRequest.fromBuffer(value),
        ($0.ListConnectionsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListActiveStreamsRequest, $0.ListActiveStreamsResponse>(
        'ListActiveStreams',
        listActiveStreams_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListActiveStreamsRequest.fromBuffer(value),
        ($0.ListActiveStreamsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ListExternalAddressCandidatesResponse>(
        'ListExternalAddressCandidates',
        listExternalAddressCandidates_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ListExternalAddressCandidatesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ListRelayEndpointStatusesResponse>(
        'ListRelayEndpointStatuses',
        listRelayEndpointStatuses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ListRelayEndpointStatusesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ListPeerAddressesResponse>(
        'ListPeerAddresses',
        listPeerAddresses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ListPeerAddressesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PullServiceRequest, $0.ServiceInstanceResponse>(
        'PullService',
        pullService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PullServiceRequest.fromBuffer(value),
        ($0.ServiceInstanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceNameRequest, $0.Empty>(
        'StartService',
        startService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ServiceNameRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceNameRequest, $0.Empty>(
        'StopService',
        stopService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ServiceNameRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceNameRequest, $0.Empty>(
        'RemoveService',
        removeService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ServiceNameRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServiceNameRequest, $0.ServiceInstanceResponse>(
        'InspectService',
        inspectService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ServiceNameRequest.fromBuffer(value),
        ($0.ServiceInstanceResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetServiceLogsRequest, $0.ServiceLogsResponse>(
        'GetServiceLogs',
        getServiceLogs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetServiceLogsRequest.fromBuffer(value),
        ($0.ServiceLogsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ListServicesResponse>(
        'ListServices',
        listServices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ListServicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListPeerCatalogRequest, $0.ListPeerCatalogResponse>(
        'ListPeerCatalog',
        listPeerCatalog_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListPeerCatalogRequest.fromBuffer(value),
        ($0.ListPeerCatalogResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPeerCapabilitySummaryRequest, $0.GetPeerCapabilitySummaryResponse>(
        'GetPeerCapabilitySummary',
        getPeerCapabilitySummary_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPeerCapabilitySummaryRequest.fromBuffer(value),
        ($0.GetPeerCapabilitySummaryResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemotePullServiceRequest, $0.RemoteServiceControlResponse>(
        'RemotePullService',
        remotePullService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemotePullServiceRequest.fromBuffer(value),
        ($0.RemoteServiceControlResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
        'RemoteStartService',
        remoteStartService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoteServiceNameRequest.fromBuffer(value),
        ($0.RemoteServiceControlResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
        'RemoteStopService',
        remoteStopService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoteServiceNameRequest.fromBuffer(value),
        ($0.RemoteServiceControlResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
        'RemoteRemoveService',
        remoteRemoveService_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoteServiceNameRequest.fromBuffer(value),
        ($0.RemoteServiceControlResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemotePeerRequest, $0.ListServicesResponse>(
        'RemoteListServices',
        remoteListServices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemotePeerRequest.fromBuffer(value),
        ($0.ListServicesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AttachServiceAccessRequest, $0.ServiceAccessResponse>(
        'AttachServiceAccess',
        attachServiceAccess_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AttachServiceAccessRequest.fromBuffer(value),
        ($0.ServiceAccessResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DetachServiceAccessRequest, $0.Empty>(
        'DetachServiceAccess',
        detachServiceAccess_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DetachServiceAccessRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListServiceAccessesRequest, $0.ServiceAccessesResponse>(
        'ListServiceAccesses',
        listServiceAccesses_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListServiceAccessesRequest.fromBuffer(value),
        ($0.ServiceAccessesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.VersionResponse> version_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return version(call, await request);
  }

  $async.Future<$0.PeerIdResponse> peerId_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return peerId(call, await request);
  }

  $async.Future<$0.ConfigFilePathResponse> configFilePath_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return configFilePath(call, await request);
  }

  $async.Future<$0.HostnameResponse> hostname_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return hostname(call, await request);
  }

  $async.Future<$0.IncomingAllowedPeersListResponse> getIncomingAllowedPeers_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getIncomingAllowedPeers(call, await request);
  }

  $async.Future<$0.Empty> addIncomingAllowedPeer_Pre($grpc.ServiceCall call, $async.Future<$0.AddIncomingAllowedPeerRequest> request) async {
    return addIncomingAllowedPeer(call, await request);
  }

  $async.Future<$0.Empty> removeIncomingAllowedPeer_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveIncomingAllowedPeerRequest> request) async {
    return removeIncomingAllowedPeer(call, await request);
  }

  $async.Future<$0.RelayConfigResponse> getRelayConfig_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getRelayConfig(call, await request);
  }

  $async.Future<$0.Empty> setRelayEnabled_Pre($grpc.ServiceCall call, $async.Future<$0.RelayEnabledRequest> request) async {
    return setRelayEnabled(call, await request);
  }

  $async.Future<$0.Empty> setUseCommunityRelays_Pre($grpc.ServiceCall call, $async.Future<$0.UseCommunityRelaysRequest> request) async {
    return setUseCommunityRelays(call, await request);
  }

  $async.Future<$0.Empty> addCustomRelayAddress_Pre($grpc.ServiceCall call, $async.Future<$0.RelayAddressRequest> request) async {
    return addCustomRelayAddress(call, await request);
  }

  $async.Future<$0.Empty> removeCustomRelayAddress_Pre($grpc.ServiceCall call, $async.Future<$0.RelayAddressRequest> request) async {
    return removeCustomRelayAddress(call, await request);
  }

  $async.Future<$0.RuntimeConfigResponse> getRuntimeConfig_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getRuntimeConfig(call, await request);
  }

  $async.Future<$0.LocalRuntimeStatusResponse> getLocalRuntimeStatus_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getLocalRuntimeStatus(call, await request);
  }

  $async.Future<$0.Empty> addRuntimeAllowedHostPath_Pre($grpc.ServiceCall call, $async.Future<$0.RuntimeAllowedHostPathRequest> request) async {
    return addRuntimeAllowedHostPath(call, await request);
  }

  $async.Future<$0.Empty> removeRuntimeAllowedHostPath_Pre($grpc.ServiceCall call, $async.Future<$0.RuntimeAllowedHostPathRequest> request) async {
    return removeRuntimeAllowedHostPath(call, await request);
  }

  $async.Future<$0.Empty> addRuntimeAllowedPort_Pre($grpc.ServiceCall call, $async.Future<$0.RuntimeAllowedPortRequest> request) async {
    return addRuntimeAllowedPort(call, await request);
  }

  $async.Future<$0.Empty> removeRuntimeAllowedPort_Pre($grpc.ServiceCall call, $async.Future<$0.RuntimeAllowedPortRequest> request) async {
    return removeRuntimeAllowedPort(call, await request);
  }

  $async.Future<$0.Empty> addRuntimeAllowedPortRange_Pre($grpc.ServiceCall call, $async.Future<$0.RuntimeAllowedPortRangeRequest> request) async {
    return addRuntimeAllowedPortRange(call, await request);
  }

  $async.Future<$0.Empty> removeRuntimeAllowedPortRange_Pre($grpc.ServiceCall call, $async.Future<$0.RuntimeAllowedPortRangeRequest> request) async {
    return removeRuntimeAllowedPortRange(call, await request);
  }

  $async.Future<$0.FileTransferServiceEnabledResponse> getFileTransferServiceEnabled_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getFileTransferServiceEnabled(call, await request);
  }

  $async.Future<$0.FileTransferServiceRootDirResponse> getFileTransferServiceRootDir_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getFileTransferServiceRootDir(call, await request);
  }

  $async.Future<$0.Empty> startFileTransferService_Pre($grpc.ServiceCall call, $async.Future<$0.StartFileTransferServiceRequest> request) async {
    return startFileTransferService(call, await request);
  }

  $async.Future<$0.Empty> stopFileTransferService_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return stopFileTransferService(call, await request);
  }

  $async.Future<$0.Empty> addFileTransferClient_Pre($grpc.ServiceCall call, $async.Future<$0.AddFileTransferClientRequest> request) async {
    return addFileTransferClient(call, await request);
  }

  $async.Future<$0.Empty> removeFileTransferClient_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveFileTransferClientRequest> request) async {
    return removeFileTransferClient(call, await request);
  }

  $async.Future<$0.Empty> enableFileTransferClient_Pre($grpc.ServiceCall call, $async.Future<$0.EnableFileTransferClientRequest> request) async {
    return enableFileTransferClient(call, await request);
  }

  $async.Future<$0.FileTransferClientsResponse> getAllFileTransferClients_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getAllFileTransferClients(call, await request);
  }

  $async.Future<$0.FtpProxyResponse> getFtpProxy_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getFtpProxy(call, await request);
  }

  $async.Future<$0.Empty> updateFtpProxy_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateFtpProxyRequest> request) async {
    return updateFtpProxy(call, await request);
  }

  $async.Future<$0.WebdavProxyResponse> getWebdavProxy_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getWebdavProxy(call, await request);
  }

  $async.Future<$0.Empty> updateWebdavProxy_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateWebdavProxyRequest> request) async {
    return updateWebdavProxy(call, await request);
  }

  $async.Future<$0.TcpTunnelingConfigResponse> getTcpTunnelingConfig_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTcpTunnelingConfig(call, await request);
  }

  $async.Future<$0.TcpForwardingRuleResponse> addTcpForwardingRule_Pre($grpc.ServiceCall call, $async.Future<$0.AddTcpForwardingRuleRequest> request) async {
    return addTcpForwardingRule(call, await request);
  }

  $async.Future<$0.Empty> removeTcpForwardingRule_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveTcpForwardingRuleRequest> request) async {
    return removeTcpForwardingRule(call, await request);
  }

  $async.Future<$0.TcpListeningRuleResponse> addTcpListeningRule_Pre($grpc.ServiceCall call, $async.Future<$0.AddTcpListeningRuleRequest> request) async {
    return addTcpListeningRule(call, await request);
  }

  $async.Future<$0.Empty> removeTcpListeningRule_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveTcpListeningRuleRequest> request) async {
    return removeTcpListeningRule(call, await request);
  }

  $async.Future<$0.PeerInfoListResponse> listMdnsDevices_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listMdnsDevices(call, await request);
  }

  $async.Future<$0.PeerInfoListResponse> listAddressBookPeers_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listAddressBookPeers(call, await request);
  }

  $async.Future<$0.Empty> updateAddressBookPeer_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateAddressBookPeerRequest> request) async {
    return updateAddressBookPeer(call, await request);
  }

  $async.Future<$0.PeerInfoResponse> getAddressBookPeer_Pre($grpc.ServiceCall call, $async.Future<$0.GetAddressBookPeerRequest> request) async {
    return getAddressBookPeer(call, await request);
  }

  $async.Future<$0.Empty> removeAddressBookPeer_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveAddressBookPeerRequest> request) async {
    return removeAddressBookPeer(call, await request);
  }

  $async.Stream<$0.PingPeerEvent> pingPeer_Pre($grpc.ServiceCall call, $async.Future<$0.PingPeerRequest> request) async* {
    yield* pingPeer(call, await request);
  }

  $async.Future<$0.ListConnectionsResponse> listConnections_Pre($grpc.ServiceCall call, $async.Future<$0.ListConnectionsRequest> request) async {
    return listConnections(call, await request);
  }

  $async.Future<$0.ListActiveStreamsResponse> listActiveStreams_Pre($grpc.ServiceCall call, $async.Future<$0.ListActiveStreamsRequest> request) async {
    return listActiveStreams(call, await request);
  }

  $async.Future<$0.ListExternalAddressCandidatesResponse> listExternalAddressCandidates_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listExternalAddressCandidates(call, await request);
  }

  $async.Future<$0.ListRelayEndpointStatusesResponse> listRelayEndpointStatuses_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listRelayEndpointStatuses(call, await request);
  }

  $async.Future<$0.ListPeerAddressesResponse> listPeerAddresses_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listPeerAddresses(call, await request);
  }

  $async.Future<$0.ServiceInstanceResponse> pullService_Pre($grpc.ServiceCall call, $async.Future<$0.PullServiceRequest> request) async {
    return pullService(call, await request);
  }

  $async.Future<$0.Empty> startService_Pre($grpc.ServiceCall call, $async.Future<$0.ServiceNameRequest> request) async {
    return startService(call, await request);
  }

  $async.Future<$0.Empty> stopService_Pre($grpc.ServiceCall call, $async.Future<$0.ServiceNameRequest> request) async {
    return stopService(call, await request);
  }

  $async.Future<$0.Empty> removeService_Pre($grpc.ServiceCall call, $async.Future<$0.ServiceNameRequest> request) async {
    return removeService(call, await request);
  }

  $async.Future<$0.ServiceInstanceResponse> inspectService_Pre($grpc.ServiceCall call, $async.Future<$0.ServiceNameRequest> request) async {
    return inspectService(call, await request);
  }

  $async.Future<$0.ServiceLogsResponse> getServiceLogs_Pre($grpc.ServiceCall call, $async.Future<$0.GetServiceLogsRequest> request) async {
    return getServiceLogs(call, await request);
  }

  $async.Future<$0.ListServicesResponse> listServices_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listServices(call, await request);
  }

  $async.Future<$0.ListPeerCatalogResponse> listPeerCatalog_Pre($grpc.ServiceCall call, $async.Future<$0.ListPeerCatalogRequest> request) async {
    return listPeerCatalog(call, await request);
  }

  $async.Future<$0.GetPeerCapabilitySummaryResponse> getPeerCapabilitySummary_Pre($grpc.ServiceCall call, $async.Future<$0.GetPeerCapabilitySummaryRequest> request) async {
    return getPeerCapabilitySummary(call, await request);
  }

  $async.Future<$0.RemoteServiceControlResponse> remotePullService_Pre($grpc.ServiceCall call, $async.Future<$0.RemotePullServiceRequest> request) async {
    return remotePullService(call, await request);
  }

  $async.Future<$0.RemoteServiceControlResponse> remoteStartService_Pre($grpc.ServiceCall call, $async.Future<$0.RemoteServiceNameRequest> request) async {
    return remoteStartService(call, await request);
  }

  $async.Future<$0.RemoteServiceControlResponse> remoteStopService_Pre($grpc.ServiceCall call, $async.Future<$0.RemoteServiceNameRequest> request) async {
    return remoteStopService(call, await request);
  }

  $async.Future<$0.RemoteServiceControlResponse> remoteRemoveService_Pre($grpc.ServiceCall call, $async.Future<$0.RemoteServiceNameRequest> request) async {
    return remoteRemoveService(call, await request);
  }

  $async.Future<$0.ListServicesResponse> remoteListServices_Pre($grpc.ServiceCall call, $async.Future<$0.RemotePeerRequest> request) async {
    return remoteListServices(call, await request);
  }

  $async.Future<$0.ServiceAccessResponse> attachServiceAccess_Pre($grpc.ServiceCall call, $async.Future<$0.AttachServiceAccessRequest> request) async {
    return attachServiceAccess(call, await request);
  }

  $async.Future<$0.Empty> detachServiceAccess_Pre($grpc.ServiceCall call, $async.Future<$0.DetachServiceAccessRequest> request) async {
    return detachServiceAccess(call, await request);
  }

  $async.Future<$0.ServiceAccessesResponse> listServiceAccesses_Pre($grpc.ServiceCall call, $async.Future<$0.ListServiceAccessesRequest> request) async {
    return listServiceAccesses(call, await request);
  }

  $async.Future<$0.VersionResponse> version($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.PeerIdResponse> peerId($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ConfigFilePathResponse> configFilePath($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.HostnameResponse> hostname($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.IncomingAllowedPeersListResponse> getIncomingAllowedPeers($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> addIncomingAllowedPeer($grpc.ServiceCall call, $0.AddIncomingAllowedPeerRequest request);
  $async.Future<$0.Empty> removeIncomingAllowedPeer($grpc.ServiceCall call, $0.RemoveIncomingAllowedPeerRequest request);
  $async.Future<$0.RelayConfigResponse> getRelayConfig($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> setRelayEnabled($grpc.ServiceCall call, $0.RelayEnabledRequest request);
  $async.Future<$0.Empty> setUseCommunityRelays($grpc.ServiceCall call, $0.UseCommunityRelaysRequest request);
  $async.Future<$0.Empty> addCustomRelayAddress($grpc.ServiceCall call, $0.RelayAddressRequest request);
  $async.Future<$0.Empty> removeCustomRelayAddress($grpc.ServiceCall call, $0.RelayAddressRequest request);
  $async.Future<$0.RuntimeConfigResponse> getRuntimeConfig($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.LocalRuntimeStatusResponse> getLocalRuntimeStatus($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> addRuntimeAllowedHostPath($grpc.ServiceCall call, $0.RuntimeAllowedHostPathRequest request);
  $async.Future<$0.Empty> removeRuntimeAllowedHostPath($grpc.ServiceCall call, $0.RuntimeAllowedHostPathRequest request);
  $async.Future<$0.Empty> addRuntimeAllowedPort($grpc.ServiceCall call, $0.RuntimeAllowedPortRequest request);
  $async.Future<$0.Empty> removeRuntimeAllowedPort($grpc.ServiceCall call, $0.RuntimeAllowedPortRequest request);
  $async.Future<$0.Empty> addRuntimeAllowedPortRange($grpc.ServiceCall call, $0.RuntimeAllowedPortRangeRequest request);
  $async.Future<$0.Empty> removeRuntimeAllowedPortRange($grpc.ServiceCall call, $0.RuntimeAllowedPortRangeRequest request);
  $async.Future<$0.FileTransferServiceEnabledResponse> getFileTransferServiceEnabled($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.FileTransferServiceRootDirResponse> getFileTransferServiceRootDir($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> startFileTransferService($grpc.ServiceCall call, $0.StartFileTransferServiceRequest request);
  $async.Future<$0.Empty> stopFileTransferService($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> addFileTransferClient($grpc.ServiceCall call, $0.AddFileTransferClientRequest request);
  $async.Future<$0.Empty> removeFileTransferClient($grpc.ServiceCall call, $0.RemoveFileTransferClientRequest request);
  $async.Future<$0.Empty> enableFileTransferClient($grpc.ServiceCall call, $0.EnableFileTransferClientRequest request);
  $async.Future<$0.FileTransferClientsResponse> getAllFileTransferClients($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.FtpProxyResponse> getFtpProxy($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> updateFtpProxy($grpc.ServiceCall call, $0.UpdateFtpProxyRequest request);
  $async.Future<$0.WebdavProxyResponse> getWebdavProxy($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> updateWebdavProxy($grpc.ServiceCall call, $0.UpdateWebdavProxyRequest request);
  $async.Future<$0.TcpTunnelingConfigResponse> getTcpTunnelingConfig($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.TcpForwardingRuleResponse> addTcpForwardingRule($grpc.ServiceCall call, $0.AddTcpForwardingRuleRequest request);
  $async.Future<$0.Empty> removeTcpForwardingRule($grpc.ServiceCall call, $0.RemoveTcpForwardingRuleRequest request);
  $async.Future<$0.TcpListeningRuleResponse> addTcpListeningRule($grpc.ServiceCall call, $0.AddTcpListeningRuleRequest request);
  $async.Future<$0.Empty> removeTcpListeningRule($grpc.ServiceCall call, $0.RemoveTcpListeningRuleRequest request);
  $async.Future<$0.PeerInfoListResponse> listMdnsDevices($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.PeerInfoListResponse> listAddressBookPeers($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> updateAddressBookPeer($grpc.ServiceCall call, $0.UpdateAddressBookPeerRequest request);
  $async.Future<$0.PeerInfoResponse> getAddressBookPeer($grpc.ServiceCall call, $0.GetAddressBookPeerRequest request);
  $async.Future<$0.Empty> removeAddressBookPeer($grpc.ServiceCall call, $0.RemoveAddressBookPeerRequest request);
  $async.Stream<$0.PingPeerEvent> pingPeer($grpc.ServiceCall call, $0.PingPeerRequest request);
  $async.Future<$0.ListConnectionsResponse> listConnections($grpc.ServiceCall call, $0.ListConnectionsRequest request);
  $async.Future<$0.ListActiveStreamsResponse> listActiveStreams($grpc.ServiceCall call, $0.ListActiveStreamsRequest request);
  $async.Future<$0.ListExternalAddressCandidatesResponse> listExternalAddressCandidates($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ListRelayEndpointStatusesResponse> listRelayEndpointStatuses($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ListPeerAddressesResponse> listPeerAddresses($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ServiceInstanceResponse> pullService($grpc.ServiceCall call, $0.PullServiceRequest request);
  $async.Future<$0.Empty> startService($grpc.ServiceCall call, $0.ServiceNameRequest request);
  $async.Future<$0.Empty> stopService($grpc.ServiceCall call, $0.ServiceNameRequest request);
  $async.Future<$0.Empty> removeService($grpc.ServiceCall call, $0.ServiceNameRequest request);
  $async.Future<$0.ServiceInstanceResponse> inspectService($grpc.ServiceCall call, $0.ServiceNameRequest request);
  $async.Future<$0.ServiceLogsResponse> getServiceLogs($grpc.ServiceCall call, $0.GetServiceLogsRequest request);
  $async.Future<$0.ListServicesResponse> listServices($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ListPeerCatalogResponse> listPeerCatalog($grpc.ServiceCall call, $0.ListPeerCatalogRequest request);
  $async.Future<$0.GetPeerCapabilitySummaryResponse> getPeerCapabilitySummary($grpc.ServiceCall call, $0.GetPeerCapabilitySummaryRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remotePullService($grpc.ServiceCall call, $0.RemotePullServiceRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remoteStartService($grpc.ServiceCall call, $0.RemoteServiceNameRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remoteStopService($grpc.ServiceCall call, $0.RemoteServiceNameRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remoteRemoveService($grpc.ServiceCall call, $0.RemoteServiceNameRequest request);
  $async.Future<$0.ListServicesResponse> remoteListServices($grpc.ServiceCall call, $0.RemotePeerRequest request);
  $async.Future<$0.ServiceAccessResponse> attachServiceAccess($grpc.ServiceCall call, $0.AttachServiceAccessRequest request);
  $async.Future<$0.Empty> detachServiceAccess($grpc.ServiceCall call, $0.DetachServiceAccessRequest request);
  $async.Future<$0.ServiceAccessesResponse> listServiceAccesses($grpc.ServiceCall call, $0.ListServiceAccessesRequest request);
}

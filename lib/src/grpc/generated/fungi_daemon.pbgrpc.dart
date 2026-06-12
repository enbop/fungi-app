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
  static final _$listTrustedDevices = $grpc.ClientMethod<$0.Empty, $0.TrustedDevicesListResponse>(
      '/fungi_daemon.FungiDaemon/ListTrustedDevices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TrustedDevicesListResponse.fromBuffer(value));
  static final _$trustDevice = $grpc.ClientMethod<$0.TrustDeviceRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/TrustDevice',
      ($0.TrustDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$untrustDevice = $grpc.ClientMethod<$0.UntrustDeviceRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/UntrustDevice',
      ($0.UntrustDeviceRequest value) => value.writeToBuffer(),
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
  static final _$listMdnsDevices = $grpc.ClientMethod<$0.Empty, $0.DeviceInfoListResponse>(
      '/fungi_daemon.FungiDaemon/ListMdnsDevices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeviceInfoListResponse.fromBuffer(value));
  static final _$listDevices = $grpc.ClientMethod<$0.Empty, $0.DeviceInfoListResponse>(
      '/fungi_daemon.FungiDaemon/ListDevices',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeviceInfoListResponse.fromBuffer(value));
  static final _$updateDevice = $grpc.ClientMethod<$0.UpdateDeviceRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/UpdateDevice',
      ($0.UpdateDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getDevice = $grpc.ClientMethod<$0.GetDeviceRequest, $0.DeviceInfoResponse>(
      '/fungi_daemon.FungiDaemon/GetDevice',
      ($0.GetDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeviceInfoResponse.fromBuffer(value));
  static final _$removeDevice = $grpc.ClientMethod<$0.RemoveDeviceRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/RemoveDevice',
      ($0.RemoveDeviceRequest value) => value.writeToBuffer(),
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
  static final _$listRecipes = $grpc.ClientMethod<$0.ListRecipesRequest, $0.ListRecipesResponse>(
      '/fungi_daemon.FungiDaemon/ListRecipes',
      ($0.ListRecipesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListRecipesResponse.fromBuffer(value));
  static final _$getRecipe = $grpc.ClientMethod<$0.GetRecipeRequest, $0.GetRecipeResponse>(
      '/fungi_daemon.FungiDaemon/GetRecipe',
      ($0.GetRecipeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRecipeResponse.fromBuffer(value));
  static final _$resolveRecipe = $grpc.ClientMethod<$0.ResolveRecipeRequest, $0.ResolveRecipeResponse>(
      '/fungi_daemon.FungiDaemon/ResolveRecipe',
      ($0.ResolveRecipeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResolveRecipeResponse.fromBuffer(value));
  static final _$getDeviceServiceSnapshot = $grpc.ClientMethod<$0.DeviceServiceSnapshotRequest, $0.DeviceServiceSnapshotResponse>(
      '/fungi_daemon.FungiDaemon/GetDeviceServiceSnapshot',
      ($0.DeviceServiceSnapshotRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeviceServiceSnapshotResponse.fromBuffer(value));
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
  static final _$forgetDeviceService = $grpc.ClientMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
      '/fungi_daemon.FungiDaemon/ForgetDeviceService',
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
  static final _$forgetServiceAccess = $grpc.ClientMethod<$0.ForgetServiceAccessRequest, $0.Empty>(
      '/fungi_daemon.FungiDaemon/ForgetServiceAccess',
      ($0.ForgetServiceAccessRequest value) => value.writeToBuffer(),
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

  $grpc.ResponseFuture<$0.TrustedDevicesListResponse> listTrustedDevices($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listTrustedDevices, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> trustDevice($0.TrustDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$trustDevice, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> untrustDevice($0.UntrustDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$untrustDevice, request, options: options);
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

  $grpc.ResponseFuture<$0.DeviceInfoListResponse> listMdnsDevices($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listMdnsDevices, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeviceInfoListResponse> listDevices($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listDevices, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> updateDevice($0.UpdateDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDevice, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeviceInfoResponse> getDevice($0.GetDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDevice, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> removeDevice($0.RemoveDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeDevice, request, options: options);
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

  $grpc.ResponseFuture<$0.ListRecipesResponse> listRecipes($0.ListRecipesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRecipes, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRecipeResponse> getRecipe($0.GetRecipeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRecipe, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResolveRecipeResponse> resolveRecipe($0.ResolveRecipeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resolveRecipe, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeviceServiceSnapshotResponse> getDeviceServiceSnapshot($0.DeviceServiceSnapshotRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDeviceServiceSnapshot, request, options: options);
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

  $grpc.ResponseFuture<$0.RemoteServiceControlResponse> forgetDeviceService($0.RemoteServiceNameRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$forgetDeviceService, request, options: options);
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

  $grpc.ResponseFuture<$0.Empty> forgetServiceAccess($0.ForgetServiceAccessRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$forgetServiceAccess, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TrustedDevicesListResponse>(
        'ListTrustedDevices',
        listTrustedDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TrustedDevicesListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TrustDeviceRequest, $0.Empty>(
        'TrustDevice',
        trustDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TrustDeviceRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UntrustDeviceRequest, $0.Empty>(
        'UntrustDevice',
        untrustDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UntrustDeviceRequest.fromBuffer(value),
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
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.DeviceInfoListResponse>(
        'ListMdnsDevices',
        listMdnsDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.DeviceInfoListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.DeviceInfoListResponse>(
        'ListDevices',
        listDevices_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.DeviceInfoListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateDeviceRequest, $0.Empty>(
        'UpdateDevice',
        updateDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateDeviceRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDeviceRequest, $0.DeviceInfoResponse>(
        'GetDevice',
        getDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDeviceRequest.fromBuffer(value),
        ($0.DeviceInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveDeviceRequest, $0.Empty>(
        'RemoveDevice',
        removeDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveDeviceRequest.fromBuffer(value),
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
    $addMethod($grpc.ServiceMethod<$0.ListRecipesRequest, $0.ListRecipesResponse>(
        'ListRecipes',
        listRecipes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListRecipesRequest.fromBuffer(value),
        ($0.ListRecipesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRecipeRequest, $0.GetRecipeResponse>(
        'GetRecipe',
        getRecipe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRecipeRequest.fromBuffer(value),
        ($0.GetRecipeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResolveRecipeRequest, $0.ResolveRecipeResponse>(
        'ResolveRecipe',
        resolveRecipe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ResolveRecipeRequest.fromBuffer(value),
        ($0.ResolveRecipeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeviceServiceSnapshotRequest, $0.DeviceServiceSnapshotResponse>(
        'GetDeviceServiceSnapshot',
        getDeviceServiceSnapshot_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeviceServiceSnapshotRequest.fromBuffer(value),
        ($0.DeviceServiceSnapshotResponse value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.RemoteServiceNameRequest, $0.RemoteServiceControlResponse>(
        'ForgetDeviceService',
        forgetDeviceService_Pre,
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
    $addMethod($grpc.ServiceMethod<$0.ForgetServiceAccessRequest, $0.Empty>(
        'ForgetServiceAccess',
        forgetServiceAccess_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ForgetServiceAccessRequest.fromBuffer(value),
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

  $async.Future<$0.TrustedDevicesListResponse> listTrustedDevices_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listTrustedDevices(call, await request);
  }

  $async.Future<$0.Empty> trustDevice_Pre($grpc.ServiceCall call, $async.Future<$0.TrustDeviceRequest> request) async {
    return trustDevice(call, await request);
  }

  $async.Future<$0.Empty> untrustDevice_Pre($grpc.ServiceCall call, $async.Future<$0.UntrustDeviceRequest> request) async {
    return untrustDevice(call, await request);
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

  $async.Future<$0.DeviceInfoListResponse> listMdnsDevices_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listMdnsDevices(call, await request);
  }

  $async.Future<$0.DeviceInfoListResponse> listDevices_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listDevices(call, await request);
  }

  $async.Future<$0.Empty> updateDevice_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateDeviceRequest> request) async {
    return updateDevice(call, await request);
  }

  $async.Future<$0.DeviceInfoResponse> getDevice_Pre($grpc.ServiceCall call, $async.Future<$0.GetDeviceRequest> request) async {
    return getDevice(call, await request);
  }

  $async.Future<$0.Empty> removeDevice_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveDeviceRequest> request) async {
    return removeDevice(call, await request);
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

  $async.Future<$0.ListRecipesResponse> listRecipes_Pre($grpc.ServiceCall call, $async.Future<$0.ListRecipesRequest> request) async {
    return listRecipes(call, await request);
  }

  $async.Future<$0.GetRecipeResponse> getRecipe_Pre($grpc.ServiceCall call, $async.Future<$0.GetRecipeRequest> request) async {
    return getRecipe(call, await request);
  }

  $async.Future<$0.ResolveRecipeResponse> resolveRecipe_Pre($grpc.ServiceCall call, $async.Future<$0.ResolveRecipeRequest> request) async {
    return resolveRecipe(call, await request);
  }

  $async.Future<$0.DeviceServiceSnapshotResponse> getDeviceServiceSnapshot_Pre($grpc.ServiceCall call, $async.Future<$0.DeviceServiceSnapshotRequest> request) async {
    return getDeviceServiceSnapshot(call, await request);
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

  $async.Future<$0.RemoteServiceControlResponse> forgetDeviceService_Pre($grpc.ServiceCall call, $async.Future<$0.RemoteServiceNameRequest> request) async {
    return forgetDeviceService(call, await request);
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

  $async.Future<$0.Empty> forgetServiceAccess_Pre($grpc.ServiceCall call, $async.Future<$0.ForgetServiceAccessRequest> request) async {
    return forgetServiceAccess(call, await request);
  }

  $async.Future<$0.ServiceAccessesResponse> listServiceAccesses_Pre($grpc.ServiceCall call, $async.Future<$0.ListServiceAccessesRequest> request) async {
    return listServiceAccesses(call, await request);
  }

  $async.Future<$0.VersionResponse> version($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.PeerIdResponse> peerId($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.ConfigFilePathResponse> configFilePath($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.HostnameResponse> hostname($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.TrustedDevicesListResponse> listTrustedDevices($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> trustDevice($grpc.ServiceCall call, $0.TrustDeviceRequest request);
  $async.Future<$0.Empty> untrustDevice($grpc.ServiceCall call, $0.UntrustDeviceRequest request);
  $async.Future<$0.RelayConfigResponse> getRelayConfig($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> setRelayEnabled($grpc.ServiceCall call, $0.RelayEnabledRequest request);
  $async.Future<$0.Empty> setUseCommunityRelays($grpc.ServiceCall call, $0.UseCommunityRelaysRequest request);
  $async.Future<$0.Empty> addCustomRelayAddress($grpc.ServiceCall call, $0.RelayAddressRequest request);
  $async.Future<$0.Empty> removeCustomRelayAddress($grpc.ServiceCall call, $0.RelayAddressRequest request);
  $async.Future<$0.RuntimeConfigResponse> getRuntimeConfig($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.LocalRuntimeStatusResponse> getLocalRuntimeStatus($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> addRuntimeAllowedHostPath($grpc.ServiceCall call, $0.RuntimeAllowedHostPathRequest request);
  $async.Future<$0.Empty> removeRuntimeAllowedHostPath($grpc.ServiceCall call, $0.RuntimeAllowedHostPathRequest request);
  $async.Future<$0.DeviceInfoListResponse> listMdnsDevices($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.DeviceInfoListResponse> listDevices($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Empty> updateDevice($grpc.ServiceCall call, $0.UpdateDeviceRequest request);
  $async.Future<$0.DeviceInfoResponse> getDevice($grpc.ServiceCall call, $0.GetDeviceRequest request);
  $async.Future<$0.Empty> removeDevice($grpc.ServiceCall call, $0.RemoveDeviceRequest request);
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
  $async.Future<$0.ListRecipesResponse> listRecipes($grpc.ServiceCall call, $0.ListRecipesRequest request);
  $async.Future<$0.GetRecipeResponse> getRecipe($grpc.ServiceCall call, $0.GetRecipeRequest request);
  $async.Future<$0.ResolveRecipeResponse> resolveRecipe($grpc.ServiceCall call, $0.ResolveRecipeRequest request);
  $async.Future<$0.DeviceServiceSnapshotResponse> getDeviceServiceSnapshot($grpc.ServiceCall call, $0.DeviceServiceSnapshotRequest request);
  $async.Future<$0.GetPeerCapabilitySummaryResponse> getPeerCapabilitySummary($grpc.ServiceCall call, $0.GetPeerCapabilitySummaryRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remotePullService($grpc.ServiceCall call, $0.RemotePullServiceRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remoteStartService($grpc.ServiceCall call, $0.RemoteServiceNameRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remoteStopService($grpc.ServiceCall call, $0.RemoteServiceNameRequest request);
  $async.Future<$0.RemoteServiceControlResponse> remoteRemoveService($grpc.ServiceCall call, $0.RemoteServiceNameRequest request);
  $async.Future<$0.RemoteServiceControlResponse> forgetDeviceService($grpc.ServiceCall call, $0.RemoteServiceNameRequest request);
  $async.Future<$0.ListServicesResponse> remoteListServices($grpc.ServiceCall call, $0.RemotePeerRequest request);
  $async.Future<$0.ServiceAccessResponse> attachServiceAccess($grpc.ServiceCall call, $0.AttachServiceAccessRequest request);
  $async.Future<$0.Empty> detachServiceAccess($grpc.ServiceCall call, $0.DetachServiceAccessRequest request);
  $async.Future<$0.Empty> forgetServiceAccess($grpc.ServiceCall call, $0.ForgetServiceAccessRequest request);
  $async.Future<$0.ServiceAccessesResponse> listServiceAccesses($grpc.ServiceCall call, $0.ListServiceAccessesRequest request);
}

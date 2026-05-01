import 'package:grpc/grpc.dart' show CallOptions;

import 'generated/fungi_daemon.pbgrpc.dart';

export 'generated/fungi_daemon.pbgrpc.dart';

typedef PeerInfo = DeviceInfo;

class UpdateAddressBookPeerRequest {
  DeviceInfo peerInfo = DeviceInfo();
}

class GetAddressBookPeerRequest {
  String peerId = '';
}

class RemoveAddressBookPeerRequest {
  String peerId = '';
}

class RuntimeAllowedPortRequest {
  int port = 0;
}

class RuntimeAllowedPortRangeRequest {
  int start = 0;
  int end = 0;
}

class RuntimeAllowedPortRangeCompat {
  const RuntimeAllowedPortRangeCompat({required this.start, required this.end});

  final int start;
  final int end;
}

extension DeviceInfoCompat on DeviceInfo {
  String get alias => name;

  set alias(String value) => name = value;
}

extension DeviceInfoListResponseCompat on DeviceInfoListResponse {
  List<DeviceInfo> get peers => devices;
}

extension DeviceInfoResponseCompat on DeviceInfoResponse {
  DeviceInfo get peerInfo => device;
}

extension RuntimeConfigResponseCompat on RuntimeConfigResponse {
  List<int> get allowedPorts => const <int>[];

  List<RuntimeAllowedPortRangeCompat> get allowedPortRanges =>
      const <RuntimeAllowedPortRangeCompat>[];
}

extension AttachServiceAccessRequestCompat on AttachServiceAccessRequest {
  String get serviceId => serviceName;

  set serviceId(String value) => serviceName = value;
}

extension DetachServiceAccessRequestCompat on DetachServiceAccessRequest {
  String get serviceId => serviceName;

  set serviceId(String value) => serviceName = value;
}

extension FungiDaemonClientCompat on FungiDaemonClient {
  Future<DeviceInfoListResponse> listAddressBookPeers(
    Empty request, {
    CallOptions? options,
  }) {
    return listDevices(request, options: options);
  }

  Future<Empty> updateAddressBookPeer(
    UpdateAddressBookPeerRequest request, {
    CallOptions? options,
  }) {
    return updateDevice(
      UpdateDeviceRequest()..device = request.peerInfo,
      options: options,
    );
  }

  Future<DeviceInfoResponse> getAddressBookPeer(
    GetAddressBookPeerRequest request, {
    CallOptions? options,
  }) {
    return getDevice(
      GetDeviceRequest()..peerId = request.peerId,
      options: options,
    );
  }

  Future<Empty> removeAddressBookPeer(
    RemoveAddressBookPeerRequest request, {
    CallOptions? options,
  }) {
    return removeDevice(
      RemoveDeviceRequest()..peerId = request.peerId,
      options: options,
    );
  }

  Future<Empty> addRuntimeAllowedPort(
    RuntimeAllowedPortRequest request, {
    CallOptions? options,
  }) {
    return Future<Empty>.error(
      UnsupportedError(
        'Allowed ports are no longer exposed by the current daemon API.',
      ),
    );
  }

  Future<Empty> removeRuntimeAllowedPort(
    RuntimeAllowedPortRequest request, {
    CallOptions? options,
  }) {
    return Future<Empty>.error(
      UnsupportedError(
        'Allowed ports are no longer exposed by the current daemon API.',
      ),
    );
  }

  Future<Empty> addRuntimeAllowedPortRange(
    RuntimeAllowedPortRangeRequest request, {
    CallOptions? options,
  }) {
    return Future<Empty>.error(
      UnsupportedError(
        'Allowed port ranges are no longer exposed by the current daemon API.',
      ),
    );
  }

  Future<Empty> removeRuntimeAllowedPortRange(
    RuntimeAllowedPortRangeRequest request, {
    CallOptions? options,
  }) {
    return Future<Empty>.error(
      UnsupportedError(
        'Allowed port ranges are no longer exposed by the current daemon API.',
      ),
    );
  }
}

import 'dart:io';

import 'package:fungi_app/src/grpc/generated/fungi_daemon.pbgrpc.dart';
import 'package:fungi_app/ui/utils/android_binary_path.dart';
import 'package:grpc/grpc.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

final _logger = Logger('DaemonClient');

String getBundledFungiExecutablePath() {
  final executablePath = Platform.resolvedExecutable;

  if (Platform.isMacOS) {
    return '${Directory(executablePath).parent.parent.path}/Resources/fungi';
  } else if (Platform.isWindows) {
    return '${Directory(executablePath).parent.path}\\fungi.exe';
  } else if (Platform.isLinux) {
    return '${Directory(executablePath).parent.path}/fungi';
  } else {
    throw UnsupportedError('Unsupported platform: ${Platform.operatingSystem}');
  }
}

Future<String> getFungiExecutablePathForCurrentPlatform() async {
  if (Platform.isAndroid) {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final fungiDir = p.join(appDocumentsDir.absolute.path, 'fungi');
    final fungiExecutable = await getAndroidFungiBinaryPath() ?? '';
    if (fungiExecutable.isEmpty) {
      throw FileSystemException('Fungi executable not found on Android');
    }
    final directory = Directory(fungiDir);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return fungiExecutable;
  }

  final fungiExecutable = getBundledFungiExecutablePath();
  final file = File(fungiExecutable);
  if (!await file.exists()) {
    throw FileSystemException('Fungi executable not found', fungiExecutable);
  }
  return fungiExecutable;
}

Future<List<String>> buildFungiCliArgs(List<String> args) async {
  if (Platform.isAndroid) {
    final appDocumentsDir = await getApplicationDocumentsDirectory();
    final fungiDir = p.join(appDocumentsDir.absolute.path, 'fungi');
    return ['--default-device-name', 'null', '--fungi-dir', fungiDir, ...args];
  }

  return args;
}

Future<ProcessResult> runFungiCommand(List<String> args) async {
  final executable = await getFungiExecutablePathForCurrentPlatform();
  final fullArgs = await buildFungiCliArgs(args);
  return Process.run(executable, fullArgs);
}

Future<String> readRpcAddress() async {
  String fungiExecutable;
  List<String> args = ['info', 'rpc-address'];

  if (Platform.isAndroid) {
    fungiExecutable = await getFungiExecutablePathForCurrentPlatform();
    args = await buildFungiCliArgs(args);
  } else {
    fungiExecutable = await getFungiExecutablePathForCurrentPlatform();
  }

  final result = await Process.run(fungiExecutable, args);

  if (result.exitCode != 0) {
    throw ProcessException(
      fungiExecutable,
      args,
      'Process exited with code ${result.exitCode}\nstderr: ${result.stderr}',
    );
  }

  return result.stdout.toString().trim();
}

class DaemonRpcAddress {
  const DaemonRpcAddress({required this.host, required this.port});

  final String host;
  final int port;

  factory DaemonRpcAddress.parse(String address) {
    final value = address.trim();
    final uri = Uri.tryParse('http://$value');
    if (uri == null ||
        uri.host.isEmpty ||
        !uri.hasPort ||
        uri.port <= 0 ||
        uri.port > 65535 ||
        uri.path.isNotEmpty ||
        uri.query.isNotEmpty ||
        uri.fragment.isNotEmpty) {
      throw FormatException('Invalid RPC address: $address');
    }

    return DaemonRpcAddress(host: uri.host, port: uri.port);
  }
}

FungiDaemonClient _createClient(String address) {
  final rpcAddress = DaemonRpcAddress.parse(address);

  final channel = ClientChannel(
    rpcAddress.host,
    port: rpcAddress.port,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      connectTimeout: Duration(seconds: 3),
    ),
  );

  return FungiDaemonClient(channel);
}

FungiDaemonClient fungiDaemonClientPlaceholder() {
  return FungiDaemonClient(
    ClientChannel(
      'localhost',
      port: 0,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    ),
  );
}

Future<FungiDaemonClient> getFungiClient() async {
  final address = await readRpcAddress();
  _logger.info('Connecting to Fungi daemon at $address');
  final client = _createClient(address);

  try {
    await client.version(Empty());
    _logger.info('Connected to Fungi daemon at $address');
    return client;
  } catch (e) {
    _logger.severe('Failed to connect to daemon: $e');
    throw Exception('Daemon not available. Please ensure daemon is running.');
  }
}

Future<FungiDaemonClient?> tryGetFungiClient() async {
  try {
    return await getFungiClient();
  } catch (_) {
    return null;
  }
}

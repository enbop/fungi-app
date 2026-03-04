import 'dart:async';
import 'dart:io';

import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:fungi_app/app/foreground_task.dart';
import 'package:logging/logging.dart';

final _logger = Logger('DaemonServiceManager');

typedef DesktopDaemonProcessExitCallback = void Function(int exitCode);

DesktopDaemonProcessExitCallback? _desktopDaemonProcessExitCallback;

void setDesktopDaemonProcessExitCallback(
  DesktopDaemonProcessExitCallback? callback,
) {
  _desktopDaemonProcessExitCallback = callback;
}

abstract class DaemonServiceManager {
  bool get isRunning;

  Future<bool> start();
  Future<void> stop();

  factory DaemonServiceManager.create() {
    if (Platform.isAndroid || Platform.isIOS) {
      return MobileDaemonServiceManager();
    } else {
      return DesktopDaemonServiceManager();
    }
  }
}

class DesktopDaemonServiceManager implements DaemonServiceManager {
  Process? _process;
  bool _isRunning = false;
  bool _isStoppingDaemon = false;

  @override
  bool get isRunning => _isRunning;

  @override
  Future<bool> start() async {
    if (_isRunning) {
      return true;
    }

    try {
      final fungiExecutable = _getFungiExecutablePath();
      final file = File(fungiExecutable);

      if (!await file.exists()) {
        throw FileSystemException(
          'Fungi executable not found',
          fungiExecutable,
        );
      }

      _process = await Process.start(fungiExecutable, [
        'daemon',
        '--exit-on-stdin-close',
      ], mode: ProcessStartMode.normal);

      _isRunning = true;
      _isStoppingDaemon = false;

      _process!.stdout
          .transform(SystemEncoding().decoder)
          .listen(
            (data) => _logger.fine('[Daemon] $data'),
            onDone: () => _logger.warning('[Daemon] stdout closed'),
          );

      _process!.stderr
          .transform(SystemEncoding().decoder)
          .listen(
            (data) => _logger.fine('[Daemon Error] $data'),
            onDone: () => _logger.warning('[Daemon] stderr closed'),
          );

      _process!.exitCode.then((exitCode) {
        _logger.info('Daemon exited with code: $exitCode');
        if (!_isStoppingDaemon) {
          _desktopDaemonProcessExitCallback?.call(exitCode);
        }
        _isRunning = false;
        _process = null;
        _isStoppingDaemon = false;
      });

      return _isRunning;
    } catch (e) {
      _logger.severe('Failed to start daemon: $e');
      return false;
    }
  }

  @override
  Future<void> stop() async {
    if (_process == null) {
      _logger.warning('No daemon process to stop');
      return;
    }

    _logger.info('Stopping daemon...');
    _isStoppingDaemon = true;

    final killed = _process!.kill(ProcessSignal.sigterm);

    if (killed) {
      try {
        await _process!.exitCode.timeout(const Duration(seconds: 5));
        _logger.info('Daemon stopped gracefully');
      } on TimeoutException {
        _logger.warning('Timeout, force killing daemon...');
        _process!.kill(ProcessSignal.sigkill);
      }
    }

    _isRunning = false;
    _process = null;
    _isStoppingDaemon = false;
  }

  String _getFungiExecutablePath() {
    final executablePath = Platform.resolvedExecutable;

    if (Platform.isMacOS) {
      return '${Directory(executablePath).parent.parent.path}/Resources/fungi';
    } else if (Platform.isWindows) {
      return '${Directory(executablePath).parent.path}\\fungi.exe';
    } else if (Platform.isLinux) {
      return '${Directory(executablePath).parent.path}/fungi';
    } else {
      throw UnsupportedError(
        'Unsupported platform: ${Platform.operatingSystem}',
      );
    }
  }
}

class MobileDaemonServiceManager implements DaemonServiceManager {
  bool _isRunning = false;

  MobileDaemonServiceManager() {
    if (Platform.isAndroid) {
      FlutterForegroundTask.isRunningService.then((isRunning) {
        _isRunning = isRunning;
      });
    }
  }

  @override
  bool get isRunning => _isRunning;

  Future<bool> get isRunningAsync async {
    if (Platform.isAndroid) {
      _isRunning = await FlutterForegroundTask.isRunningService;
      return _isRunning;
    }
    return false;
  }

  @override
  Future<bool> start() async {
    if (Platform.isAndroid) {
      try {
        await requestForegroundPermissions();
        initForegroundService();

        final isAlreadyRunning = await FlutterForegroundTask.isRunningService;
        if (isAlreadyRunning) {
          await FlutterForegroundTask.restartService();
        } else {
          await startForegroundService();
        }

        _isRunning = await FlutterForegroundTask.isRunningService;

        if (_isRunning) {
          _logger.info('Foreground service started successfully');
        } else {
          _logger.warning('Failed to start foreground service');
        }

        return _isRunning;
      } catch (e) {
        _logger.severe('Failed to start foreground service: $e');
        return false;
      }
    }
    return false;
  }

  @override
  Future<void> stop() async {
    if (Platform.isAndroid) {
      try {
        await stopForegroundService();
        _isRunning = false;
        _logger.info('Foreground service stopped successfully');
      } catch (e) {
        _logger.severe('Failed to stop foreground service: $e');
      }
    }
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

class LogViewerController extends GetxController {
  static const refreshInterval = Duration(seconds: 1);
  static const maxChars = 200000;

  final String logsDirPath;

  LogViewerController({required this.logsDirPath});

  final currentLogFilePath = ''.obs;
  final content = 'Loading logs...'.obs;
  final error = ''.obs;
  final scrollController = ScrollController();

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    refreshLog();
    _timer = Timer.periodic(refreshInterval, (_) => refreshLog());
  }

  @override
  void onClose() {
    _timer?.cancel();
    scrollController.dispose();
    super.onClose();
  }

  Future<File?> _resolveCurrentLogFile() async {
    final logsDir = Directory(logsDirPath);
    if (!await logsDir.exists()) {
      return null;
    }

    final current = File(p.join(logsDirPath, 'daemon_rCURRENT.log'));
    if (await current.exists()) {
      return current;
    }

    final entries = await logsDir.list().toList();
    final files = entries.whereType<File>().where((file) {
      final name = p.basename(file.path);
      return name.startsWith('daemon_') && name.endsWith('.log');
    }).toList();

    if (files.isEmpty) {
      return null;
    }

    files.sort((a, b) {
      final aModified = a.statSync().modified;
      final bModified = b.statSync().modified;
      return bModified.compareTo(aModified);
    });

    return files.first;
  }

  Future<void> refreshLog() async {
    if (logsDirPath.isEmpty) {
      error.value = 'Log path is not available yet.';
      content.value = '';
      currentLogFilePath.value = '';
      return;
    }

    try {
      final logFile = await _resolveCurrentLogFile();
      if (logFile == null) {
        error.value = 'No daemon log file found in $logsDirPath';
        content.value = '';
        currentLogFilePath.value = '';
        return;
      }

      final rawContent = await logFile.readAsString();
      final displayContent = rawContent.length > maxChars
          ? rawContent.substring(rawContent.length - maxChars)
          : rawContent;

      error.value = '';
      currentLogFilePath.value = logFile.path;
      content.value = displayContent;
    } catch (e) {
      error.value = 'Failed to read log: $e';
    }
  }
}

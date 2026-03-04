import 'dart:io';

import 'package:logging/logging.dart';
import 'package:flutter/services.dart';

final _logger = Logger('AndroidBinaryPath');
const _channel = MethodChannel('rs.fungi.fungi_app/android_binary_path');

Future<String?> _getNativeLibraryDirFromPlatform() async {
  try {
    final dir = await _channel.invokeMethod<String>('getNativeLibraryDir');
    if (dir != null && dir.isNotEmpty) {
      return dir;
    }
  } catch (e) {
    _logger.fine('Failed to read nativeLibraryDir from platform channel: $e');
  }

  return null;
}

String? _extractMappedPath(String line) {
  final match = RegExp(r'\s(/.*)$').firstMatch(line);
  if (match == null) return null;

  final path = match.group(1)?.trim();
  if (path == null || path.isEmpty) return null;

  return path.replaceAll(' (deleted)', '');
}

Iterable<String> _candidateDirsFromMapPath(String mappedPath) sync* {
  if (mappedPath.contains('!lib/')) {
    final apkPath = mappedPath.split('!').first;
    final abi = mappedPath.split('!lib/').last.split('/').first;
    final appDir = File(apkPath).parent.path;

    yield '$appDir/lib/$abi';
    yield '$appDir/lib/arm64';
    yield '$appDir/lib/arm64-v8a';
  }

  if (!mappedPath.contains('!')) {
    yield File(mappedPath).parent.path;
  }
}

Future<String?> getAndroidFungiBinaryPath() async {
  if (!Platform.isAndroid) return null;

  try {
    final nativeLibraryDir = await _getNativeLibraryDirFromPlatform();
    if (nativeLibraryDir != null) {
      final nativeDirCandidate = '$nativeLibraryDir/libfungi.so';
      if (await File(nativeDirCandidate).exists()) {
        _logger.info(
          'Found fungi binary via nativeLibraryDir: $nativeDirCandidate',
        );
        return nativeDirCandidate;
      }

      _logger.warning(
        'nativeLibraryDir did not contain libfungi.so: $nativeDirCandidate',
      );
    }

    final mapsFile = File('/proc/self/maps');
    if (!await mapsFile.exists()) return null;

    final maps = await mapsFile.readAsLines();
    final candidates = <String>{};

    for (final line in maps) {
      final mappedPath = _extractMappedPath(line);
      if (mappedPath == null) continue;

      for (final dir in _candidateDirsFromMapPath(mappedPath)) {
        candidates.add('$dir/libfungi.so');
      }

      if (!mappedPath.contains('!') && mappedPath.endsWith('.so')) {
        candidates.add('${File(mappedPath).parent.path}/libfungi.so');
      }
    }

    for (final candidate in candidates) {
      if (await File(candidate).exists()) {
        _logger.info('Found fungi binary at: $candidate');
        return candidate;
      }
    }

    if (candidates.isNotEmpty) {
      _logger.warning(
        'Fungi binary not found. Tried: ${candidates.join(', ')}',
      );
    }
  } catch (e) {
    _logger.warning('Error finding fungi binary: $e');
  }

  return null;
}

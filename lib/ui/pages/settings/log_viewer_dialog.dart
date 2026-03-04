import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/log_viewer_controller.dart';
import 'package:get/get.dart';

class LogViewerDialog extends StatelessWidget {
  final String logsDirPath;
  final String controllerTag;

  const LogViewerDialog({
    super.key,
    required this.logsDirPath,
    required this.controllerTag,
  });

  LogViewerController get _controller =>
      Get.find<LogViewerController>(tag: controllerTag);

  TextStyle _lineStyleFor(BuildContext context, String line) {
    final baseStyle = Theme.of(context).textTheme.bodySmall;
    final lower = line.toLowerCase();

    if (lower.contains('panic') ||
        lower.contains(' error ') ||
        lower.startsWith('error')) {
      return (baseStyle ?? const TextStyle()).copyWith(
        color: Theme.of(context).colorScheme.error,
      );
    }

    if (lower.contains(' warn ') || lower.startsWith('warn')) {
      return (baseStyle ?? const TextStyle()).copyWith(
        color: Colors.orange.shade700,
      );
    }

    if (lower.contains(' info ') || lower.startsWith('info')) {
      return (baseStyle ?? const TextStyle()).copyWith(
        color: Theme.of(context).colorScheme.primary,
      );
    }

    if (lower.contains(' debug ') || lower.startsWith('debug')) {
      return (baseStyle ?? const TextStyle()).copyWith(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      );
    }

    return baseStyle ?? const TextStyle();
  }

  TextSpan _buildLogSpan(BuildContext context, String content) {
    final lines = content.split('\n');
    final spans = <TextSpan>[];

    for (var index = 0; index < lines.length; index++) {
      final line = lines[index];
      spans.add(TextSpan(text: line, style: _lineStyleFor(context, line)));
      if (index < lines.length - 1) {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return TextSpan(children: spans);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_controller.scrollController.hasClients) {
          return;
        }
        _controller.scrollController.jumpTo(
          _controller.scrollController.position.maxScrollExtent,
        );
      });

      return AlertDialog(
        title: const Text('Daemon Logs'),
        content: SizedBox(
          width: 760,
          height: 520,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Log dir: $logsDirPath'),
              const SizedBox(height: 8),
              Text(
                'Current file: ${_controller.currentLogFilePath.value.isEmpty ? '-' : _controller.currentLogFilePath.value}',
              ),
              const SizedBox(height: 8),
              if (_controller.error.value.isNotEmpty) ...[
                Text(_controller.error.value),
                const SizedBox(height: 8),
              ],
              Expanded(
                child: SingleChildScrollView(
                  controller: _controller.scrollController,
                  child: SelectableText.rich(
                    _buildLogSpan(context, _controller.content.value),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: _controller.refreshLog,
            child: const Text('Refresh'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      );
    });
  }
}

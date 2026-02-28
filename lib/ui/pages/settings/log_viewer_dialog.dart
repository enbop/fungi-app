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
                  child: SelectableText(
                    _controller.content.value,
                    style: Theme.of(context).textTheme.bodySmall,
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

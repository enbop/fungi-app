import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/service_management_widgets.dart';
import 'package:fungi_app/ui/widgets/ui_primitives.dart';
import 'package:get/get.dart';

class AdvancedPage extends GetView<FungiController> {
  const AdvancedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final runtimeConfig = controller.runtimeConfig.value;

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Runtime Capability',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              IconButton(
                onPressed: controller.refreshRuntimeConfig,
                icon: const Icon(Icons.refresh),
                tooltip: 'Refresh',
              ),
            ],
          ),
          const SizedBox(height: 16),
          EnhancedCard(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Supported runtimes',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ServiceStatusBadge(
                        label: 'Docker',
                        active: !runtimeConfig.disableDocker,
                      ),
                      ServiceStatusBadge(
                        label: 'Wasmtime',
                        active: !runtimeConfig.disableWasmtime,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          EnhancedCard(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Allowed Host Paths',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      InlineAddButton(
                        onPressed: _showAddPathDialog,
                        label: 'Add',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (runtimeConfig.allowedHostPaths.isEmpty)
                    const ManagementEmptyStateCard(
                      message: 'No allowed host paths configured yet.',
                    )
                  else
                    ...runtimeConfig.allowedHostPaths.map(
                      (path) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ManagementActionItemCard(
                          title: path,
                          subtitle:
                              'Remote services may access this directory.',
                          actionLabel: 'Remove',
                          onAction: () => _confirmRemovePath(path),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

  Future<void> _showAddPathDialog() async {
    final pathController = TextEditingController();
    await SmartDialog.show(
      builder: (_) => AlertDialog(
        title: const Text('Add Allowed Host Path'),
        content: TextField(
          controller: pathController,
          decoration: const InputDecoration(
            labelText: 'Host path',
            hintText: '/path/to/share',
          ),
        ),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final path = pathController.text.trim();
              if (path.isEmpty) {
                return;
              }
              SmartDialog.dismiss();
              await controller.addRuntimeAllowedHostPath(path);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  Future<void> _confirmRemovePath(String path) async {
    await SmartDialog.show(
      builder: (_) => AlertDialog(
        title: const Text('Remove Allowed Host Path'),
        content: SelectableText(path),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              SmartDialog.dismiss();
              await controller.removeRuntimeAllowedHostPath(path);
            },
            child: const Text('Remove'),
          ),
        ],
      ),
    );
  }
}

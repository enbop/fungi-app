import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/create_service_dialog.dart';
import 'package:fungi_app/ui/widgets/device_selector_dialog.dart';
import 'package:get/get.dart';

Future<void> showNodeEditorDialog({DeviceInfo? initialPeer}) async {
  final controller = Get.find<FungiController>();
  final selectedPeer = (initialPeer ?? DeviceInfo()).obs;
  final peerIdController = TextEditingController(
    text: initialPeer?.peerId ?? '',
  );
  final nameController = TextEditingController(text: initialPeer?.name ?? '');
  final errorMessage = ''.obs;

  await SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: Text(initialPeer == null ? 'Add Device' : 'Edit Device'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (initialPeer == null) ...[
                TextButton.icon(
                  onPressed: () async {
                    final peer = await showMdnsLocalDevicesSelectorDialog();
                    if (peer == null) {
                      return;
                    }
                    selectedPeer.value = peer;
                    peerIdController.text = peer.peerId;
                    nameController.text = peer.name.isNotEmpty
                        ? peer.name
                        : peer.hostname;
                  },
                  icon: const Icon(Icons.devices),
                  label: const Text('Discover via mDNS'),
                ),
                const SizedBox(height: 8),
              ],
              TextField(
                controller: peerIdController,
                enabled: initialPeer == null,
                decoration: const InputDecoration(
                  labelText: 'Device ID',
                  hintText: '12D3KooW...',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Device Name',
                  hintText: 'Office MacBook',
                ),
              ),
              Obx(
                () => errorMessage.value.isEmpty
                    ? const SizedBox.shrink()
                    : Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text(
                          errorMessage.value,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
        actions: [
          if (initialPeer != null)
            TextButton(
              onPressed: () {
                SmartDialog.dismiss();
                showDeletePeerDialog(peer: initialPeer);
              },
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text('Delete'),
            ),
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final peerId = peerIdController.text.trim();
              final name = nameController.text.trim();
              if (peerId.isEmpty) {
                errorMessage.value = 'Device ID is required';
                return;
              }
              if (name.isEmpty) {
                errorMessage.value = 'Device name is required';
                return;
              }

              final peer = selectedPeer.value;
              peer.peerId = peerId;
              peer.name = name;

              try {
                await controller.saveAddressBookPeer(peer);
                SmartDialog.dismiss();
              } catch (e) {
                errorMessage.value = '$e';
              }
            },
            child: Text(initialPeer == null ? 'Add' : 'Save'),
          ),
        ],
      );
    },
  );
}

Future<void> showRemoteServicePullDialog({required DeviceInfo peer}) async {
  await showCreateServiceDialog(Get.context!, initialPeer: peer);
}

Future<void> showDeletePeerDialog({required DeviceInfo peer}) async {
  final controller = Get.find<FungiController>();

  await SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Device'),
        content: Text(
          'Delete ${peer.name.isNotEmpty ? peer.name : peer.peerId} from Devices?',
        ),
        actions: [
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                await controller.deletePeer(peer.peerId);
                SmartDialog.dismiss();
              } catch (_) {
                SmartDialog.dismiss();
              }
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}

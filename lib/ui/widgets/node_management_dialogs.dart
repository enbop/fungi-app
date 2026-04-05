import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:fungi_app/ui/widgets/device_selector_dialog.dart';
import 'package:get/get.dart';

Future<void> showNodeEditorDialog({PeerInfo? initialPeer}) async {
  final controller = Get.find<FungiController>();
  final selectedPeer = (initialPeer ?? PeerInfo()).obs;
  final peerIdController = TextEditingController(
    text: initialPeer?.peerId ?? '',
  );
  final aliasController = TextEditingController(text: initialPeer?.alias ?? '');
  final errorMessage = ''.obs;

  await SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: Text(initialPeer == null ? 'Add Peer' : 'Edit Peer'),
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
                    aliasController.text = peer.alias.isNotEmpty
                        ? peer.alias
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
                  labelText: 'Peer ID',
                  hintText: '12D3KooW...',
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: aliasController,
                decoration: const InputDecoration(
                  labelText: 'Alias',
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
              final alias = aliasController.text.trim();
              if (peerId.isEmpty) {
                errorMessage.value = 'Peer ID is required';
                return;
              }
              if (alias.isEmpty) {
                errorMessage.value = 'Alias is required';
                return;
              }

              final peer = selectedPeer.value;
              peer.peerId = peerId;
              peer.alias = alias;

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

Future<void> showRemoteServicePullDialog({required PeerInfo peer}) async {
  final controller = Get.find<FungiController>();
  final manifestPathController = TextEditingController();
  final errorMessage = ''.obs;

  await SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Service to Peer'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                peer.alias.isNotEmpty ? peer.alias : peer.peerId,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: manifestPathController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Service Manifest',
                  hintText: 'Select a YAML file',
                ),
              ),
              const SizedBox(height: 8),
              TextButton.icon(
                onPressed: () async {
                  final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: const ['yaml', 'yml'],
                    lockParentWindow: true,
                  );
                  final path = result?.files.single.path;
                  if (path != null && path.isNotEmpty) {
                    manifestPathController.text = path;
                  }
                },
                icon: const Icon(Icons.upload_file),
                label: const Text('Choose YAML'),
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
          TextButton(
            onPressed: SmartDialog.dismiss,
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () async {
              final manifestPath = manifestPathController.text.trim();
              if (manifestPath.isEmpty) {
                errorMessage.value = 'Select a YAML manifest first';
                return;
              }
              try {
                await controller.pullRemoteServiceFromPath(
                  peerId: peer.peerId,
                  manifestPath: manifestPath,
                );
                SmartDialog.dismiss();
              } catch (e) {
                errorMessage.value = '$e';
              }
            },
            child: const Text('Try Add Service'),
          ),
        ],
      );
    },
  );
}

Future<void> showDeletePeerDialog({required PeerInfo peer}) async {
  final controller = Get.find<FungiController>();

  await SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete Peer'),
        content: Text(
          'Delete ${peer.alias.isNotEmpty ? peer.alias : peer.peerId} from Peers?',
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

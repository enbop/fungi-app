import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:get/get.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../widgets/device_selector_dialog.dart';

void showTrustedDevicesList() {
  final controller = Get.find<FungiController>();
  SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: const Text('Trusted Devices'),
        content: SizedBox(
          width: double.maxFinite,
          child: Obx(() {
            if (controller.trustedDevices.isEmpty) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No trusted devices'),
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.trustedDevices.length,
              itemBuilder: (context, index) {
                final deviceInfo = controller.trustedDevices[index];

                String displayName = deviceInfo.peerId;
                String subtitle = deviceInfo.peerId;

                if (deviceInfo.name.isNotEmpty) {
                  displayName = deviceInfo.name;
                } else if (deviceInfo.hostname.isNotEmpty) {
                  displayName = deviceInfo.hostname;
                }

                return ListTile(
                  title: SelectableText(
                    displayName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: displayName != subtitle
                      ? SelectableText(
                          subtitle,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        )
                      : null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                      size: 20,
                    ),
                    onPressed: () {
                      controller.removeTrustedDevice(deviceInfo.peerId);
                    },
                  ),
                  dense: true,
                );
              },
            );
          }),
        ),
        actions: [
          TextButton(
            onPressed: () => showTrustDeviceDialog(),
            child: const Text('Trust Device'),
          ),
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}

void showTrustDeviceDialog() {
  final textPeerIdController = TextEditingController();
  final textNameController = TextEditingController();
  final Rx<DeviceInfo> selectedPeer = DeviceInfo().obs;
  final errorMessage = RxString('');
  final controller = Get.find<FungiController>();

  SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: const Text('Trust Device'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.bookmarks_outlined),
              label: const Text('Select from Saved Devices'),
              onPressed: () async {
                final newSelectedPeer = await showAddressBookSelectorDialog();
                if (newSelectedPeer == null) return;
                selectedPeer.value = newSelectedPeer;
                textPeerIdController.text = selectedPeer.value.peerId;
                textNameController.text = selectedPeer.value.name.isNotEmpty
                    ? selectedPeer.value.name
                    : selectedPeer.value.hostname;
              },
            ),
            TextButton.icon(
              icon: const Icon(Icons.devices),
              label: const Text('Select from Local Devices (mDNS)'),
              onPressed: () async {
                final newSelectedPeer =
                    await showMdnsLocalDevicesSelectorDialog();
                if (newSelectedPeer == null) return;
                selectedPeer.value = newSelectedPeer;
                textPeerIdController.text = selectedPeer.value.peerId;
                textNameController.text = selectedPeer.value.name.isNotEmpty
                    ? selectedPeer.value.name
                    : selectedPeer.value.hostname;
              },
            ),
            SizedBox(height: 8),
            Obx(
              () => TextField(
                controller: textPeerIdController,
                decoration: InputDecoration(
                  labelText: 'Device ID',
                  hintText: 'Enter device ID',
                  helperText:
                      selectedPeer.value.peerId == textPeerIdController.text
                      ? selectedPeer.value.hostname
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: textNameController,
              decoration: const InputDecoration(
                labelText: 'Device Name',
                hintText: 'Enter a friendly name for this device',
              ),
            ),
            Obx(
              () => errorMessage.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        errorMessage.value,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final peerId = textPeerIdController.text.trim();
              final name = textNameController.text.trim();

              if (peerId.isEmpty) {
                errorMessage.value = 'Device ID cannot be empty';
                return;
              }
              if (name.isEmpty) {
                errorMessage.value = 'Device name cannot be empty';
                return;
              }

              if (selectedPeer.value.peerId != peerId) {
                // reset the selectedPeer
                selectedPeer.value = DeviceInfo();
              }

              selectedPeer.value.peerId = peerId;
              selectedPeer.value.name = name;
              try {
                await controller.addTrustedDevice(selectedPeer.value);
                SmartDialog.dismiss();
              } catch (e) {
                errorMessage.value = 'Failed to trust device: $e';
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}


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

void showAddFileClientDialog() {
  final textPeerIdController = TextEditingController();
  final textNameController = TextEditingController();
  final Rx<DeviceInfo> selectedPeer = DeviceInfo().obs;
  final enabled = RxBool(true);
  final errorMessage = RxString('');
  final controller = Get.find<FungiController>();

  SmartDialog.show(
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Device'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                autofocus: true,
              ),
            ),
            TextField(
              controller: textNameController,
              decoration: const InputDecoration(
                labelText: 'Device Name',
                hintText: 'Enter a device name',
                helperText:
                    'Device name will be displayed as filename in mount directory',
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: enabled.value,
                    onChanged: (value) {
                      if (value != null) {
                        enabled.value = value;
                      }
                    },
                  ),
                ),
                const Text('Enabled'),
              ],
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
              if (textPeerIdController.text.isEmpty) {
                errorMessage.value = 'Device ID cannot be empty';
                return;
              }
              if (selectedPeer.value.peerId != textPeerIdController.text) {
                // reset the selectedPeer
                selectedPeer.value = DeviceInfo();
              }
              selectedPeer.value.peerId = textPeerIdController.text;
              selectedPeer.value.name = textNameController.text;
              try {
                await controller.addFileTransferClient(
                  enabled: enabled.value,
                  peerInfo: selectedPeer.value,
                );
                SmartDialog.dismiss();
              } catch (e) {
                errorMessage.value = 'Failed to add device: $e';
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}

void showAddForwardingRuleDialog() {
  final localHostController = TextEditingController(text: "127.0.0.1");
  final localPortController = TextEditingController();
  final peerIdController = TextEditingController();
  final remotePortController = TextEditingController();
  final Rx<DeviceInfo> selectedPeer = DeviceInfo().obs;
  final errorMessage = RxString('');

  final controller = Get.find<FungiController>();

  SmartDialog.show(
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Add Port Forwarding Rule"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Forward traffic from a local port to a remote device's port",
                style: Theme.of(context).textTheme.bodySmall?.apply(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                ),
              ),
              SizedBox(height: 16),
              TextButton.icon(
                icon: const Icon(Icons.bookmarks_outlined),
                label: const Text('Select from Saved Devices'),
                onPressed: () async {
                  final newSelectedPeer = await showAddressBookSelectorDialog();
                  if (newSelectedPeer == null) return;
                  selectedPeer.value = newSelectedPeer;
                  peerIdController.text = selectedPeer.value.peerId;
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
                  peerIdController.text = selectedPeer.value.peerId;
                },
              ),
              SizedBox(height: 8),
              TextField(
                controller: localHostController,
                decoration: InputDecoration(
                  labelText: "Local Host",
                  hintText: "127.0.0.1",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: localPortController,
                decoration: InputDecoration(
                  labelText: "Local Port",
                  hintText: "8080",
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              Obx(
                () => TextField(
                  controller: peerIdController,
                  decoration: InputDecoration(
                    labelText: "Remote Device ID",
                    hintText: "12D3KooW...",
                    helperText:
                        selectedPeer.value.peerId == peerIdController.text
                        ? selectedPeer.value.hostname
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: remotePortController,
                decoration: InputDecoration(
                  labelText: "Remote Port",
                  hintText: "8888",
                ),
                keyboardType: TextInputType.number,
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
        ),
        actions: [
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final localHost = localHostController.text.trim();
              final localPort = int.tryParse(localPortController.text.trim());
              final peerId = peerIdController.text.trim();
              final remotePort = int.tryParse(remotePortController.text.trim());

              if (localHost.isEmpty ||
                  localPort == null ||
                  peerId.isEmpty ||
                  remotePort == null) {
                errorMessage.value =
                    'Please fill in all fields with valid values';
                return;
              }

              if (selectedPeer.value.peerId != peerIdController.text) {
                // reset the selectedPeer
                selectedPeer.value = DeviceInfo();
              }

              selectedPeer.value.peerId = peerIdController.text;
              try {
                await controller.addTcpForwardingRule(
                  localHost: localHost,
                  localPort: localPort,
                  remotePort: remotePort,
                  peerInfo: selectedPeer.value,
                );
                SmartDialog.dismiss();
              } catch (e) {
                errorMessage.value = 'Failed to add forwarding rule: $e';
              }
            },
            child: Text("Add"),
          ),
        ],
      );
    },
  );
}

void showAddListeningRuleDialog() {
  final localHostController = TextEditingController(text: "127.0.0.1");
  final localPortController = TextEditingController();
  final allowedPeersController = TextEditingController();
  final errorMessage = RxString('');

  final controller = Get.find<FungiController>();

  SmartDialog.show(
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Add Port Listening Rule"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Expose a local service to remote devices through P2P tunneling",
                style: Theme.of(context).textTheme.bodySmall?.apply(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(150),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: localHostController,
                decoration: InputDecoration(
                  labelText: "Local Host",
                  hintText: "127.0.0.1",
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: localPortController,
                decoration: InputDecoration(
                  labelText: "Local Port",
                  hintText: "8888",
                ),
                keyboardType: TextInputType.number,
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
        ),
        actions: [
          TextButton(
            onPressed: () => SmartDialog.dismiss(),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              final localHost = localHostController.text.trim();
              final localPort = int.tryParse(localPortController.text.trim());
              final allowedPeersText = allowedPeersController.text.trim();
              final allowedPeers = allowedPeersText.isEmpty
                  ? <String>[]
                  : allowedPeersText
                        .split(',')
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList();

              if (localHost.isEmpty || localPort == null) {
                errorMessage.value =
                    'Please fill in all required fields with valid values';
                return;
              }

              try {
                await controller.addTcpListeningRule(
                  localHost: localHost,
                  localPort: localPort,
                  allowedPeers: allowedPeers,
                );
                SmartDialog.dismiss();
              } catch (e) {
                errorMessage.value = 'Failed to add listening rule: $e';
              }
            },
            child: Text("Add"),
          ),
        ],
      );
    },
  );
}

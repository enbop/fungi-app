import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/src/grpc/fungi_daemon_compat.dart';
import 'package:get/get.dart';

enum _CreateServiceTarget { local, remote }

String _createServiceDeviceLabel(PeerInfo peer) {
  if (peer.alias.isNotEmpty) {
    return peer.alias;
  }
  if (peer.hostname.isNotEmpty) {
    return peer.hostname;
  }
  return peer.peerId;
}

Future<void> showCreateServiceDialog(
  BuildContext context, {
  PeerInfo? initialPeer,
}) async {
  final controller = Get.find<FungiController>();
  final devices = initialPeer == null
      ? controller.addressBook.toList(growable: false)
      : <PeerInfo>[initialPeer];
  final manifestPathController = TextEditingController();
  var target = initialPeer == null
      ? _CreateServiceTarget.local
      : _CreateServiceTarget.remote;
  String? selectedPeerId =
      initialPeer?.peerId ?? (devices.isNotEmpty ? devices.first.peerId : null);
  var errorMessage = '';
  var isSubmitting = false;

  await showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return StatefulBuilder(
        builder: (context, setState) {
          final isRemote = target == _CreateServiceTarget.remote;
          final remoteUnavailable = isRemote && devices.isEmpty;

          Future<void> submit() async {
            final manifestPath = manifestPathController.text.trim();
            if (manifestPath.isEmpty) {
              setState(() {
                errorMessage = 'Select a YAML manifest first';
              });
              return;
            }

            final file = File(manifestPath);
            if (!await file.exists()) {
              setState(() {
                errorMessage = 'Manifest file not found';
              });
              return;
            }

            if (isRemote && selectedPeerId == null) {
              setState(() {
                errorMessage = 'Choose a target device first';
              });
              return;
            }

            setState(() {
              errorMessage = '';
              isSubmitting = true;
            });

            final success = isRemote
                ? await controller.pullRemoteServiceFromPath(
                    peerId: selectedPeerId!,
                    manifestPath: manifestPath,
                  )
                : await controller.pullLocalServiceFromPath(manifestPath);

            if (!dialogContext.mounted) {
              return;
            }

            setState(() {
              isSubmitting = false;
            });

            if (success) {
              Navigator.of(dialogContext).pop();
            }
          }

          return AlertDialog(
            title: const Text('Create Service'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start from a manifest YAML for now. Choose whether to create the service on this device or on another saved device.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ChoiceChip(
                        label: const Text('Local'),
                        selected: target == _CreateServiceTarget.local,
                        onSelected: isSubmitting
                            ? null
                            : (_) {
                                setState(() {
                                  target = _CreateServiceTarget.local;
                                  errorMessage = '';
                                });
                              },
                      ),
                      ChoiceChip(
                        label: const Text('Remote'),
                        selected: target == _CreateServiceTarget.remote,
                        onSelected: isSubmitting
                            ? null
                            : (_) {
                                setState(() {
                                  target = _CreateServiceTarget.remote;
                                  errorMessage = '';
                                  selectedPeerId ??= devices.isNotEmpty
                                      ? devices.first.peerId
                                      : null;
                                });
                              },
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (isRemote) ...[
                    if (devices.isEmpty)
                      Text(
                        'Save a device in Devices before creating a remote service.',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      )
                    else
                      DropdownButtonFormField<String>(
                        initialValue: selectedPeerId,
                        decoration: const InputDecoration(
                          labelText: 'Target device',
                        ),
                        items: devices
                            .map((peer) {
                              return DropdownMenuItem<String>(
                                value: peer.peerId,
                                child: Text(_createServiceDeviceLabel(peer)),
                              );
                            })
                            .toList(growable: false),
                        onChanged: isSubmitting
                            ? null
                            : (value) {
                                setState(() {
                                  selectedPeerId = value;
                                });
                              },
                      ),
                    const SizedBox(height: 12),
                  ],
                  TextField(
                    controller: manifestPathController,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Service manifest',
                      hintText: 'Select a YAML file',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: isSubmitting
                        ? null
                        : () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.custom,
                              allowedExtensions: const ['yaml', 'yml'],
                              lockParentWindow: true,
                            );
                            final path = result?.files.single.path;
                            if (path == null || path.isEmpty) {
                              return;
                            }
                            setState(() {
                              manifestPathController.text = path;
                              errorMessage = '';
                            });
                          },
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Choose YAML'),
                  ),
                  if (errorMessage.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      errorMessage,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ],
                  if (remoteUnavailable) ...[
                    const SizedBox(height: 12),
                    Text(
                      'Remote creation stays available here, but it needs a saved device first.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: isSubmitting
                    ? null
                    : () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
              FilledButton.icon(
                onPressed: isSubmitting || remoteUnavailable ? null : submit,
                icon: isSubmitting
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.add_circle),
                label: Text(
                  isRemote ? 'Create on Device' : 'Create on This Device',
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

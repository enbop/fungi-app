import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/app/models/service_apply_result.dart';
import 'package:fungi_app/src/grpc/generated/fungi_daemon.pb.dart';
import 'package:get/get.dart';

enum _CreateServiceTarget { local, remote }

enum _CreateServiceSource { manifest, recipe }

String _createServiceDeviceLabel(DeviceInfo peer) {
  if (peer.name.isNotEmpty) {
    return peer.name;
  }
  if (peer.hostname.isNotEmpty) {
    return peer.hostname;
  }
  return peer.peerId;
}

String _recipeRuntimeLabel(RecipeSummary recipe) {
  switch (recipe.runtime) {
    case RecipeRuntimeKind.RECIPE_RUNTIME_KIND_WASMTIME:
      return 'Wasmtime';
    case RecipeRuntimeKind.RECIPE_RUNTIME_KIND_TCP:
      return 'TCP';
    case RecipeRuntimeKind.RECIPE_RUNTIME_KIND_UNSPECIFIED:
      return 'Unknown';
  }

  return 'Unknown';
}

Future<bool> _showRecipeWarningsDialog(
  BuildContext context,
  List<String> warnings,
) async {
  if (warnings.isEmpty) {
    return true;
  }

  final shouldContinue = await showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        title: const Text('Review Warnings'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Review these warnings before applying this recipe to the selected target:',
              ),
              const SizedBox(height: 12),
              for (final warning in warnings) ...[
                Text('• $warning'),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Continue'),
          ),
        ],
      );
    },
  );

  return shouldContinue ?? false;
}

Widget _buildRecipeDetailCard(BuildContext context, RecipeDetail detail) {
  final summary = detail.hasSummary() ? detail.summary : null;
  final theme = Theme.of(context);

  String line(String label, String value) {
    return value.trim().isEmpty ? '' : '$label: $value';
  }

  final lines = <String>[
    if (summary != null && summary.description.isNotEmpty) summary.description,
    if (summary != null) line('Runtime', _recipeRuntimeLabel(summary)),
    if (summary != null) line('Release', summary.releaseVersion),
    if (summary != null) line('Stability', summary.stability),
    if (detail.tags.isNotEmpty) 'Tags: ${detail.tags.join(', ')}',
    line('Homepage', detail.homepage),
  ].where((line) => line.isNotEmpty).toList(growable: false);

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.45),
      borderRadius: BorderRadius.circular(12),
    ),
    child: ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 12),
      childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      expandedCrossAxisAlignment: CrossAxisAlignment.start,
      shape: const Border(),
      collapsedShape: const Border(),
      title: Text(
        summary?.name.isNotEmpty == true
            ? summary!.name
            : summary?.id ?? 'Recipe',
        style: theme.textTheme.titleSmall,
      ),
      children: [
        for (final item in lines) ...[
          Text(item, style: theme.textTheme.bodySmall),
          const SizedBox(height: 4),
        ],
      ],
    ),
  );
}

Future<void> showCreateServiceDialog(BuildContext context) async {
  final controller = Get.find<FungiController>();
  final devices = controller.addressBook.toList(growable: false);
  final manifestPathController = TextEditingController();
  final serviceNameController = TextEditingController();
  var target = _CreateServiceTarget.local;
  var source = _CreateServiceSource.manifest;
  var startAfterApply = false;
  String? selectedPeerId = devices.isNotEmpty ? devices.first.peerId : null;
  final recipes = <RecipeSummary>[];
  String? selectedRecipeId;
  RecipeDetail? selectedRecipeDetail;
  var recipesRequested = false;
  var loadingRecipes = false;
  var loadingRecipeDetail = false;
  var errorMessage = '';
  var isSubmitting = false;
  var dialogActive = true;
  var recipeInstanceDirty = false;
  String? recipeInstanceSuggestion;

  void updateRecipeInstanceIfNeeded(String? recipeId) {
    if (recipeId == null || recipeId.isEmpty) {
      return;
    }

    final trimmed = serviceNameController.text.trim();
    final previousSuggestion = recipeInstanceSuggestion;
    if (!recipeInstanceDirty ||
        trimmed.isEmpty ||
        trimmed == previousSuggestion) {
      serviceNameController.text = recipeId;
      recipeInstanceDirty = false;
    }
    recipeInstanceSuggestion = recipeId;
  }

  Future<void> loadRecipeDetail(
    StateSetter setState,
    String recipeId, {
    bool refresh = false,
  }) async {
    setState(() {
      loadingRecipeDetail = true;
      errorMessage = '';
    });
    try {
      final detail = await controller.getServiceRecipeDetail(
        recipeId: recipeId,
        refresh: refresh,
      );
      if (!dialogActive) {
        return;
      }
      setState(() {
        selectedRecipeDetail = detail;
        loadingRecipeDetail = false;
      });
    } catch (e) {
      if (!dialogActive) {
        return;
      }
      setState(() {
        loadingRecipeDetail = false;
        errorMessage = 'Failed to load recipe details: $e';
      });
    }
  }

  Future<void> loadRecipes(StateSetter setState, {bool refresh = false}) async {
    setState(() {
      recipesRequested = true;
      loadingRecipes = true;
      errorMessage = '';
    });
    try {
      final fetchedRecipes = await controller.listServiceRecipes(
        refresh: refresh,
      );
      if (!dialogActive) {
        return;
      }
      setState(() {
        recipes
          ..clear()
          ..addAll(fetchedRecipes);
        selectedRecipeId =
            recipes.any((recipe) => recipe.id == selectedRecipeId)
            ? selectedRecipeId
            : (recipes.isNotEmpty ? recipes.first.id : null);
        selectedRecipeDetail = null;
        loadingRecipes = false;
      });
      final recipeId = selectedRecipeId;
      if (recipeId != null) {
        updateRecipeInstanceIfNeeded(recipeId);
        await loadRecipeDetail(setState, recipeId, refresh: refresh);
      }
    } catch (e) {
      if (!dialogActive) {
        return;
      }
      setState(() {
        loadingRecipes = false;
        errorMessage = 'Failed to load recipes: $e';
      });
    }
  }

  try {
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            if (source == _CreateServiceSource.recipe && !recipesRequested) {
              Future<void>.microtask(() => loadRecipes(setState));
            }

            final isRemote = target == _CreateServiceTarget.remote;
            final remoteUnavailable = isRemote && devices.isEmpty;
            final isRecipe = source == _CreateServiceSource.recipe;

            Future<void> submit() async {
              if (isSubmitting) return;
              if (isRemote && selectedPeerId == null) {
                setState(() => errorMessage = 'Choose a target device first');
                return;
              }
              if (isRecipe &&
                  (selectedRecipeId == null || selectedRecipeId!.isEmpty)) {
                setState(() => errorMessage = 'Choose a recipe first');
                return;
              }
              if (!isRecipe && manifestPathController.text.trim().isEmpty) {
                setState(() => errorMessage = 'Select a service file first');
                return;
              }
              setState(() {
                errorMessage = '';
                isSubmitting = true;
              });
              try {
                final ServiceApplyResult result;
                if (isRecipe) {
                  final instanceName = serviceNameController.text.trim();
                  final resolved = await controller.resolveServiceRecipe(
                    recipeId: selectedRecipeId!,
                    serviceName: instanceName.isEmpty ? null : instanceName,
                    peerId: isRemote ? selectedPeerId : null,
                  );
                  if (!dialogContext.mounted) return;
                  final shouldContinue = await _showRecipeWarningsDialog(
                    dialogContext,
                    resolved.warnings,
                  );
                  if (!shouldContinue || !dialogContext.mounted) return;
                  result = isRemote
                      ? await controller.createRemoteServiceFromResolvedRecipe(
                          peerId: selectedPeerId!,
                          resolved: resolved,
                          startAfterApply: startAfterApply,
                        )
                      : await controller.createLocalServiceFromResolvedRecipe(
                          resolved,
                          startAfterApply: startAfterApply,
                        );
                } else {
                  final manifestPath = manifestPathController.text.trim();
                  result = isRemote
                      ? await controller.pullRemoteServiceFromPath(
                          peerId: selectedPeerId!,
                          manifestPath: manifestPath,
                          startAfterApply: startAfterApply,
                        )
                      : await controller.pullLocalServiceFromPath(
                          manifestPath,
                          startAfterApply: startAfterApply,
                        );
                }
                if (!dialogContext.mounted) return;
                if (result.isComplete) {
                  Navigator.of(dialogContext).pop();
                } else {
                  setState(() => errorMessage = result.message);
                }
              } catch (error) {
                if (dialogContext.mounted) {
                  setState(
                    () => errorMessage = remoteDeviceErrorMessage(error),
                  );
                }
              } finally {
                if (dialogContext.mounted) setState(() => isSubmitting = false);
              }
            }

            return PopScope(
              canPop: !isSubmitting,
              child: AlertDialog(
                constraints: const BoxConstraints(maxWidth: 640),
                title: const Text('Apply Service'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Apply a service file or an official recipe on this device or a saved device.',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ChoiceChip(
                            label: const Text('Service File'),
                            selected: source == _CreateServiceSource.manifest,
                            onSelected: isSubmitting
                                ? null
                                : (_) {
                                    setState(() {
                                      source = _CreateServiceSource.manifest;
                                      errorMessage = '';
                                    });
                                  },
                          ),
                          ChoiceChip(
                            label: const Text('Recipe'),
                            selected: source == _CreateServiceSource.recipe,
                            onSelected: isSubmitting
                                ? null
                                : (_) {
                                    setState(() {
                                      source = _CreateServiceSource.recipe;
                                      errorMessage = '';
                                    });
                                  },
                          ),
                        ],
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
                            'Save a device in Devices before applying to another device.',
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
                                    child: Text(
                                      _createServiceDeviceLabel(peer),
                                    ),
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
                      if (isRecipe) ...[
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Recipes come from the daemon-backed official catalog and resolve into an effective service file before apply.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            TextButton(
                              onPressed: isSubmitting || loadingRecipes
                                  ? null
                                  : () => loadRecipes(setState, refresh: true),
                              child: const Text('Refresh'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        DropdownButtonFormField<String>(
                          initialValue: selectedRecipeId,
                          decoration: const InputDecoration(
                            labelText: 'Recipe',
                          ),
                          items: recipes
                              .map(
                                (recipe) => DropdownMenuItem<String>(
                                  value: recipe.id,
                                  child: Text(
                                    '${recipe.name} (${_recipeRuntimeLabel(recipe)})',
                                  ),
                                ),
                              )
                              .toList(growable: false),
                          onChanged: isSubmitting || loadingRecipes
                              ? null
                              : (value) {
                                  if (value == null ||
                                      value == selectedRecipeId) {
                                    return;
                                  }
                                  setState(() {
                                    selectedRecipeId = value;
                                    selectedRecipeDetail = null;
                                    errorMessage = '';
                                  });
                                  updateRecipeInstanceIfNeeded(value);
                                  Future<void>.microtask(
                                    () => loadRecipeDetail(setState, value),
                                  );
                                },
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: serviceNameController,
                          enabled: !isSubmitting,
                          onChanged: (value) {
                            final trimmedValue = value.trim();
                            final trimmedSuggestion =
                                (recipeInstanceSuggestion ?? '').trim();
                            recipeInstanceDirty =
                                trimmedValue.isNotEmpty &&
                                trimmedValue != trimmedSuggestion;
                          },
                          decoration: const InputDecoration(
                            labelText: 'Instance name',
                            hintText: 'Defaults to the recipe ID',
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (loadingRecipes || loadingRecipeDetail)
                          const Center(child: CircularProgressIndicator())
                        else if (selectedRecipeDetail != null)
                          _buildRecipeDetailCard(context, selectedRecipeDetail!)
                        else if (recipesRequested && recipes.isEmpty)
                          Text(
                            'No recipes are currently available.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                      ] else ...[
                        TextField(
                          controller: manifestPathController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            labelText: 'Service file',
                            hintText: 'Select a .fungi.md service file',
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextButton.icon(
                          onPressed: isSubmitting
                              ? null
                              : () async {
                                  final result = await FilePicker.platform
                                      .pickFiles(
                                        type: FileType.custom,
                                        allowedExtensions: const [
                                          'md',
                                          'markdown',
                                        ],
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
                          label: const Text('Choose Service File'),
                        ),
                      ],
                      const SizedBox(height: 12),
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Start after applying'),
                        subtitle: const Text(
                          'Confirm that the service is running before finishing.',
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: startAfterApply,
                        onChanged: isSubmitting
                            ? null
                            : (value) {
                                setState(
                                  () => startAfterApply = value ?? false,
                                );
                              },
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
                          'Remote apply stays available here, but it needs a saved device first.',
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
                    onPressed: isSubmitting || remoteUnavailable
                        ? null
                        : submit,
                    icon: isSubmitting
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(
                            isRecipe ? Icons.auto_awesome : Icons.add_circle,
                          ),
                    label: Text(
                      startAfterApply
                          ? 'Apply & Start'
                          : isRemote
                          ? 'Apply to Device'
                          : 'Apply Here',
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  } finally {
    dialogActive = false;
  }
}

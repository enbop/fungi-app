import 'package:flutter/material.dart';
import 'package:fungi_app/app/controllers/fungi_controller.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';
import 'package:fungi_app/ui/widgets/service_management_widgets.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

const _stableUserRootDirName = 'Fungi';
const _devUserRootDirName = 'FungiDev';
const _workspaceDirName = 'workspace';
const _appdataDirName = 'appdata';

class _NamedHostPathOption {
  const _NamedHostPathOption({
    required this.title,
    required this.path,
    required this.description,
  });

  final String title;
  final String path;
  final String description;
}

class _AllowedHostPathEntry {
  const _AllowedHostPathEntry({required this.title, required this.subtitle});

  final String title;
  final String subtitle;
}

class AdvancedPage extends GetView<FungiController> {
  const AdvancedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final runtimeConfig = controller.runtimeConfig.value;
      final configFilePath = controller.configFilePath.value;
      final allowedHostPathEntries = _allowedHostPathEntries(
        runtimeConfig.allowedHostPaths,
        configFilePath,
      );

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
                  Text(
                    'Allowed Host Paths',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  if (allowedHostPathEntries.isEmpty)
                    const ManagementEmptyStateCard(
                      message: 'No allowed host paths configured yet.',
                    )
                  else
                    ...allowedHostPathEntries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: _AllowedHostPathCard(entry: entry),
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

  List<_AllowedHostPathEntry> _allowedHostPathEntries(
    Iterable<String> allowedHostPaths,
    String configFilePath,
  ) {
    final namedOptionsByPath = {
      // TODO: Stop inferring aliases in the app once the daemon returns
      // named allowed host paths directly.
      for (final option in _namedHostPathOptions(
        allowedHostPaths,
        configFilePath,
      ))
        option.path: option,
    };

    final paths = allowedHostPaths.map(_normalizeHostPath).toSet().toList()
      ..sort((left, right) {
        final leftOrder = _hostPathSortOrder(namedOptionsByPath[left]?.title);
        final rightOrder = _hostPathSortOrder(namedOptionsByPath[right]?.title);
        if (leftOrder != rightOrder) {
          return leftOrder.compareTo(rightOrder);
        }
        return left.compareTo(right);
      });

    return paths
        .map((path) {
          final namedOption = namedOptionsByPath[path];
          return _AllowedHostPathEntry(
            title: namedOption?.title ?? path,
            subtitle: namedOption == null
                ? 'Sandboxed services on this device may access this directory.'
                : '$path\n${namedOption.description}',
          );
        })
        .toList(growable: false);
  }

  List<_NamedHostPathOption> _namedHostPathOptions(
    Iterable<String> allowedHostPaths,
    String configFilePath,
  ) {
    final fungiHomePath = _resolveFungiHomePath(configFilePath);
    final userRootPath = _resolveUserRootPath(allowedHostPaths, configFilePath);
    if (fungiHomePath == null && userRootPath == null) {
      return const [];
    }

    return [
      if (fungiHomePath != null)
        _NamedHostPathOption(
          title: 'Fungi appdata',
          path: _normalizeHostPath(p.join(fungiHomePath, _appdataDirName)),
          description:
              'Fungi runtime-managed app data lives under this directory.',
        ),
      if (userRootPath != null)
        _NamedHostPathOption(
          title: r'$fungi.workspace',
          path: _normalizeHostPath(p.join(userRootPath, _workspaceDirName)),
          description: 'Services refer to this directory as \$fungi.workspace.',
        ),
      if (userRootPath != null)
        _NamedHostPathOption(
          title: r'$fungi.root',
          path: userRootPath,
          description: 'Services refer to this directory as \$fungi.root.',
        ),
    ];
  }

  String? _resolveFungiHomePath(String configFilePath) {
    final trimmedConfigPath = configFilePath.trim();
    if (trimmedConfigPath.isEmpty) {
      return null;
    }

    return _normalizeHostPath(p.dirname(trimmedConfigPath));
  }

  String? _resolveUserRootPath(
    Iterable<String> allowedHostPaths,
    String configFilePath,
  ) {
    for (final rawPath in allowedHostPaths) {
      final normalizedPath = _normalizeHostPath(rawPath);
      if (_looksLikeUserRoot(normalizedPath)) {
        return normalizedPath;
      }
      if (_isWorkspaceRoot(normalizedPath)) {
        return _normalizeHostPath(p.dirname(normalizedPath));
      }
    }

    final fungiHomePath = _resolveFungiHomePath(configFilePath);
    if (fungiHomePath == null) {
      return null;
    }

    final userRootDirName = _looksLikeNightlyFungiHome(fungiHomePath)
        ? _devUserRootDirName
        : _stableUserRootDirName;
    return _normalizeHostPath(
      p.join(p.dirname(fungiHomePath), userRootDirName),
    );
  }

  bool _looksLikeUserRoot(String path) {
    final baseName = p.basename(path);
    return baseName == _stableUserRootDirName ||
        baseName == _devUserRootDirName;
  }

  bool _isWorkspaceRoot(String path) {
    return p.basename(path) == _workspaceDirName &&
        _looksLikeUserRoot(_normalizeHostPath(p.dirname(path)));
  }

  bool _looksLikeNightlyFungiHome(String fungiHomePath) {
    final baseName = p.basename(fungiHomePath).toLowerCase();
    return baseName.contains('nightly') || baseName.contains('dev');
  }

  int _hostPathSortOrder(String? title) {
    switch (title) {
      case 'Fungi appdata':
        return 0;
      case r'$fungi.workspace':
        return 1;
      case r'$fungi.root':
        return 2;
      default:
        return 3;
    }
  }

  String _normalizeHostPath(String path) {
    return p.normalize(path);
  }
}

class _AllowedHostPathCard extends StatelessWidget {
  const _AllowedHostPathCard({required this.entry});

  final _AllowedHostPathEntry entry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: EnhancedCard(
        margin: EdgeInsets.zero,
        elevation: 1,
        borderRadius: 14,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                entry.title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 2),
              Text(
                entry.subtitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

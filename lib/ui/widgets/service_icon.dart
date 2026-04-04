import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceIcon extends StatelessWidget {
  const ServiceIcon({
    super.key,
    required this.iconUrl,
    required this.fallbackLabel,
    this.size = 40,
    this.borderRadius = 12,
  });

  final String? iconUrl;
  final String fallbackLabel;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final fallback = _FallbackIcon(
      fallbackLabel: fallbackLabel,
      size: size,
      borderRadius: borderRadius,
    );

    if (iconUrl == null || iconUrl!.trim().isEmpty) {
      return fallback;
    }

    if (_looksLikeSvg(iconUrl!)) {
      return FutureBuilder<String>(
        future: _loadSanitizedSvg(iconUrl!),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return _LoadingIcon(size: size);
          }

          if (!snapshot.hasData) {
            return fallback;
          }

          return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: SizedBox(
              width: size,
              height: size,
              child: Padding(
                padding: EdgeInsets.all(size * 0.04),
                child: SvgPicture.string(
                  snapshot.data!,
                  width: size,
                  height: size,
                  fit: BoxFit.contain,
                  placeholderBuilder: (_) => _LoadingIcon(size: size),
                ),
              ),
            ),
          );
        },
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl: iconUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        fadeInDuration: const Duration(milliseconds: 120),
        placeholder: (_, _) => _LoadingIcon(size: size),
        errorWidget: (_, _, _) => fallback,
      ),
    );
  }

  bool _looksLikeSvg(String value) {
    final normalized = value.toLowerCase();
    return normalized.endsWith('.svg') || normalized.contains('.svg?');
  }

  Future<String> _loadSanitizedSvg(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);
    final raw = await file.readAsString();
    return _sanitizeSvg(raw);
  }

  String _sanitizeSvg(String raw) {
    var svg = raw
        .replaceAll(RegExp(r'<!DOCTYPE[^>]*>', caseSensitive: false), '')
        .replaceAll(
          RegExp(r'<metadata[^>]*>[\s\S]*?<\/metadata>', caseSensitive: false),
          '',
        )
        .replaceAll(RegExp(r'<metadata[^>]*/>', caseSensitive: false), '');

    final classStyles = <String, String>{};
    final styleBlockMatches = RegExp(
      r'<style[^>]*>([\s\S]*?)<\/style>',
      caseSensitive: false,
    ).allMatches(svg);

    for (final match in styleBlockMatches) {
      final content = match.group(1) ?? '';
      final classMatches = RegExp(
        r'\.([A-Za-z0-9_-]+)\s*\{([^}]*)\}',
        caseSensitive: false,
      ).allMatches(content);

      for (final classMatch in classMatches) {
        final name = classMatch.group(1);
        final body = classMatch.group(2);
        if (name == null || body == null) {
          continue;
        }

        final normalized = body
            .split(';')
            .map((entry) => entry.trim())
            .where((entry) => entry.isNotEmpty)
            .join(';');
        if (normalized.isNotEmpty) {
          classStyles[name] = normalized;
        }
      }
    }

    svg = svg.replaceAll(
      RegExp(r'<style[^>]*>[\s\S]*?<\/style>', caseSensitive: false),
      '',
    );
    svg = svg.replaceAll(
      RegExp(r'<defs>\s*<\/defs>', caseSensitive: false),
      '',
    );

    classStyles.forEach((className, style) {
      svg = svg.replaceAllMapped(
        RegExp('class="${RegExp.escape(className)}"'),
        (match) => 'style="$style"',
      );
      svg = svg.replaceAllMapped(
        RegExp("class='${RegExp.escape(className)}'"),
        (match) => 'style="$style"',
      );
    });

    return svg;
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      child: SizedBox(
        width: size * 0.4,
        height: size * 0.4,
        child: const CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }
}

class _FallbackIcon extends StatelessWidget {
  const _FallbackIcon({
    required this.fallbackLabel,
    required this.size,
    required this.borderRadius,
  });

  final String fallbackLabel;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initial = fallbackLabel.trim().isEmpty
        ? '?'
        : fallbackLabel.trim().characters.first.toUpperCase();

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        initial,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

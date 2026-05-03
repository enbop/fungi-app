import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

Future<void> copyTextValue(
  String value, {
  String successMessage = 'Copied to clipboard',
}) async {
  await Clipboard.setData(ClipboardData(text: value));
  SmartDialog.showToast(successMessage);
}

class CompactBadge extends StatelessWidget {
  const CompactBadge({
    super.key,
    required this.label,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
  });

  final String label;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(999),
        border: borderColor == null ? null : Border.all(color: borderColor!),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: foregroundColor ?? colorScheme.onSurfaceVariant,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ServiceOriginBadge extends StatelessWidget {
  const ServiceOriginBadge.local({super.key}) : isRemote = false;

  const ServiceOriginBadge.remote({super.key}) : isRemote = true;

  final bool isRemote;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return CompactBadge(
      label: isRemote ? 'Remote' : 'Local',
      backgroundColor: isRemote
          ? colorScheme.tertiaryContainer
          : colorScheme.primaryContainer,
      foregroundColor: isRemote
          ? colorScheme.onTertiaryContainer
          : colorScheme.onPrimaryContainer,
    );
  }
}

class CopyIconButton extends StatelessWidget {
  const CopyIconButton({
    super.key,
    required this.value,
    this.tooltip = 'Copy',
    this.successMessage = 'Copied to clipboard',
    this.iconSize = 18,
    this.color,
    this.onCopied,
  });

  final String value;
  final String tooltip;
  final String successMessage;
  final double iconSize;
  final Color? color;
  final VoidCallback? onCopied;

  Future<void> _handleCopy() async {
    await Clipboard.setData(ClipboardData(text: value));
    if (onCopied != null) {
      onCopied!();
      return;
    }

    SmartDialog.showToast(successMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      waitDuration: const Duration(milliseconds: 500),
      child: IconButton(
        visualDensity: VisualDensity.compact,
        constraints: const BoxConstraints.tightFor(width: 20, height: 20),
        padding: EdgeInsets.zero,
        splashRadius: 14,
        onPressed: _handleCopy,
        icon: Icon(
          Icons.copy_all,
          size: iconSize,
          color: color ?? Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class CopyableValueCard extends StatelessWidget {
  const CopyableValueCard({
    super.key,
    required this.label,
    required this.value,
    this.compact = false,
    this.successMessage = 'Copied to clipboard',
  });

  final String label;
  final String value;
  final bool compact;
  final String successMessage;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: compact
          ? const EdgeInsets.fromLTRB(12, 10, 8, 10)
          : const EdgeInsets.fromLTRB(12, 12, 8, 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.labelMedium),
                const SizedBox(height: 4),
                SelectableText(
                  value,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          CopyIconButton(value: value, successMessage: successMessage),
        ],
      ),
    );
  }
}

class InlineAddButton extends StatelessWidget {
  const InlineAddButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      ),
      icon: const Icon(Icons.add_circle),
      label: Text(label),
    );
  }
}

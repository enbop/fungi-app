import 'package:flutter/material.dart';

class HelpTooltip extends StatelessWidget {
  const HelpTooltip({
    super.key,
    required this.title,
    required this.message,
    this.iconSize = 18,
  });

  final String title;
  final String message;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Tooltip(
      message: message,
      waitDuration: const Duration(milliseconds: 350),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => showDialog<void>(
          context: context,
          builder: (_) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(
            Icons.help_outline,
            size: iconSize,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

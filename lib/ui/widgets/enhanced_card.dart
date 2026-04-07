import 'package:flutter/material.dart';

class EnhancedCard extends StatelessWidget {
  final Widget child;
  final Color? accentColor;
  final double elevation;
  final double borderRadius;
  final double borderWidth;

  const EnhancedCard({
    super.key,
    required this.child,
    this.accentColor,
    this.elevation = 4,
    this.borderRadius = 8,
    this.borderWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveAccentColor =
        accentColor ?? Theme.of(context).colorScheme.primary;

    return Card(
      elevation: elevation,
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shadowColor: effectiveAccentColor.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: effectiveAccentColor.withValues(alpha: 0.3),
          width: borderWidth,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: Theme.of(context).colorScheme.surface,
        ),
        child: child,
      ),
    );
  }
}

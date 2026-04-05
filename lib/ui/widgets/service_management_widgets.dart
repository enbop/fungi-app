import 'package:flutter/material.dart';
import 'package:fungi_app/ui/widgets/enhanced_card.dart';

class ServiceManagementCard extends StatelessWidget {
  const ServiceManagementCard({
    super.key,
    required this.header,
    this.badges = const [],
    this.sections = const [],
    this.actions = const [],
    this.accentColor,
  });

  final Widget header;
  final List<Widget> badges;
  final List<Widget> sections;
  final List<Widget> actions;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      accentColor: accentColor,
      borderRadius: 18,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header,
            if (badges.isNotEmpty) ...[
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 8,
                  children: badges,
                ),
              ),
            ],
            if (sections.isNotEmpty) ...[
              const SizedBox(height: 10),
              ...sections,
            ],
            if (actions.isNotEmpty) ...[
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                  spacing: 8,
                  runSpacing: 8,
                  children: actions,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class ServiceStatusBadge extends StatelessWidget {
  const ServiceStatusBadge({
    super.key,
    required this.label,
    required this.active,
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = active ? colorScheme.tertiary : colorScheme.outline;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: color.withValues(alpha: 0.35)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
      ),
    );
  }
}

class ServicePillLabel extends StatelessWidget {
  const ServicePillLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
      ),
      child: Text(label, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}

class ServiceActionButton extends StatelessWidget {
  const ServiceActionButton({
    super.key,
    required this.label,
    required this.isBusy,
    required this.onPressed,
  });

  final String label;
  final bool isBusy;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isBusy) ...[
            const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 8),
          ],
          Text(label),
        ],
      ),
    );
  }
}

class ManagementSectionTitle extends StatelessWidget {
  const ManagementSectionTitle({
    super.key,
    required this.title,
    this.bottomSpacing = 8,
  });

  final String title;
  final double bottomSpacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpacing),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class ManagementItemCard extends StatelessWidget {
  const ManagementItemCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(10),
    this.borderRadius = 14,
    this.elevation = 1,
    this.accentColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double elevation;
  final Color? accentColor;

  @override
  Widget build(BuildContext context) {
    return EnhancedCard(
      accentColor: accentColor,
      borderRadius: borderRadius,
      elevation: elevation,
      child: Padding(padding: padding, child: child),
    );
  }
}

class ManagementEmptyStateCard extends StatelessWidget {
  const ManagementEmptyStateCard({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return ManagementItemCard(
      child: Text(message, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}

class ManagementActionItemCard extends StatelessWidget {
  const ManagementActionItemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    required this.onAction,
  });

  final String title;
  final String subtitle;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return ManagementItemCard(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 2),
                Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: 8),
          TextButton(onPressed: onAction, child: Text(actionLabel)),
        ],
      ),
    );
  }
}

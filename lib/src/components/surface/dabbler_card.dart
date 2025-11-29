import 'package:flutter/material.dart';

import '../../foundation/shadows.dart';
import '../../foundation/spacing.dart';
import '../../mode/app_mode.dart';

/// Surface container with Lite/Pro styling.
class DabblerCard extends StatelessWidget {
  /// Mode controlling density and styling.
  final AppMode mode;

  /// Child widget to display inside the card.
  final Widget child;

  /// Optional custom padding; defaults vary per mode.
  final EdgeInsetsGeometry? padding;

  /// Optional tap callback when the card is interactive.
  final VoidCallback? onTap;

  const DabblerCard({
    super.key,
    required this.child,
    this.mode = AppMode.lite,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final content = Padding(
      padding: padding ??
          EdgeInsets.all(
            mode == AppMode.lite ? DabblerSpacing.md : DabblerSpacing.sm,
          ),
      child: child,
    );

    final card = Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(
          mode == AppMode.lite ? 16 : 12,
        ),
        boxShadow: DabblerShadows.card(mode),
      ),
      child: content,
    );

    if (onTap == null) return card;

    return InkWell(
      borderRadius: BorderRadius.circular(
        mode == AppMode.lite ? 16 : 12,
      ),
      onTap: onTap,
      child: card,
    );
  }
}

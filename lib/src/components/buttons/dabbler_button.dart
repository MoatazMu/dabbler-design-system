import 'package:flutter/material.dart';

import '../../foundation/spacing.dart';
import '../../mode/app_mode.dart';

/// Supported visual variants for [DabblerButton].
enum DabblerButtonVariant {
  primary,
  secondary,
  ghost,
}

/// Primary button component that adapts to [AppMode].
class DabblerButton extends StatelessWidget {
  /// Text label shown inside the button.
  final String label;

  /// Callback executed when the button is pressed.
  final VoidCallback? onPressed;

  /// Visual/behavioral mode for the button.
  final AppMode mode;

  /// Style variant for the button.
  final DabblerButtonVariant variant;

  /// Whether the button should expand to the parent's width.
  final bool fullWidth;

  const DabblerButton({
    super.key,
    required this.label,
    this.onPressed,
    this.mode = AppMode.lite,
    this.variant = DabblerButtonVariant.primary,
    this.fullWidth = true,
  });

  /// Convenience constructor for Lite mode primary buttons.
  const DabblerButton.lite({
    super.key,
    required this.label,
    this.onPressed,
    this.fullWidth = true,
  })  : mode = AppMode.lite,
        variant = DabblerButtonVariant.primary;

  /// Convenience constructor for Pro mode buttons with a chosen [variant].
  const DabblerButton.pro({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = DabblerButtonVariant.primary,
    this.fullWidth = true,
  }) : mode = AppMode.pro;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = _buildStyle(theme);

    final child = Text(
      label,
      style: theme.textTheme.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );

    final button = ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );

    if (!fullWidth) return button;

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }

  ButtonStyle _buildStyle(ThemeData theme) {
    final colorScheme = theme.colorScheme;

    switch (mode) {
      case AppMode.lite:
        return ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: DabblerSpacing.lg,
            vertical: DabblerSpacing.sm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        );

      case AppMode.pro:
        switch (variant) {
          case DabblerButtonVariant.primary:
            return ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: DabblerSpacing.md,
                vertical: DabblerSpacing.xs,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: colorScheme.secondaryContainer,
              foregroundColor: colorScheme.onSecondaryContainer,
            );
          case DabblerButtonVariant.secondary:
            return ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: DabblerSpacing.md,
                vertical: DabblerSpacing.xs,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: colorScheme.primary,
              side: BorderSide(color: colorScheme.primary),
            );
          case DabblerButtonVariant.ghost:
            return ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: DabblerSpacing.md,
                vertical: DabblerSpacing.xs,
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: colorScheme.secondary,
              shadowColor: Colors.transparent,
            );
        }
    }
  }
}

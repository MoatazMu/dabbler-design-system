import 'package:flutter/material.dart';

import '../foundation/colors.dart';
import '../foundation/typography.dart';
import '../mode/app_mode.dart';

/// Entry point for building design-system aware [ThemeData].
class DabblerTheme {
  /// Builds a [ThemeData] instance for the given [mode] and [brightness].
  static ThemeData theme({
    required AppMode mode,
    Brightness brightness = Brightness.light,
  }) {
    final colorScheme = DabblerColors.colorScheme(mode, brightness);
    final textTheme = DabblerTypography.textTheme(mode);
    final scaffoldColor = colorScheme.surfaceContainerLowest;

    final base = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: brightness,
      textTheme: textTheme,
      scaffoldBackgroundColor: scaffoldColor,
      cardColor: colorScheme.surface,
    );

    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

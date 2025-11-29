import 'package:flutter/material.dart';

import '../mode/app_mode.dart';

/// Color helpers for Dabbler themes.
class DabblerColors {
  /// Builds a [ColorScheme] tuned for [mode] and [brightness].
  static ColorScheme colorScheme(AppMode mode, Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    switch (mode) {
      case AppMode.lite:
        return isDark
            ? ColorScheme.dark(
                primary: const Color(0xFF3B82F6),
                secondary: const Color(0xFF22C55E),
                surface: const Color(0xFF020617),
              ).copyWith(
                surfaceContainerLowest: const Color(0xFF0B1220),
              )
            : ColorScheme.light(
                primary: const Color(0xFF3B82F6),
                secondary: const Color(0xFF22C55E),
                surface: const Color(0xFFFFFFFF),
              ).copyWith(
                surfaceContainerLowest: const Color(0xFFF9FAFB),
              );

      case AppMode.pro:
        return isDark
            ? ColorScheme.dark(
                primary: const Color(0xFF6366F1),
                secondary: const Color(0xFFEC4899),
                surface: const Color(0xFF020617),
              ).copyWith(
                surfaceContainerLowest: const Color(0xFF080C16),
              )
            : ColorScheme.dark(
                // Pro is primarily dark mode in spirit; we can still build a "dark-ish" scheme for light.
                primary: const Color(0xFF6366F1),
                secondary: const Color(0xFFEC4899),
                surface: const Color(0xFF0B1120),
              ).copyWith(
                surfaceContainerLowest: const Color(0xFF0F1626),
              );
    }
  }
}

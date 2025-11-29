import 'package:flutter/material.dart';

import '../mode/app_mode.dart';

/// Typography scales that differ between Lite and Pro.
class DabblerTypography {
  /// Returns the [TextTheme] tailored for the provided [mode].
  static TextTheme textTheme(AppMode mode) {
    switch (mode) {
      case AppMode.lite:
        return Typography.blackMountainView.copyWith(
          bodyMedium: const TextStyle(fontSize: 14, height: 1.5),
          bodyLarge: const TextStyle(fontSize: 16, height: 1.5),
          titleMedium: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          titleLarge: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        );
      case AppMode.pro:
        return Typography.whiteMountainView.copyWith(
          bodyMedium: const TextStyle(fontSize: 13, height: 1.4),
          bodyLarge: const TextStyle(fontSize: 15, height: 1.4),
          titleMedium: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          titleLarge: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
        );
    }
  }
}

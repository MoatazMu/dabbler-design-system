import 'package:flutter/material.dart';

import '../mode/app_mode.dart';

/// Shadow presets for the design system.
class DabblerShadows {
  /// Card shadow set tuned per [AppMode].
  static List<BoxShadow> card(AppMode mode) {
    switch (mode) {
      case AppMode.lite:
        return const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ];
      case AppMode.pro:
        return const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ];
    }
  }
}

// ignore_for_file: unnecessary_library_name

library dabbler_design_system;

import 'package:flutter/material.dart';

/// Very simple test widget to prove the design system is connected.
class DabblerHello extends StatelessWidget {
  const DabblerHello({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Hello from Dabbler Design System',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

import 'package:dabbler_design_system/dabbler_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('DabblerTheme builds ThemeData', () {
    final liteTheme = DabblerTheme.theme(mode: AppMode.lite);
    final proTheme = DabblerTheme.theme(mode: AppMode.pro, brightness: Brightness.dark);

    expect(liteTheme, isA<ThemeData>());
    expect(proTheme.brightness, Brightness.dark);
  });

  testWidgets('DabblerButton renders label', (tester) async {
    const label = 'Tap Me';
    await tester.pumpWidget(
      MaterialApp(
        theme: DabblerTheme.theme(mode: AppMode.lite),
        home: const Scaffold(
          body: DabblerButton.lite(label: label),
        ),
      ),
    );

    expect(find.text(label), findsOneWidget);
  });

  testWidgets('DabblerCard applies tap behavior', (tester) async {
    var tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: DabblerTheme.theme(mode: AppMode.pro, brightness: Brightness.dark),
        home: Scaffold(
          body: Center(
            child: DabblerCard(
              mode: AppMode.pro,
              onTap: () => tapped = true,
              child: const Text('Card content'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Card content'));
    await tester.pumpAndSettle();

    expect(tapped, isTrue);
  });
}

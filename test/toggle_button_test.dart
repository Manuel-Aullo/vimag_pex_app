import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vimag_pex_app/widgets/toggle_button.dart';

void main() {
  testWidgets('ToggleButton calls onToggle callback when tapped', (
    WidgetTester tester,
  ) async {
    bool toggled = false;

    // Build a minimal widget tree containing the ToggleButton.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ToggleButton(
            onToggle: () {
              toggled = true;
            },
          ),
        ),
      ),
    );

    // Ensure the ToggleButton is present.
    expect(find.byType(ToggleButton), findsOneWidget);

    // Tap the ToggleButton.
    await tester.tap(find.byType(ToggleButton));
    await tester.pumpAndSettle();

    // Verify that onToggle has been called.
    expect(toggled, isTrue);
  });
}

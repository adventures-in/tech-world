// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Initial view shows Checking Auth State',
      (WidgetTester tester) async {
    final widget = AdventuresInApp();
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(widget);

    // Create the Finders.
    final titleFinder = find.text('Checking Auth State');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}

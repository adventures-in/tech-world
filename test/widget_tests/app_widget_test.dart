// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:adventures_in_tech_world/widgets/app/initializing_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../utils/completable_app_harness.dart';

void main() {
  group('AdventuresInApp', () {
    testWidgets('completes initialization and displays relevant prompts',
        (WidgetTester tester) async {
      // Create the Finders.
      final initializingIndicatorFinder = find.byType(InitializingIndicator);

      // Create a test harness that wraps the App widget.
      final harness = CompletableAppHarnessWithFakeStore();

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      expect(initializingIndicatorFinder, findsOneWidget);

      // Verify the expected text is shown, indicating waiting for Firebase init
      expect(find.text('Firing up the machine...'), findsOneWidget);

      harness.completeFirebase();

      await tester.pump();

      // Verify the expected text is shown, indicating waiting for redux init
      expect(find.text('Plumbing the streams...'), findsOneWidget);

      harness.completeRedux();

      await tester.pump();

      expect(initializingIndicatorFinder, findsNothing);
    });
  });
}

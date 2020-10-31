import 'package:adventures_in_tech_world/widgets/home/home_page.dart';
import 'package:adventures_in_tech_world/widgets/projects/projects_page.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_test_harness.dart';

void main() {
  group('HomePage', () {
    testWidgets('shows ProjectPage when there is user data in the app state',
        (WidgetTester tester) async {
      final harness = WidgetTestHarness(
          widgetUnderTest: HomePage(),
          stateUpdates: (b) => b
            ..adventurer.id = '1'
            ..adventurer.displayName = 'name'
            ..adventurer.photoURL = 'url');

      // Build the widget tree.
      await tester.pumpWidget(harness.widget);

      expect(find.byType(ProjectsPage), findsOneWidget);
    });
  });
}

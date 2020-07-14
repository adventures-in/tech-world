// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/app_reducer.dart';
import 'package:adventures_in_tech_world/widgets/home/home_page.dart';
import 'package:adventures_in_tech_world/widgets/projects/projects_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import '../utils/image_test_utils.dart';

void main() {
  testWidgets('Home Page...', (WidgetTester tester) async {
    // Setup the app state with expected values
    final initialAppState = AppState.init().rebuild((b) => b
      ..adventurer.id = '1'
      ..adventurer.displayName = 'name'
      ..adventurer.photoURL = 'url');
    // Create the widgets.
    final store = Store<AppState>(appReducer, initialState: initialAppState);
    final wut = HomePage();
    final harness =
        StoreProvider<AppState>(store: store, child: MaterialApp(home: wut));

    await provideMockedNetworkImages(() async {
      // Tell the tester to build the widget tree.
      await tester.pumpWidget(harness);
    });

    // Create the Finders.
    final titleFinder = find.byType(ProjectsPage);

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that ProjectsPage is shown
    expect(titleFinder, findsOneWidget);
  });
}

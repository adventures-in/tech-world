// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/app_reducer.dart';
import 'package:adventures_in_tech_world/widgets/adventures_in_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('Initial view shows Checking Auth State',
      (WidgetTester tester) async {
    final store = Store<AppState>(appReducer, initialState: AppState.init());
    final navKey = GlobalKey<NavigatorState>();
    final widget = AdventuresInApp(store, navKey);
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(widget);

    // Create the Finders.
    final titleFinder = find.text('Checking Auth State');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}

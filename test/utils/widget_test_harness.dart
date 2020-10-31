import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../mocks/redux/redux_store_mocks.dart';

/// A test harness to wrap a widget under test and provide all the functionality
/// that a test may want in order to interact with the widget or check for
/// expected values and behaviour.
class WidgetTestHarness {
  final FakeStore _fakeStore;
  final Widget _widgetUnderTest;

  WidgetTestHarness(
      {@required Widget widgetUnderTest,
      FakeStore fakeStore,
      dynamic Function(AppStateBuilder) stateUpdates})
      : _fakeStore = fakeStore ?? FakeStore(),
        _widgetUnderTest = widgetUnderTest {
    if (stateUpdates != null) {
      _fakeStore.updateState(stateUpdates);
    }
  }

  // Allow the test to update the app state.
  //
  // We a style guide entry asking contributors to consider splitting up tests
  // rather than changing the app state and continuing the test.
  //
  // See Style Guide > CONSIDER splitting up widget tests that change the app state
  void updateAppState(dynamic Function(AppStateBuilder) updates) =>
      _fakeStore.updateState(updates);

  Widget get widget => StoreProvider<AppState>(
      store: _fakeStore, child: MaterialApp(home: _widgetUnderTest));

  AppState get state => _fakeStore.state;

  List<ReduxAction> get receivedActions => _fakeStore.dispatchedActions;
}

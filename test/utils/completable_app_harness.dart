import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/widgets/app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import '../mocks/redux/redux_store_mocks.dart';
import '../mocks/wrappers/firebase_wrapper_mocks.dart';
import 'redux_bundle_mocks.dart';

/// A test harness to wrap the widget under test, (in this case the
/// App widget), and provide all the functionality
/// that a test may want in order to interact with the widget, including
/// completing the firebase and redux futures that are awaited in the
/// App widget.
class CompletableAppHarness {
  final _firebaseCompleter = Completer<FirebaseApp>();
  final _reduxCompleter = Completer<Store<AppState>>();

  FakeFirebaseWrapper _firebase;
  FakeReduxBundle _redux;
  AppWidget _appWidget;

  CompletableAppHarness() {
    _firebase = FakeFirebaseWrapper(completer: _firebaseCompleter);
    _redux = FakeReduxBundle(completer: _reduxCompleter);
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);
  }

  Widget get widget => _appWidget;

  void completeFirebase() => _firebaseCompleter.complete();
  void completeRedux() => _reduxCompleter.complete();
}

/// A test harness that wraps App widget to provide the
/// functionality that a test may want in order to interact with the widget,
/// including completing the firebase and redux futures that are awaited in the
/// App widget.
///
/// The harness also holds a [Store], that can be setup by passing reducers and
/// updates to the initial app state.
class CompletableAppHarnessWithStore {
  final _firebaseCompleter = Completer<FirebaseApp>();
  final _reduxCompleter = Completer<Store<AppState>>();

  FakeFirebaseWrapper _firebase;
  FakeReduxBundle _redux;
  AppWidget _appWidget;

  Store<AppState> _store;

  CompletableAppHarnessWithStore(
      {List<Reducer<AppState>> reducers,
      Function(AppStateBuilder) appStateUpdates}) {
    _firebase = FakeFirebaseWrapper(completer: _firebaseCompleter);
    _redux = FakeReduxBundle(completer: _reduxCompleter);
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);

    _store = Store<AppState>(combineReducers(reducers ?? []),
        initialState: AppState.init().rebuild(appStateUpdates));
  }

  Widget get widget => _appWidget;

  void completeFirebase() => _firebaseCompleter.complete();
  void completeRedux() => _reduxCompleter.complete(_store);
}

/// A test harness that wraps App widget to provide the
/// functionality that a test may want in order to interact with the widget,
/// including completing the firebase and redux futures that are awaited in the
/// App widget.
///
/// The harness also holds a [FakeStore], whose functionality can be accessed
/// through the harness.
class CompletableAppHarnessWithFakeStore {
  final _firebaseCompleter = Completer<FirebaseApp>();
  final _reduxCompleter = Completer<Store<AppState>>();

  final FakeStore _fakeStore;

  FakeFirebaseWrapper _firebase;
  FakeReduxBundle _redux;
  AppWidget _appWidget;

  //{FakeStore store}
  CompletableAppHarnessWithFakeStore() : _fakeStore = FakeStore() {
    _firebase = FakeFirebaseWrapper(completer: _firebaseCompleter);
    _redux = FakeReduxBundle(completer: _reduxCompleter);
    _appWidget = AppWidget(firebase: _firebase, redux: _redux);
  }

  Widget get widget => _appWidget;

  void completeFirebase() => _firebaseCompleter.complete();
  void completeRedux() => _reduxCompleter.complete(_fakeStore);

  void updateAppState(dynamic Function(AppStateBuilder) updates) =>
      _fakeStore.updateState(updates);

  AppState get state => _fakeStore.state;

  List<ReduxAction> get receivedActions => _fakeStore.dispatchedActions;
}

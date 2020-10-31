import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// A [Store] with no reducers that takes an optional [AppState] and
/// keeps a list of dispatched actions that can be queried.
class FakeStore implements Store<AppState> {
  FakeStore({dynamic Function(AppStateBuilder) updates})
      : _state = (updates == null)
            ? AppState.init()
            : AppState.init().rebuild(updates),
        _changeController = StreamController<AppState>.broadcast();

  // The list of dispatched actions that can be queried by a test.
  List<ReduxAction> dispatchedActions = <ReduxAction>[];

  //
  void updateState(dynamic Function(AppStateBuilder) updates) {
    _state = (_state.toBuilder()..update(updates)).build();
    _changeController.add(_state);
  }

  // We must override the reducer as a var in order to extend Store
  // but in our case it is always null.
  @override
  var reducer;

  // We keep our own state so we can have a default value
  AppState _state;

  // We need a StreamController to provide the onChange method
  final StreamController<AppState> _changeController;

  // Override dispatch to just add the action to the list.
  @override
  dynamic dispatch(dynamic action) {
    dispatchedActions.add(action as ReduxAction);
  }

  @override
  Stream<AppState> get onChange => _changeController.stream;

  @override
  AppState get state => _state;

  @override
  Future teardown() => _changeController.close();
}

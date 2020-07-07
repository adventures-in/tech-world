import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final adventuresReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, StoreAdventurer>(_storeAdventurer),
];

AppState _storeAdventurer(AppState state, StoreAdventurer action) {
  return state.rebuild((b) => b..adventurer.replace(action.adventurer));
}

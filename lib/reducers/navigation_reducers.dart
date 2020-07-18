import 'package:adventures_in_tech_world/actions/navigation/store_nav_selection.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final navigationReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, StoreNavSelection>(_storeNavSelection),
];

AppState _storeNavSelection(AppState state, StoreNavSelection action) {
  return state.rebuild((b) => b..navSelection = action.selection);
}

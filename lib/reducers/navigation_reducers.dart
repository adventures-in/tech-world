import 'package:adventures_in_tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final navigationReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, StoreNavBarSelection>(_storeNavBarSelection),
];

AppState _storeNavBarSelection(AppState state, StoreNavBarSelection action) {
  return state.rebuild((b) => b..navBarSelection = action.selection);
}

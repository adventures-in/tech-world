import 'package:adventures_in/actions/auth/store_auth_state.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final authReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, StoreAuthState>(_storeAuthState),
];

AppState _storeAuthState(AppState state, StoreAuthState action) {
  return state.rebuild((b) => b..authState = action.state);
}

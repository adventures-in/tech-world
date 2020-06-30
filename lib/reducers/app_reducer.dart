import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/reducers/navigation_reducers.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer =
    combineReducers<AppState>(<AppState Function(AppState, dynamic)>[
  ...navigationReducers,
]);

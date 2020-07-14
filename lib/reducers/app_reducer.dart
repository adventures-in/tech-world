import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/reducers/adventurers_reducers.dart';
import 'package:adventures_in_tech_world/reducers/auth_reducers.dart';
import 'package:adventures_in_tech_world/reducers/git_hub_reducers.dart';
import 'package:adventures_in_tech_world/reducers/navigation_reducers.dart';
import 'package:adventures_in_tech_world/reducers/problems_reducers.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application"s state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final appReducer =
    combineReducers<AppState>(<AppState Function(AppState, dynamic)>[
  ...navigationReducers,
  ...authReducers,
  ...adventuresReducers,
  ...problemsReducers,
  ...gitHubReducers,
]);

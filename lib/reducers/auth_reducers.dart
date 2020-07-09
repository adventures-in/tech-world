import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final authReducers = <AppState Function(AppState, dynamic)>[
  TypedReducer<AppState, StoreAuthState>(_storeAuthState),
  TypedReducer<AppState, StoreAuthStep>(_storeAuthStep),
  TypedReducer<AppState, StoreGitHubToken>(_storeGitHubToken),
  StoreUserDataReducer(),
];

AppState _storeAuthState(AppState state, StoreAuthState action) {
  return state.rebuild((b) => b..authState = action.state);
}

AppState _storeAuthStep(AppState state, StoreAuthStep action) {
  return state.rebuild((b) => b..authStep = action.step);
}

AppState _storeGitHubToken(AppState state, StoreGitHubToken action) {
  return state.rebuild((b) => b..gitHubToken = action.token);
}

class StoreUserDataReducer extends TypedReducer<AppState, StoreUserData> {
  StoreUserDataReducer()
      : super((state, action) {
          // if null comes through return straight away
          if (action.userData == null) {
            return state.rebuild((b) => b..userData = null);
          }

          // set the auth state and auth step based on the UserData
          var _authState = state.authState;
          var _authStep = state.authStep;
          if (action.userData.isAnonymous) {
            _authState = AuthState.signedInAnonymously;
            _authStep = AuthStep.waitingForInput;
          }

          // if (action.userData.providerId == 'github.com') {
          //   _authState = AuthState.signedInAnonymously;
          // }

          return state.rebuild((b) => b
            ..userData.replace(action.userData)
            ..authState = _authState
            ..authStep = _authStep);
        });
}

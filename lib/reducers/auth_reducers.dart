import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

/// Reducers specify how the application's state changes in response to actions
/// sent to the store.
///
/// Each reducer returns a new [AppState].
final authReducers = <AppState Function(AppState, dynamic)>[
  StoreAuthStateReducer(),
  StoreAuthStepReducer(),
  StoreGitHubTokenReducer(),
  StoreUserDataReducer(),
];

class StoreAuthStateReducer extends TypedReducer<AppState, StoreAuthState> {
  StoreAuthStateReducer()
      : super((state, action) =>
            state.rebuild((b) => b..authState = action.state));
}

class StoreAuthStepReducer extends TypedReducer<AppState, StoreAuthStep> {
  StoreAuthStepReducer()
      : super(
            (state, action) => state.rebuild((b) => b..authStep = action.step));
}

class StoreGitHubTokenReducer extends TypedReducer<AppState, StoreGitHubToken> {
  StoreGitHubTokenReducer()
      : super((state, action) {
          // set the auth state and auth step based on whether we have
          // a github token
          var _authState = state.authState;
          var _authStep = state.authStep;
          if (action.token == null) {
            _authStep = AuthStep.waitingForInput;
          } else {
            _authState = AuthState.signedInAndGitHubToken;
          }

          return state.rebuild((b) => b
            ..gitHubToken = action.token
            ..authStep = _authStep
            ..authState = _authState);
        });
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

          var _adventurer = state.adventurer;
          if (action.userData.providers.isNotEmpty) {
            // we take the first of the providers for now
            final providerData = action.userData.providers.first;
            _adventurer = Adventurer(
                id: action.userData.uid,
                displayName: providerData.displayName,
                photoURL: providerData.photoUrl);
          }

          return state.rebuild((b) => b
            ..adventurer = _adventurer?.toBuilder()
            ..userData = action.userData?.toBuilder()
            ..authState = _authState
            ..authStep = _authStep);
        });
}

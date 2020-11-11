import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/enums/auth/authorization_state.dart';
import 'package:adventures_in_tech_world/enums/auth/authorizing_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/auth/provider_state.dart';
import 'package:redux/redux.dart';

class StoreAdventurerReducer extends TypedReducer<AppState, StoreAdventurer> {
  StoreAdventurerReducer()
      : super((state, action) => state.rebuild((b) => b
          ..adventurer.replace(action.adventurer)
          ..profile.stateOf[Provider.google] = (action.adventurer.googleToken ==
                  null)
              ? ProviderState(
                  state: AuthorizationState.notAuthorized,
                  step: AuthorizingStep.waitingForInput)
              : ProviderState(
                  state: AuthorizationState.authorized,
                  step: AuthorizingStep.waitingForInput)
          ..profile.stateOf[Provider.git_hub] =
              (action.adventurer.gitHubToken == null)
                  ? ProviderState(
                      state: AuthorizationState.notAuthorized,
                      step: AuthorizingStep.waitingForInput)
                  : ProviderState(
                      state: AuthorizationState.authorized,
                      step: AuthorizingStep.waitingForInput)
          ..profile.stateOf[Provider.asana] =
              (action.adventurer.asanaToken == null)
                  ? ProviderState(
                      state: AuthorizationState.notAuthorized,
                      step: AuthorizingStep.waitingForInput)
                  : ProviderState(
                      state: AuthorizationState.authorized,
                      step: AuthorizingStep.waitingForInput)));
}

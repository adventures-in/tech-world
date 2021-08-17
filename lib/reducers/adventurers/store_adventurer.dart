import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/adventurers/store_adventurer.dart';
import 'package:tech_world/models/app/app_state.dart';

class StoreAdventurerReducer extends TypedReducer<AppState, StoreAdventurer> {
  StoreAdventurerReducer()
      : super((state, action) => state.rebuild((b) => b
          ..adventurer.replace(action.adventurer)
          ..profile.stateOf[ProvidersEnum.google] =
              (action.adventurer.googleToken == null)
                  ? ProviderState(
                      state: AuthorizationState.notAuthorized,
                      step: AuthorizingStep.waitingForInput)
                  : ProviderState(
                      state: AuthorizationState.authorized,
                      step: AuthorizingStep.waitingForInput)
          ..profile.stateOf[ProvidersEnum.gitHub] =
              (action.adventurer.gitHubToken == null)
                  ? ProviderState(
                      state: AuthorizationState.notAuthorized,
                      step: AuthorizingStep.waitingForInput)
                  : ProviderState(
                      state: AuthorizationState.authorized,
                      step: AuthorizingStep.waitingForInput)
          ..profile.stateOf[ProvidersEnum.asana] =
              (action.adventurer.asanaToken == null)
                  ? ProviderState(
                      state: AuthorizationState.notAuthorized,
                      step: AuthorizingStep.waitingForInput)
                  : ProviderState(
                      state: AuthorizationState.authorized,
                      step: AuthorizingStep.waitingForInput)));
}

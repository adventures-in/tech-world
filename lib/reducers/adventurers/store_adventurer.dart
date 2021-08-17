import 'package:fast_immutable_collections/src/imap/map_extension.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/adventurers/store_adventurer_action.dart';

import '../../main.dart';

class StoreAdventurerReducer
    extends TypedReducer<AppState, StoreAdventurerAction> {
  StoreAdventurerReducer()
      : super((state, action) {
          final googleState = (action.adventurer.googleToken == null)
              ? AuthorizationEnum.waitingForInput
              : AuthorizationEnum.authorized;
          final gitHubState = (action.adventurer.gitHubToken == null)
              ? AuthorizationEnum.waitingForInput
              : AuthorizationEnum.authorized;
          final asanaState = (action.adventurer.asanaToken == null)
              ? AuthorizationEnum.waitingForInput
              : AuthorizationEnum.authorized;
          final newStateOf = {
            ProvidersEnum.google: googleState,
            ProvidersEnum.gitHub: gitHubState,
            ProvidersEnum.asana: asanaState
          }.lock;

          return state.copyWith(
              adventurer: action.adventurer,
              profileVM: state.profileVM.copyWith(stateOf: newStateOf));
        });
}

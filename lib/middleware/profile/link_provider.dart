import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/profile/link_provider.dart';
import 'package:tech_world/actions/profile/update_profile_action.dart';
import 'package:tech_world/enums/linking_step_enum.dart';

import '../../main.dart';

class LinkGoogleMiddleware extends TypedMiddleware<AppState, LinkProvider> {
  LinkGoogleMiddleware()
      : super((store, action, next) async {
          next(action);

          final authService = RedFireLocator.getAuthService();

          // At each step dispatch an action to update the state.
          // The steps are
          // 1. Contact Google and wait for a credential
          // 2. Link the credential to the current user
          // 3. Store the updated User data

          // we haven't implemented these yet so just return
          if (action.provider == ProvidersEnum.asana ||
              action.provider == ProvidersEnum.gitHub) {
            return;
          }

          store.dispatch(UpdateProfileAction(
              provider: action.provider,
              linkingStep: LinkingStepEnum.contacting));

          final _googleCredential = await authService.getGoogleCredential();

          store.dispatch(UpdateProfileAction(
              provider: action.provider, linkingStep: LinkingStepEnum.linking));

          final _authUserData =
              await authService.linkGoogle(credential: _googleCredential!);

          store.dispatch(StoreAuthUserDataAction(_authUserData));
        });
}

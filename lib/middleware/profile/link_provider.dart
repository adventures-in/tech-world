import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/store_auth_user_data.dart';
import 'package:tech_world/actions/profile/link_provider.dart';
import 'package:tech_world/actions/profile/update_profile_action.dart';
import 'package:tech_world/enums/auth/linking_step.dart';
import 'package:tech_world/enums/auth/provider.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/auth_service.dart';

class LinkGoogleMiddleware extends TypedMiddleware<AppState, LinkProvider> {
  LinkGoogleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // At each step dispatch an action to update the state.
          // The steps are
          // 1. Contact Google and wait for a credential
          // 2. Link the credential to the current user
          // 3. Store the updated User data

          // we haven't implemented these yet so just return
          if (action.provider == Provider.asana ||
              action.provider == Provider.git_hub) {
            return;
          }

          store.dispatch(UpdateProfile(
              provider: action.provider, linkingStep: LinkingStep.contacting));

          final _googleCredential = await authService.getGoogleCredential();

          store.dispatch(UpdateProfile(
              provider: action.provider, linkingStep: LinkingStep.linking));

          final _authUserData =
              await authService.linkGoogle(credential: _googleCredential);

          store.dispatch(StoreAuthUserData(authUserData: _authUserData));
        });
}

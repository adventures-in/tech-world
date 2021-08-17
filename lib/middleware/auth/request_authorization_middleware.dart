import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/profile/request_authorization.dart';

import '../../main.dart';

class RequestAuthorizationMiddleware
    extends TypedMiddleware<AppState, RequestAuthorization> {
  RequestAuthorizationMiddleware()
      : super((store, action, next) async {
          next(action);

          final authService = RedFireLocator.getAuthService();
          final databaseService = RedFireLocator.getDatabaseService();

          if (action.provider == ProvidersEnum.google) {
            final token = await authService.getTokenFromGoogle();

            await databaseService.updateAuthToken(
                action.provider, store.state.authUserData.uid, token);
          }
        });
}

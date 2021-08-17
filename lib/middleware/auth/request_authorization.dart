import 'package:redux/redux.dart';
import 'package:tech_world/actions/profile/request_authorization.dart';
import 'package:tech_world/enums/auth/provider.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/auth_service.dart';
import 'package:tech_world/services/database_service.dart';

class RequestAuthorizationMiddleware
    extends TypedMiddleware<AppState, RequestAuthorization> {
  RequestAuthorizationMiddleware(
      AuthService authService, DatabaseService databaseService)
      : super((store, action, next) async {
          next(action);

          if (action.provider == Provider.google) {
            final token = await authService.getTokenFromGoogle();

            await databaseService.updateAuthToken(
                action.provider, store.state.authUserData.uid, token);
          }
        });
}

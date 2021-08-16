import 'package:adventures_in_tech_world/actions/profile/request_authorization.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth_service.dart';
import 'package:adventures_in_tech_world/services/database_service.dart';
import 'package:redux/redux.dart';

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

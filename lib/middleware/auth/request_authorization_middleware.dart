import 'package:redfire/extensions.dart';
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

          try {
            final authService = RedFireLocator.getAuthService();
            final databaseService = RedFireLocator.getDatabaseService();

            if (action.provider == ProvidersEnum.google) {
              final token = await authService.getTokenForGoogle(['email']);

              await databaseService.setDocument(
                  at: '/adventurers/${store.state.auth.userData!.uid}',
                  to: {'googleToken': token},
                  merge: true);
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}

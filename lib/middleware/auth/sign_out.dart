import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/sign_out.dart';
import 'package:tech_world/actions/auth/store_auth_step.dart';
import 'package:tech_world/enums/auth/auth_step.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/auth_service.dart';
import 'package:tech_world/services/git_hub_service.dart';
import 'package:tech_world/utils/problems_utils.dart';

class SignOutMiddleware extends TypedMiddleware<AppState, SignOut> {
  SignOutMiddleware(AuthService authService, GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem =
              generateProblemHandler(store.dispatch, 'SignOutMiddleware');

          try {
            // set the auth step and use the service to sign out
            store.dispatch(StoreAuthStep(step: AuthStep.signingOut));
            await authService.signOut();

            // delete the github token
            gitHubService.token = null;
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

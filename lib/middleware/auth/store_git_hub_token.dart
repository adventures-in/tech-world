import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/auth/auth_service.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class StoreGitHubTokenMiddleware
    extends TypedMiddleware<AppState, StoreGitHubToken> {
  StoreGitHubTokenMiddleware(AuthService authService,
      DatabaseService databaseService, GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'StoreGitHubTokenMiddleware');

          try {
            if (action.token == null) {
              // there was no token

              // set the UI to let the user get a token
              store.dispatch(StoreAuthStep(step: AuthStep.waitingForInput));
            } else {
              // there was a token

              // put the token in the service
              gitHubService.token = action.token;

              // disconnect from the token section of the database
              databaseService.disconnectTempToken();

              if (!store.state.userData.hasGitHub) {
                // we have a token but haven't signed in with github

                // set anonymous account to be deleted
                final currentUserId = await authService.getCurrentUserId();
                await databaseService.deleteAnonymousAccount(currentUserId);

                // dispatch step change and sign in with github
                store.dispatch(
                    StoreAuthStep(step: AuthStep.signingInWithGitHub));
                final userData =
                    await authService.signInWithGithub(action.token);

                // we are now signed in with github so add the token and user
                // info to the user's db entry
                await databaseService.updateUserInfo(userData, action.token);
              }
            }
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

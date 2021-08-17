import 'package:redfire/actions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/store_git_hub_token.dart';
import 'package:tech_world/services/database_service.dart';
import 'package:tech_world/services/git_hub_service.dart';

import '../../main.dart';

class StoreGitHubTokenMiddleware
    extends TypedMiddleware<AppState, StoreGitHubToken> {
  StoreGitHubTokenMiddleware()
      : super((store, action, next) async {
          next(action);

          final authService = RedFireLocator.getAuthService();
          final databaseService = RedFireLocator.getDatabaseService();
          final gitHubService = Locator.getGitHubService();

          try {
            if (action.token == null) {
              // there was no token

              // set the UI to let the user get a token
              store.dispatch(
                  StoreAuthStepAction(step: AuthStep.waitingForInput));
            } else {
              // there was a token

              // put the token in the service
              gitHubService.token = action.token;

              // disconnect from the token section of the database
              databaseService.disconnect(DatabaseSection.tempToken);

              if (!store.state.auth.userData.hasGitHub) {
                // we have a token but haven't signed in with github

                // set anonymous account to be deleted
                final currentUserId = await authService.getCurrentUserId();
                await databaseService.deleteAnonymousAccount(currentUserId);

                // dispatch step change and sign in with github
                // store.dispatch(
                //     StoreAuthStep(step: AuthStep.signingInWithGitHub));
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

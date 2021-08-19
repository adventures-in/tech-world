import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redfire/types.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/store_git_hub_token.dart';
import 'package:tech_world/utils/locator.dart';

import '../../main.dart';

class StoreGitHubTokenMiddleware
    extends TypedMiddleware<AppState, StoreGitHubToken> {
  StoreGitHubTokenMiddleware()
      : super((store, action, next) async {
          next(action);

          try {
            final authService = RedFireLocator.getAuthService();
            final databaseService = RedFireLocator.getDatabaseService();
            final gitHubService = Locator.getGitHubService();

            if (action.token == null) {
              // there was no token so set the UI to let the user get a token
              store.dispatch(
                  StoreAuthStepAction(AuthenticationEnum.waitingForInput));
              return;
            }

            // there was a token so put the token in the service
            gitHubService.token = action.token!;

            // disconnect from the token section of the database
            // -> if we keep a subscription in the middleware, cancel the subscription here

            if (!store.state.auth.userData!.hasGitHub) {
              // we have a token but haven't signed in with github

              // set anonymous account to be deleted
              final currentUserId = authService.getCurrentUserId();
              await databaseService.setDocument(
                  at: '/anon/$currentUserId', to: {'delete': true});

              // dispatch step change and sign in with github
              // store.dispatch(
              //     StoreAuthStep(step: AuthStep.signingInWithGitHub));
              final userData =
                  await authService.signInWithGithub(action.token!);

              final newData = <String, dynamic>{
                'gitHubToken': action.token,
                'displayName': userData.displayName,
                'photoURL': userData.photoURL
              };

              // we are now signed in with github so add the token and user
              // info to the user's db entry
              await databaseService.setDocument(
                  at: '/users/${userData.uid}', to: newData, merge: true);
            }
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}

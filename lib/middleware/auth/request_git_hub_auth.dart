import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/services/platform_service.dart';
import 'package:tech_world/utils/problems_utils.dart';

class RequestGitHubAuthMiddleware
    extends TypedMiddleware<AppState, RequestGitHubAuth> {
  RequestGitHubAuthMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RequestGitHubAuthMiddleware');

          try {
            // store.dispatch(StoreAuthStep(step: AuthStep.requestingGitHubAuth));
            await platformService
                .redirectWithState(store.state.authUserData.uid);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

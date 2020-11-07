import 'package:adventures_in_tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/services/platform_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:redux/redux.dart';

class RequestGitHubAuthMiddleware
    extends TypedMiddleware<AppState, RequestGitHubAuth> {
  RequestGitHubAuthMiddleware(PlatformService platformService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RequestGitHubAuthMiddleware');

          try {
            // store.dispatch(StoreAuthStep(step: AuthStep.requestingGitHubAuth));
            await platformService.redirectWithState(store.state.userData.uid);
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

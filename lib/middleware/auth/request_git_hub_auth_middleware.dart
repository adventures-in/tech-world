import 'package:redfire/extensions.dart';
import 'package:redfire/services.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:tech_world/utils/apis/git_hub_redirect.dart'
    as git_hub_redirect;

import '../../main.dart';

class RequestGitHubAuthMiddleware
    extends TypedMiddleware<AppState, RequestGitHubAuth> {
  RequestGitHubAuthMiddleware()
      : super((store, action, next) async {
          next(action);

          final platformService = RedFireLocator.getPlatformService();

          try {
            // store.dispatch(StoreAuthStep(step: AuthStep.requestingGitHubAuth));
            final url = git_hub_redirect
                .uriWith(state: store.state.auth.userData!.uid)
                .toString();
            await platformService.launchUrl(url);
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}

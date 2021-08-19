import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/extensions.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_repositories.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_repositories.dart';
import 'package:tech_world/models/git_hub/git_hub_repository.dart';
import 'package:tech_world/utils/locator.dart';

import '../../main.dart';

class RetrieveGitHubRepositoriesMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubRepositories> {
  RetrieveGitHubRepositoriesMiddleware()
      : super((store, action, next) async {
          next(action);

          final gitHubService = Locator.getGitHubService();

          try {
            final repositories = await gitHubService.retrieveRespositories();
            store.dispatch(
                StoreGitHubRepositories(IList<GitHubRepository>(repositories)));
          } catch (error, trace) {
            store.dispatchProblem(error, trace);
          }
        });
}

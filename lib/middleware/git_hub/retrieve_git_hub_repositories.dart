import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_repositories.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_repositories.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/models/git_hub/git_hub_repository.dart';
import 'package:tech_world/services/git_hub_service.dart';
import 'package:tech_world/utils/problems_utils.dart';

class RetrieveGitHubRepositoriesMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubRepositories> {
  RetrieveGitHubRepositoriesMiddleware(GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RetrieveGitHubRepositoriesMiddleware');

          try {
            final repositories = await gitHubService.retrieveRespositories();
            store.dispatch(StoreGitHubRepositories(
                repositories: BuiltList<GitHubRepository>(repositories)));
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

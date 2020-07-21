import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/store_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/services/git_hub_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:built_collection/built_collection.dart';
import 'package:redux/redux.dart';

/// Middleware is used for a variety of things:
/// - Logging
/// - Async calls (database, network)
/// - Calling to system frameworks
///
/// These are performed when actions are dispatched to the Store
///
/// The output of an action can perform another action using the [NextDispatcher]
///
List<Middleware<AppState>> createGitHubMiddleware({
  GitHubService gitHubService,
}) {
  return [
    RetrieveGitHubRepositoriesMiddleware(gitHubService),
    RetrieveGitHubAssignedIssuesMiddleware(gitHubService),
    RetrieveGitHubPullRequestsMiddleware(gitHubService),
  ];
}

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

class RetrieveGitHubAssignedIssuesMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubAssignedIssues> {
  RetrieveGitHubAssignedIssuesMiddleware(GitHubService gitHubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RetrieveGitHubAssignedIssuesMiddleware');

          try {
            final issues = await gitHubService.retrieveAssignedIssues();
            store
                .dispatch(StoreGitHubAssignedIssues(issues: BuiltList(issues)));
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

class RetrieveGitHubPullRequestsMiddleware
    extends TypedMiddleware<AppState, RetrieveGitHubPullRequests> {
  RetrieveGitHubPullRequestsMiddleware(GitHubService githubService)
      : super((store, action, next) async {
          next(action);

          final handleProblem = generateProblemHandler(
              store.dispatch, 'RetrieveGitHubPullRequestsMiddleware');

          try {
            final prs = await githubService.retrievePullRequests();
            store.dispatch(StoreGitHubPullRequests(prs: BuiltList(prs)));
          } catch (error, trace) {
            handleProblem(error, trace);
          }
        });
}

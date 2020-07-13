import 'package:adventures_in_tech_world/extensions/gql_extensions.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_issue.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_pull_request.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/models/problems/git_hub_exceptions.dart';
import 'package:adventures_in_tech_world/utils/authenticated_http.dart';
import 'package:github_graphql_client/github_graphql_client.dart';
import 'package:http/http.dart' as http;

class GitHubService {
  String _token;
  HttpLink _link;

  set token(String token) {
    _token = token;
    _link = HttpLink(
      'https://api.github.com/graphql',
      httpClient: AuthenticatedClient(token, http.Client()),
    );

    // _dio.interceptors.add(
    //   InterceptorsWrapper(onRequest: (RequestOptions options) async {
    //     // Do something before request is sent
    //     options.baseUrl = 'https://api.github.com/';
    //     options.headers['Authorization'] = 'token $_token';
    //     return options; //continue
    //   }, onResponse: (Response response) async {
    //     // Do something with response data
    //     return response; // continue
    //   }, onError: (DioError e) async {
    //     // Do something with response error
    //     return e; //continue
    //   }),
    // );
  }

  GitHubService();

  // Future<String> issues() async {
  //   final result = await _dio.get<String>('user/issues');
  //   print(result);
  //   return result.data;
  // }

  Future<List<GitHubRepository>> retrieveRespositories() async {
    // check the token has been set
    if (_token == null) {
      throw GitHubTokenException(
          'You tried to use the GitHubService before the token was set');
    }

    // make the request
    var result = await _link.request(Repositories((b) => b..count = 100)).first;
    if (result.errors != null && result.errors.isNotEmpty) {
      throw QueryException(result.errors);
    }

    // convert the result to models
    return $Repositories(result.data)
        .viewer
        .repositories
        .nodes
        .toGitHubRepositories();
  }

  Future<List<GitHubIssue>> retrieveAssignedIssues() async {
    // check the token has been set
    if (_token == null) {
      throw GitHubTokenException(
          'You tried to use the GitHubService before the token was set');
    }

    // make the request
    var result = await _link.request(ViewerDetail((b) => b)).first;
    if (result.errors != null && result.errors.isNotEmpty) {
      throw QueryException(result.errors);
    }
    var _viewer = $ViewerDetail(result.data).viewer;

    result = await _link
        .request(AssignedIssues((b) => b
          ..count = 100
          ..query = 'is:open assignee:${_viewer.login} archived:false'))
        .first;
    if (result.errors != null && result.errors.isNotEmpty) {
      throw QueryException(result.errors);
    }
    return $AssignedIssues(result.data)
        .search
        .edges
        .map((e) => e.node)
        .whereType<$AssignedIssues$search$edges$node$asIssue>()
        .toList()
        .toGitHubIssues();
  }

  Future<List<GitHubPullRequest>> retrievePullRequests() async {
    var result = await _link.request(PullRequests((b) => b..count = 100)).first;
    if (result.errors != null && result.errors.isNotEmpty) {
      throw QueryException(result.errors);
    }
    return $PullRequests(result.data)
        .viewer
        .pullRequests
        .edges
        .map((e) => e.node)
        .toList()
        .toGitHubPullRequests();
  }
}

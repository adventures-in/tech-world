import 'package:adventures_in_tech_world/enums/github/pull_request_state.dart';
import 'package:adventures_in_tech_world/models/git_hub/git_hub_issue.dart';
import 'package:adventures_in_tech_world/models/git_hub/git_hub_label.dart';
import 'package:adventures_in_tech_world/models/git_hub/git_hub_pull_request.dart';
import 'package:adventures_in_tech_world/models/git_hub/git_hub_repository.dart';
import 'package:adventures_in_tech_world/models/git_hub/git_hub_user.dart';
import 'package:built_collection/built_collection.dart';
import 'package:github_graphql_client/src/github_gql/github_queries.data.gql.dart';

extension ListOfGitHubRepositoryExt
    on List<$Repositories$viewer$repositories$nodes> {
  List<GitHubRepository> toGitHubRepositories() {
    final list = <GitHubRepository>[];
    for (final node in this) {
      final repo = GitHubRepository(
          description: node.description,
          isFork: node.isFork,
          isPrivate: node.isPrivate,
          issues: node.issues.totalCount,
          name: node.name,
          owner: GitHubUser(
              avatarUrl: node.owner.avatarUrl.value, login: node.owner.login),
          stargazers: node.stargazers.totalCount,
          url: node.url.value);
      list.add(repo);
    }
    return list;
  }
}

extension GitHubAssignedIssuesExt
    on List<$AssignedIssues$search$edges$node$asIssue> {
  List<GitHubIssue> toGitHubIssues() {
    final list = <GitHubIssue>[];
    for (final gqlIssue in this) {
      final ghIssue = GitHubIssue(
          repoOwner: GitHubUser(
              login: gqlIssue.repository.nameWithOwner,
              avatarUrl: gqlIssue.repository.url.value),
          number: gqlIssue.number,
          url: gqlIssue.url.value,
          title: gqlIssue.title,
          author: GitHubUser(
              login: gqlIssue.author.login,
              avatarUrl: gqlIssue.author.url.value),
          labels: BuiltList(gqlIssue.labels.toGitHubLabels()),
          comments: gqlIssue.comments.totalCount);
      list.add(ghIssue);
    }
    return list;
  }
}

extension GitHubLabels on $AssignedIssues$search$edges$node$asIssue$labels {
  List<GitHubLabel> toGitHubLabels() {
    final list = <GitHubLabel>[];
    for (final label in nodes) {
      list.add(GitHubLabel(name: label.name, color: label.color));
    }
    return list;
  }
}

extension ListOfPullRequests
    on List<$PullRequests$viewer$pullRequests$edges$node> {
  List<GitHubPullRequest> toGitHubPullRequests() {
    final list = <GitHubPullRequest>[];
    for (final node in this) {
      final pr = GitHubPullRequest(
          repositoryOwner: GitHubUser(
              login: node.repository.nameWithOwner,
              avatarUrl: node.repository.url.value),
          author:
              GitHubUser(login: node.author.login, avatarUrl: node.url.value),
          number: node.number,
          url: node.url.value,
          title: node.title,
          updatedAt: DateTime.parse(node.updatedAt.value),
          state: PullRequestState.valueOfToLowerCase(node.state.value),
          isDraft: node.isDraft,
          comments: node.comments.totalCount,
          files: node.files.totalCount);

      list.add(pr);
    }
    return list;
  }
}

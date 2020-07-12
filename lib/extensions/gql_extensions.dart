import 'package:adventures_in_tech_world/models/github/git_hub_issue.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_label.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_user.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:github_graphql_client/src/github_gql/github_queries.data.gql.dart';

extension GithubRepositoryExt on $Repositories$viewer$repositories$nodes {
  GitHubRepository toGithubRepository() {
    return GitHubRepository(
        description: description,
        isFork: isFork,
        isPrivate: isPrivate,
        issues: issues.totalCount,
        name: name,
        owner: GitHubUser(avatarUrl: owner.avatarUrl.value, login: owner.login),
        stargazers: stargazers.totalCount,
        url: url.value);
  }
}

extension ListOfGitHubRepositoryExt
    on List<$Repositories$viewer$repositories$nodes> {
  List<GitHubRepository> toGitHubRepositories() {
    final list = <GitHubRepository>[];
    for (final node in this) {
      list.add(node.toGithubRepository());
    }
    return list;
  }
}

extension GitHubAssignedIssueExt on $AssignedIssues$search$edges$node$asIssue {
  GitHubIssue toGithubIssue() {
    return GitHubIssue(
        repoOwner: GitHubUser(
            login: repository.nameWithOwner, avatarUrl: repository.url.value),
        number: number,
        url: url.value,
        title: title,
        author: GitHubUser(login: author.login, avatarUrl: author.url.value),
        labels: labels.toGitHubLabels(),
        comments: comments.totalCount);
  }
}

extension GitHubAssignedIssuesExt
    on List<$AssignedIssues$search$edges$node$asIssue> {
  List<GitHubIssue> toGitHubIssues() {
    final list = <GitHubIssue>[];
    for (final issue in this) {
      list.add(issue.toGithubIssue());
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

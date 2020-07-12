import 'package:adventures_in_tech_world/models/github/git_hub_owner.dart';
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
        owner:
            GitHubOwner(avatarUrl: owner.avatarUrl.value, login: owner.login),
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

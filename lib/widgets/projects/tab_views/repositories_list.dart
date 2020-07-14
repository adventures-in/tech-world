import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/navigation/launch_url.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class RepositoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, BuiltList<GitHubRepository>>(
        onInit: (store) => store.dispatch(RetrieveGitHubRepositories()),
        distinct: true,
        converter: (store) => store.state.gitHubRepositories,
        builder: (context, repositories) {
          if (repositories.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var repository = repositories[index];
              return ListTile(
                title: Text('${repository.owner.login}/${repository.name}'),
                subtitle: Text(repository.description ?? 'No description'),
                onTap: () => context.dispatch(
                  LaunchURL(url: repository.url),
                ),
              );
            },
            itemCount: repositories.length,
          );
        },
      );
}

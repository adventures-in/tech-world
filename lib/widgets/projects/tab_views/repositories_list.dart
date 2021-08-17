import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_repositories.dart';
import 'package:tech_world/models/git_hub/git_hub_repository.dart';

import '../../../main.dart';

class RepositoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, IList<GitHubRepository>>(
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
                onTap: () => context.dispatch<AppState>(
                  LaunchUrlAction(url: repository.url),
                ),
              );
            },
            itemCount: repositories.length,
          );
        },
      );
}

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_assigned_issues.dart';
import 'package:tech_world/models/git_hub/git_hub_issue.dart';

import '../../../main.dart';

class AssignedIssuesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IList<GitHubIssue>>(
      onInit: (store) => store.dispatch(RetrieveGitHubAssignedIssues()),
      distinct: true,
      converter: (store) => store.state.gitHubAssignedIssues,
      builder: (context, issues) {
        if (issues.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var issue = issues[index];
            return ListTile(
              title: Text('${issue.title}'),
              subtitle: Text('${issue.repoOwner.login} '
                  'Issue #${issue.number} '
                  'opened by ${issue.author.login}'),
              onTap: () => context.dispatch<AppState>(
                LaunchUrlAction(url: issue.url),
              ),
            );
          },
          itemCount: issues.length,
        );
      },
    );
  }
}

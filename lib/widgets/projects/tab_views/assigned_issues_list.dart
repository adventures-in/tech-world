import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tech_world/actions/git_hub/retrieve_git_hub_assigned_issues.dart';
import 'package:tech_world/actions/platform/launch_url.dart';
import 'package:tech_world/extensions/build_context_extensions.dart';
import 'package:tech_world/models/app/app_state.dart';
import 'package:tech_world/models/git_hub/git_hub_issue.dart';

class AssignedIssuesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BuiltList<GitHubIssue>>(
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
              onTap: () => context.dispatch(
                LaunchURL(url: issue.url),
              ),
            );
          },
          itemCount: issues.length,
        );
      },
    );
  }
}

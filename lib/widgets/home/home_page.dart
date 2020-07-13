import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_assigned_issues.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_pull_requests.dart';
import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/navigation/launch_url.dart';
import 'package:adventures_in_tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in_tech_world/enums/nav_bar_selection.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_issue.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_pull_request.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/utils/icons/octo_icons_icons.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class GitHubSummary extends StatefulWidget {
  GitHubSummary();
  @override
  _GitHubSummaryState createState() => _GitHubSummaryState();
}

class _GitHubSummaryState extends State<GitHubSummary> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
      distinct: true,
      converter: (store) => store.state.gitHubToken,
      builder: (context, token) {
        if (token == null) return Container();
        return Material(
          child: Row(
            children: [
              NavigationRail(
                selectedIndex: _selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                labelType: NavigationRailLabelType.selected,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(OctoIcons.repo),
                    label: Text('Repositories'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(OctoIcons.issue_opened),
                    label: Text('Assigned Issues'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(OctoIcons.git_pull_request),
                    label: Text('Pull Requests'),
                  ),
                ],
              ),
              VerticalDivider(thickness: 1, width: 1),
              // This is the main content.
              Expanded(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    RepositoriesList(),
                    AssignedIssuesList(),
                    PullRequestsList(),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

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

class PullRequestsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, BuiltList<GitHubPullRequest>>(
      onInit: (store) => store.dispatch(RetrieveGitHubPullRequests()),
      distinct: true,
      converter: (store) => store.state.gitHubPullRequests,
      builder: (context, pullRequests) {
        if (pullRequests.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            var pullRequest = pullRequests[index];
            return ListTile(
              title: Text('${pullRequest.title}'),
              subtitle: Text('${pullRequest.repositoryOwner.login} '
                  'PR #${pullRequest.number} '
                  'opened by ${pullRequest.author.login} '
                  '(${pullRequest.state})'),
              onTap: () => context.dispatch(
                LaunchURL(url: pullRequest.url),
              ),
            );
          },
          itemCount: pullRequests.length,
        );
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavBar(),
          VerticalDivider(thickness: 1, width: 1),
          StoreConnector<AppState, NavBarSelection>(
            distinct: true,
            converter: (store) => store.state.navBarSelection,
            builder: (context, vm) => vm.widget,
          )
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavBarSelection>(
        distinct: true,
        converter: (store) => store.state.navBarSelection,
        builder: (context, selection) {
          return Column(
            children: [
              Expanded(
                child: NavigationRail(
                  selectedIndex: selection.index,
                  onDestinationSelected: (int index) {
                    context.dispatch(StoreNavBarSelection(
                      selection: NavBarSelection.valueOfIndex(index),
                    ));
                  },
                  labelType: NavigationRailLabelType.selected,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.short_text),
                      selectedIcon: Icon(Icons.wrap_text),
                      label: Text('Projects'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.assignment),
                      selectedIcon: Icon(Icons.assessment),
                      label: Text('Topics'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.supervised_user_circle),
                      selectedIcon: Icon(Icons.verified_user),
                      label: Text('Profile'),
                    ),
                  ],
                ),
              ),
              StoreConnector<AppState, Adventurer>(
                distinct: true,
                converter: (store) => store.state.adventurer,
                builder: (context, adventurer) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 17,
                      backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(adventurer.photoURL),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        });
  }
}

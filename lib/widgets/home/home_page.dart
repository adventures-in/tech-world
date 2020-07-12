import 'package:adventures_in_tech_world/actions/github/retrieve_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in_tech_world/enums/nav_bar_selection.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/github/git_hub_repository.dart';
import 'package:adventures_in_tech_world/utils/authenticated_http.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:github_graphql_client/github_graphql_client.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
                    icon: Icon(Octicons.repo),
                    label: Text('Repositories'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Octicons.issue_opened),
                    label: Text('Assigned Issues'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Octicons.git_pull_request),
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
                    AssignedIssuesList(link: null),
                    PullRequestsList(link: null),
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
                onTap: () => _launchUrl(context, repository.url),
              );
            },
            itemCount: repositories.length,
          );
        },
      );
}

class AssignedIssuesList extends StatefulWidget {
  const AssignedIssuesList({@required this.link});
  final Link link;
  @override
  _AssignedIssuesListState createState() =>
      _AssignedIssuesListState(link: link);
}

class _AssignedIssuesListState extends State<AssignedIssuesList> {
  _AssignedIssuesListState({@required Link link}) {
    _assignedIssues = _retrieveAssignedIssues(link);
  }

  Future<List<$AssignedIssues$search$edges$node$asIssue>> _assignedIssues;

  Future<List<$AssignedIssues$search$edges$node$asIssue>>
      _retrieveAssignedIssues(Link link) async {
    var result = await link.request(ViewerDetail((b) => b)).first;
    if (result.errors != null && result.errors.isNotEmpty) {
      throw QueryException(result.errors);
    }
    var _viewer = $ViewerDetail(result.data).viewer;

    result = await link
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
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<$AssignedIssues$search$edges$node$asIssue>>(
      future: _assignedIssues,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var assignedIssues = snapshot.data;
        return ListView.builder(
          itemBuilder: (context, index) {
            var assignedIssue = assignedIssues[index];
            return ListTile(
              title: Text('${assignedIssue.title}'),
              subtitle: Text('${assignedIssue.repository.nameWithOwner} '
                  'Issue #${assignedIssue.number} '
                  'opened by ${assignedIssue.author.login}'),
              onTap: () => _launchUrl(context, assignedIssue.url.value),
            );
          },
          itemCount: assignedIssues.length,
        );
      },
    );
  }
}

class PullRequestsList extends StatefulWidget {
  const PullRequestsList({@required this.link});
  final Link link;
  @override
  _PullRequestsListState createState() => _PullRequestsListState(link: link);
}

class _PullRequestsListState extends State<PullRequestsList> {
  _PullRequestsListState({@required Link link}) {
    _pullRequests = _retrievePullRequests(link);
  }
  Future<List<$PullRequests$viewer$pullRequests$edges$node>> _pullRequests;

  Future<List<$PullRequests$viewer$pullRequests$edges$node>>
      _retrievePullRequests(Link link) async {
    var result = await link.request(PullRequests((b) => b..count = 100)).first;
    if (result.errors != null && result.errors.isNotEmpty) {
      throw QueryException(result.errors);
    }
    return $PullRequests(result.data)
        .viewer
        .pullRequests
        .edges
        .map((e) => e.node)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<$PullRequests$viewer$pullRequests$edges$node>>(
      future: _pullRequests,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        var pullRequests = snapshot.data;
        return ListView.builder(
          itemBuilder: (context, index) {
            var pullRequest = pullRequests[index];
            return ListTile(
              title: Text('${pullRequest.title}'),
              subtitle: Text('${pullRequest.repository.nameWithOwner} '
                  'PR #${pullRequest.number} '
                  'opened by ${pullRequest.author.login} '
                  '(${pullRequest.state.value.toLowerCase()})'),
              onTap: () => _launchUrl(context, pullRequest.url.value),
            );
          },
          itemCount: pullRequests.length,
        );
      },
    );
  }
}

class QueryException implements Exception {
  QueryException(this.errors);
  List<GraphQLError> errors;
  @override
  String toString() {
    return 'Query Exception: ${errors.map((err) => '$err').join(',')}';
  }
}

Future<void> _launchUrl(BuildContext context, String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Navigation error'),
        content: Text('Could not launch $url'),
        actions: <Widget>[
          FlatButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
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

import 'package:flutter/material.dart';
import 'package:tech_world/enums/projects_enum.dart';
import 'package:tech_world/utils/icons/octo_icons_icons.dart';
import 'package:tech_world/widgets/projects/tab_views/assigned_issues_list.dart';
import 'package:tech_world/widgets/projects/tab_views/pull_requests_list.dart';
import 'package:tech_world/widgets/projects/tab_views/repositories_list.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
            length: ProjectsEnum.values.length,
            child: Column(
              children: [
                TabBar(
                  indicatorColor: Theme.of(context).colorScheme.secondary,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  tabs: [
                    Tab(text: 'Repositories', icon: Icon(OctoIcons.repo)),
                    Tab(text: 'Issues', icon: Icon(OctoIcons.issue_opened)),
                    Tab(
                        text: 'Pull Requests',
                        icon: Icon(OctoIcons.git_pull_request)),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      RepositoriesList(),
                      AssignedIssuesList(),
                      PullRequestsList()
                    ],
                  ),
                ),
              ],
            )));
  }
}

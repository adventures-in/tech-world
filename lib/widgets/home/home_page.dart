import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:tech_world/enums/nav_bar_enum.dart';
import 'package:tech_world/widgets/home/nav_rail.dart';
import 'package:tech_world/widgets/profile/profile_page.dart';
import 'package:tech_world/widgets/projects/projects_page.dart';
import 'package:tech_world/widgets/topics/topics_page.dart';

import '../../main.dart';

const Map<NavBarEnum, Widget> _widgetMap = {
  NavBarEnum.projects: ProjectsPage(),
  NavBarEnum.topics: TopicsPage(),
  NavBarEnum.profile: ProfilePage(),
};

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavRail(),
          VerticalDivider(thickness: 1, width: 1),
          StoreConnector<AppState, NavBarEnum>(
            distinct: true,
            converter: (store) => store.state.navSelection,
            builder: (context, selection) => _widgetMap[selection]!,
          )
        ],
      ),
    );
  }
}

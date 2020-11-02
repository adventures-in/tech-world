import 'package:adventures_in_tech_world/enums/nav_bar_selection.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/widgets/home/nav_rail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
          NavRail(),
          VerticalDivider(thickness: 1, width: 1),
          StoreConnector<AppState, NavBarSelection>(
            distinct: true,
            converter: (store) => store.state.navSelection,
            builder: (context, selection) => selection.widget,
          )
        ],
      ),
    );
  }
}

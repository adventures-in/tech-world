import 'package:adventures_in_tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:adventures_in_tech_world/enums/nav_bar_selection.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
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
          NavBar(),
          VerticalDivider(thickness: 1, width: 1),
          StoreConnector<AppState, NavBarSelection>(
            distinct: true,
            converter: (store) => store.state.navBarSelection,
            builder: (context, selection) => selection.widget,
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

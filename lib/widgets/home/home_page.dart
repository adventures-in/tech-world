import 'package:adventures_in_tech_world/actions/navigation/navigate_to_profile.dart';
import 'package:adventures_in_tech_world/actions/navigation/store_nav_selection.dart';
import 'package:adventures_in_tech_world/enums/nav_selection.dart';
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
          NavRail(),
          VerticalDivider(thickness: 1, width: 1),
          StoreConnector<AppState, NavSelection>(
            distinct: true,
            converter: (store) => store.state.navSelection,
            builder: (context, selection) => selection.widget,
          )
        ],
      ),
    );
  }
}

class NavRail extends StatelessWidget {
  const NavRail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavSelection>(
        distinct: true,
        converter: (store) => store.state.navSelection,
        builder: (context, selection) {
          return Column(
            children: [
              Expanded(
                child: NavigationRail(
                  selectedIndex: selection.index,
                  onDestinationSelected: (int index) {
                    context.dispatch(StoreNavSelection(
                      selection: NavSelection.valueOfIndex(index),
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
                    child: (adventurer == null)
                        ? CircularProgressIndicator()
                        : ProfileAvatar(adventurer.photoURL),
                  );
                },
              ),
            ],
          );
        });
  }
}

class ProfileAvatar extends StatelessWidget {
  final String photoURL;
  const ProfileAvatar(
    this.photoURL, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        context.dispatch(NavigateToProfile());
      },
      elevation: 0.0,
      fillColor: Colors.white,
      child: CircleAvatar(
        radius: 17,
        backgroundColor: Color(0xffFDCF09),
        child: CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(photoURL),
        ),
      ),
      padding: EdgeInsets.all(5.0),
      shape: CircleBorder(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/widgets.dart';
import 'package:tech_world/actions/navigation/store_nav_bar_selection.dart';
import 'package:tech_world/enums/nav_bar_enum.dart';
import 'package:tech_world/models/adventurers/adventurer.dart';

import '../../main.dart';

class NavRail extends StatelessWidget {
  const NavRail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, NavBarEnum>(
        distinct: true,
        converter: (store) => store.state.navSelection,
        builder: (context, selection) {
          return Column(
            children: [
              Expanded(
                child: NavigationRail(
                  selectedIndex: selection.index,
                  onDestinationSelected: (int index) {
                    context.dispatch<AppState>(
                        StoreNavBarSelection(NavBarEnum.values[index]));
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
              StoreConnector<AppState, Adventurer?>(
                distinct: true,
                converter: (store) => store.state.adventurer,
                builder: (context, adventurer) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileAvatar(adventurer?.photoURL),
                  );
                },
              ),
            ],
          );
        });
  }
}

import 'package:adventures_in/enums/nav_bar_selection.dart';
import 'package:adventures_in/extensions/theme_data_extensions.dart';
import 'package:adventures_in/extensions/theme_mode_extensions.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:adventures_in/models/app/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AdventuresInApp extends StatelessWidget {
  final Store<AppState> store;

  AdventuresInApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, Settings>(
        distinct: true,
        converter: (store) => store.state.settings,
        builder: (context, settings) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: MakeThemeData.from(settings.lightTheme),
            darkTheme: MakeThemeData.from(settings.darkTheme),
            themeMode: MakeThemeMode.from(settings.brightnessMode),
            home: HomePage(title: 'AdventuresIn'),
          );
        },
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
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

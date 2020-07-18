import 'package:adventures_in_tech_world/actions/app/plumb_services.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/extensions/theme_data_extensions.dart';
import 'package:adventures_in_tech_world/extensions/theme_mode_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/app/settings.dart';
import 'package:adventures_in_tech_world/widgets/auth/auth_page.dart';
import 'package:adventures_in_tech_world/widgets/home/home_page.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AdventuresInApp extends StatelessWidget {
  /// The redux store
  final Store<AppState> store;

  /// The [GlobalKey] used by the [NavigationService]
  final GlobalKey<NavigatorState> navKey;

  AdventuresInApp(this.store, this.navKey);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, Settings>(
        onInit: (store) => store.dispatch(PlumbServices()),
        distinct: true,
        converter: (store) => store.state.settings,
        builder: (context, settings) {
          return MaterialApp(
            title: 'AdventuresIn',
            navigatorKey: navKey,
            theme: MakeThemeData.from(settings.lightTheme),
            darkTheme: MakeThemeData.from(settings.darkTheme),
            themeMode: MakeThemeMode.from(settings.brightnessMode),
            home: StoreConnector<AppState, AuthState>(
              distinct: true,
              converter: (store) => store.state.authState,
              builder: (context, authState) {
                return (authState == AuthState.signedInAndGitHubToken)
                    ? HomePage()
                    : AuthPage();
              },
            ),
            routes: <String, WidgetBuilder>{
              '/profile': (context) => ProfilePage(),
            },
          );
        },
      ),
    );
  }
}

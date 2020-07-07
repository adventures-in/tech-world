import 'package:adventures_in_tech_world/actions/app/plumb_database_stream.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/extensions/theme_data_extensions.dart';
import 'package:adventures_in_tech_world/extensions/theme_mode_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/app/settings.dart';
import 'package:adventures_in_tech_world/widgets/auth/auth_page.dart';
import 'package:adventures_in_tech_world/widgets/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AdventuresInApp extends StatelessWidget {
  /// The redux store
  final Store<AppState> store;

  AdventuresInApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, Settings>(
        onInit: (store) => store.dispatch(PlumbDatabaseStream()),
        distinct: true,
        converter: (store) => store.state.settings,
        builder: (context, settings) {
          return MaterialApp(
            title: 'AdventuresIn',
            theme: MakeThemeData.from(settings.lightTheme),
            darkTheme: MakeThemeData.from(settings.darkTheme),
            themeMode: MakeThemeMode.from(settings.brightnessMode),
            home: StoreConnector<AppState, AuthState>(
              distinct: true,
              converter: (store) => store.state.authState,
              builder: (context, authState) {
                return (authState == AuthState.signedInWithFirebase)
                    ? HomePage()
                    : AuthPage();
              },
            ),
          );
        },
      ),
    );
  }
}

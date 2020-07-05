import 'package:adventures_in_tech_world/actions/auth/deal_with_auth_code.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/extensions/theme_data_extensions.dart';
import 'package:adventures_in_tech_world/extensions/theme_mode_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/app/settings.dart';
import 'package:adventures_in_tech_world/widgets/auth/auth_page.dart';
import 'package:adventures_in_tech_world/widgets/auth/git_hub_code_page.dart';
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
                return (authState == AuthState.signedIn)
                    ? HomePage()
                    : AuthPage();
              },
            ),
            onGenerateRoute: (settings) {
              // print(settings);
              // print(settings.name);
              final uri = Uri.parse(settings.name);

              if (uri.pathSegments.first == 'github') {
                store.dispatch(
                    DealWithAuthCode(queryParameters: uri.queryParameters));
                return MaterialPageRoute<dynamic>(
                  builder: (context) => GitHubCodePage(),
                );
              }

              return MaterialPageRoute<dynamic>(
                  builder: (context) => HomePage());

              // If you push the PassArguments route
              // if (settings.name == ) {
              //   // Cast the arguments to the correct type: ScreenArguments.
              //   final ScreenArguments args = settings.arguments;

              //   // Then, extract the required data from the arguments and
              //   // pass the data to the correct screen.
              //   return MaterialPageRoute(
              //     builder: (context) {
              //       return PassArgumentsScreen(
              //         title: args.title,
              //         message: args.message,
              //       );
              //     },
              //   );
              // }
            },
            // routes: {'github': (context) => HomePage()},
          );
        },
      ),
    );
  }
}

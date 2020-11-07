import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:adventures_in_tech_world/widgets/auth/auth_page.dart';
import 'package:adventures_in_tech_world/widgets/home/home_page.dart';
import 'package:adventures_in_tech_world/widgets/shared/waiting_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthStep>(
        distinct: true,
        converter: (store) => store.state.authStep,
        builder: (context, authStep) {
          switch (authStep) {
            case AuthStep.checking:
              return WaitingIndicator('Checking where we\'re at...');
            case AuthStep.contactingApple:
              return WaitingIndicator('Contacting Apple...');
            case AuthStep.signingInWithFirebase:
              return WaitingIndicator('Preparing your Adventure...');
            case AuthStep.waitingForInput:
              return StoreConnector<AppState, UserData>(
                  distinct: true,
                  converter: (store) => store.state.userData,
                  builder: (context, userData) =>
                      (userData == null) ? AuthPage() : HomePage());
            default:
              return Container();
          }
        });
  }
}

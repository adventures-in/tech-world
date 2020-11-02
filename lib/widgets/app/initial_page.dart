import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
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
              return WaitingIndicator('Checking Auth State');
            case AuthStep.signingInAnonymously:
              return WaitingIndicator('Signing In Anonymously');
            case AuthStep.listeningForTempToken:
              return WaitingIndicator('Waiting for GitHub token');
            case AuthStep.retrievingStoredToken:
              return WaitingIndicator('Retrieving stored GitHub token');
            case AuthStep.signingInWithGitHub:
              return WaitingIndicator('Signing in to Firebase with GitHub');
            case AuthStep.waitingForInput:
              return HomePage();
            default:
              return Container();
          }
        });
  }
}

import 'package:adventures_in_tech_world/actions/auth/connect_auth_state_to_store.dart';
import 'package:adventures_in_tech_world/actions/auth/request_git_hub_auth.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthStep>(
      onInit: (store) => store.dispatch(ConnectAuthStateToStore()),
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
            return SignInWithGithubButton();
          default:
            return Container();
        }
      },
    );
  }
}

class SignInWithGithubButton extends StatelessWidget {
  const SignInWithGithubButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Sign in with GitHub',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              'assets/GitHub-Mark-Light-64px.png',
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
          ],
        ),
        onPressed: () {
          context.dispatch(RequestGitHubAuth());
        },
      ),
    );
  }
}

class WaitingIndicator extends StatelessWidget {
  final String message;
  const WaitingIndicator(
    this.message, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(height: 15),
          Text(message)
        ],
      ),
    );
  }
}

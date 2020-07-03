import 'package:adventures_in/actions/auth/check_auth_state.dart';
import 'package:adventures_in/actions/auth/auth_with_git_hub.dart';
import 'package:adventures_in/enums/auth_state.dart';
import 'package:adventures_in/models/app/app_state.dart';
import 'package:flutter/material.dart';
import 'package:adventures_in/extensions/build_context_extensions.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthState>(
      onInit: (store) => store.dispatch(CheckAuthState()),
      distinct: true,
      converter: (store) => store.state.authState,
      builder: (context, authState) {
        if (authState == AuthState.checking) {
          return WaitingIndicator('Checking Auth State');
        } else {
          return SignInWithGithubButton();
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
              'icons/GitHub-Mark-Light-64px.png',
              width: 20,
              height: 20,
              fit: BoxFit.cover,
            ),
          ],
        ),
        onPressed: () {
          context.dispatch(AuthWithGitHub());
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

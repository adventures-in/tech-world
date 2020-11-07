import 'package:adventures_in_tech_world/actions/auth/sign_in_with_apple.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/widgets/auth/apple_sign_in_button.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AppleSignInButton(
            style: AppleButtonStyle.black,
            onPressed: () => context.dispatch(SignInWithApple())));
  }
}

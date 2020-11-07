import 'package:adventures_in_tech_world/actions/auth/sign_in_with_apple.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/enums/platform/platform_enum.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/widgets/auth/apple_sign_in_button.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/google_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StoreConnector<AppState, PlatformEnum>(
            distinct: true,
            converter: (store) => store.state.settings.platform,
            builder: (context, platform) {
              return (platform == PlatformEnum.macOS)
                  ? AppleSignInButton(
                      style: AppleButtonStyle.black,
                      onPressed: () => context.dispatch(SignInWithApple()))
                  : GoogleSignInButton(
                      onPressed: () => context.dispatch(SignInWithGoogle()));
            }));
  }
}

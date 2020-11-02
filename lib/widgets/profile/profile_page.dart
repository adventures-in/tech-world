import 'package:adventures_in_tech_world/actions/auth/sign_in_with_google.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/google_sign_in_button.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/sign_in_with_git_hub_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: Center(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GoogleSignInButton(
              darkMode: true,
              onPressed: () => context.dispatch(SignInWithGoogle())),
          SizedBox(height: 20),
          SignInWithGitHubButton(),
          SizedBox(height: 20),
          MaterialButton(
            child: Text('Sign Out'),
            onPressed: () => context.dispatch(SignOut()),
          ),
        ],
      )),
    );
  }
}

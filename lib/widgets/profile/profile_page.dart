import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/link_asana_fab.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/link_git_hub_fab.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/link_google_fab.dart';
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
          LinkGoogleFAB(),
          SizedBox(height: 20),
          LinkGitHubFAB(),
          SizedBox(height: 20),
          LinkAsanaFAB(),
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

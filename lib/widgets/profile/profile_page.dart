import 'package:adventures_in_tech_world/actions/adventurers/disregard_adventurer.dart';
import 'package:adventures_in_tech_world/actions/adventurers/observe_adventurer.dart';
import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/models/profile/profile_v_m.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/request_authorization_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
          child: StoreConnector<AppState, ProfileVM>(
        onInit: (store) => store.dispatch(ObserveAdventurer()),
        onDispose: (store) => store.dispatch(DisregardAdventurer()),
        distinct: true,
        converter: (store) => store.state.profile,
        builder: (context, profile) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final provider in profile.stateOf.keys)
                RequestAuthorizationFAB(
                  provider: provider,
                  state: profile.stateOf[provider],
                ),
              MaterialButton(
                child: Text('Sign Out'),
                onPressed: () => context.dispatch(SignOut()),
              ),
            ],
          );
        },
      )),
    );
  }
}

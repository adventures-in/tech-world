import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:redfire/extensions.dart';
import 'package:tech_world/actions/adventurers/tap_adventurer_action.dart';
import 'package:tech_world/models/profile/profile_v_m.dart';
import 'package:tech_world/widgets/profile/profile_page_buttons/request_authorization_fab.dart';

import '../../main.dart';

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
        onInit: (store) => store.dispatch(TapAdventurerAction()),
        onDispose: (store) =>
            store.dispatch(TapAdventurerAction(turnOff: true)),
        distinct: true,
        converter: (store) => store.state.profileVM,
        builder: (context, profile) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final provider in profile.stateOf.keys)
                RequestAuthorizationFAB(
                  provider: provider,
                  authorization: profile.stateOf[provider]!,
                ),
              MaterialButton(
                child: Text('Sign Out'),
                onPressed: () => context.dispatch<AppState>(SignOutAction()),
              ),
            ],
          );
        },
      )),
    );
  }
}

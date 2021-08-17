import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redfire/actions.dart';
import 'package:tech_world/actions/adventurers/tap_adventurer.dart';
import 'package:tech_world/extensions/build_context_extensions.dart';
import 'package:tech_world/models/profile/profile_v_m.dart';
import 'package:tech_world/widgets/profile/profile_page_buttons/request_authorization_fab.dart';

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
        onInit: (store) => store.dispatch(TapAdventurer()),
        onDispose: (store) => store.dispatch(TapAdventurer(turnOff: true)),
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
                onPressed: () => context.dispatch(SignOutAction()),
              ),
            ],
          );
        },
      )),
    );
  }
}

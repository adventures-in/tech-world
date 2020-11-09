import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/enums/auth/linking_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/widgets/profile/profile_page_buttons/link_provider_fab.dart';
import 'package:built_collection/built_collection.dart';
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
          child: StoreConnector<AppState, BuiltMap<Provider, LinkingStep>>(
        distinct: true,
        converter: (store) => store.state.profile.linkingStep,
        builder: (context, linkingStep) {
          return Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (final provider in linkingStep.keys)
                LinkProviderFAB(
                  provider: provider,
                  linkingStep: linkingStep[provider],
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

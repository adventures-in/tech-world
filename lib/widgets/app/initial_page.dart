import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:adventures_in_tech_world/widgets/auth/auth_page.dart';
import 'package:adventures_in_tech_world/widgets/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
        distinct: true,
        converter: (store) => store.state.userData != null,
        builder: (context, signedIn) => (signedIn) ? HomePage() : AuthPage());
  }
}

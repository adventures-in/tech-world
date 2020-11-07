import 'package:adventures_in_tech_world/actions/profile/link_google.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class LinkGoogleFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: ImageIcon(AssetImage('assets/google_logo.png')),
        elevation: 1,
        onPressed: () => context.dispatch(LinkGoogle()));
  }
}

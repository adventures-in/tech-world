import 'package:adventures_in_tech_world/actions/profile/link_git_hub.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class LinkGitHubFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: ImageIcon(AssetImage('assets/git_hub_white.png')),
        elevation: 1,
        onPressed: () => context.dispatch(LinkGitHub()));
  }
}

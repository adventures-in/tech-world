import 'package:adventures_in_tech_world/actions/profile/link_asana.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class LinkAsanaFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: FloatingActionButton(
          child: ImageIcon(AssetImage('assets/asana.png')),
          elevation: 1,
          onPressed: () => context.dispatch(LinkAsana())),
    );
  }
}

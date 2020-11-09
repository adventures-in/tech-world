import 'package:adventures_in_tech_world/actions/profile/link_provider.dart';
import 'package:adventures_in_tech_world/enums/auth/linking_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class LinkProviderFAB extends StatelessWidget {
  final Provider _provider;
  final LinkingStep _linkingStep;

  LinkProviderFAB(
      {@required Provider provider, @required LinkingStep linkingStep})
      : _provider = provider,
        _linkingStep = linkingStep;
  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.5,
        child: (_linkingStep == LinkingStep.notLinked)
            ? FloatingActionButton(
                child: ImageIcon(AssetImage('assets/$_provider.png')),
                elevation: 1,
                onPressed: () =>
                    context.dispatch(LinkProvider(provider: _provider)))
            : (_linkingStep == LinkingStep.linked)
                ? FloatingActionButton(
                    child: ImageIcon(AssetImage('assets/$_provider.png')),
                    onPressed: null)
                : CircularProgressIndicator());
  }
}

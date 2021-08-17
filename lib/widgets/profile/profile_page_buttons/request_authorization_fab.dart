import 'package:flutter/material.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/actions/profile/request_authorization.dart';
import 'package:tech_world/main.dart';

class RequestAuthorizationFAB extends StatelessWidget {
  final ProvidersEnum _provider;
  final AuthorizationEnum _authorization;

  RequestAuthorizationFAB(
      {required ProvidersEnum provider,
      required AuthorizationEnum authorization})
      : _provider = provider,
        _authorization = authorization;
  @override
  Widget build(BuildContext context) {
    if (_authorization == AuthorizationEnum.unknown ||
        _authorization == AuthorizationEnum.gettingAuthorized) {
      return CircularProgressIndicator();
    }

    if (_authorization == AuthorizationState.notAuthorized) {
      return FloatingActionButton(
          elevation: 1,
          onPressed: () => context
              .dispatch<AppState>(RequestAuthorization(provider: _provider)),
          child: ImageIcon(AssetImage('assets/$_provider.png')));
    }

    if (_state.state == AuthorizationState.authorized) {
      return Opacity(
          opacity: 0.5,
          child: FloatingActionButton(
              onPressed: null,
              child: ImageIcon(AssetImage('assets/$_provider.png'))));
    }

    return CircularProgressIndicator();
  }
}

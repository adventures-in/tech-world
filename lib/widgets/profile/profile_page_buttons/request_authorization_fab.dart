import 'package:flutter/material.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/actions/profile/request_authorization.dart';
import 'package:tech_world/extensions/build_context_extensions.dart';

class RequestAuthorizationFAB extends StatelessWidget {
  final ProvidersEnum _provider;
  final ProviderState _state;

  RequestAuthorizationFAB(
      {required ProvidersEnum provider, required ProviderState state})
      : _provider = provider,
        _state = state;
  @override
  Widget build(BuildContext context) {
    if (_state.step == AuthorizingStep.checking ||
        _state.step == AuthorizingStep.contacting) {
      return CircularProgressIndicator();
    }

    if (_state.state == AuthorizationState.notAuthorized) {
      return FloatingActionButton(
          elevation: 1,
          onPressed: () =>
              context.dispatch(RequestAuthorization(provider: _provider)),
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

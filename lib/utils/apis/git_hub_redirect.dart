import 'package:oauth2/oauth2.dart';

const _githubClientId = 'c729a4bb5121cc4a8caf';

// create the grant used to generate the authorization url
AuthorizationCodeGrant _grant = AuthorizationCodeGrant(
  _githubClientId,
  _authorizationEndpoint,
  _tokenEndpoint,
);

// OAuth scopes for repository and user information
final List<String> _githubScopes = ['repo', 'read:org'];

// Endpoints
final _tokenEndpoint = Uri.parse('https://github.com/login/oauth/access_token');
final _authorizationEndpoint =
    Uri.parse('https://github.com/login/oauth/authorize');
final Uri _redirectUri =
    Uri.parse('https://adventures-in-tech-world.web.app/github/');

Uri uriWith({required String state}) => _grant.getAuthorizationUrl(_redirectUri,
    scopes: _githubScopes, state: state);

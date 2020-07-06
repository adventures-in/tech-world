import 'package:oauth2/oauth2.dart';
import 'package:adventures_in_tech_world/utils/credentials.dart' as credentials;

class GitHubRedirect {
  // used to generate the authorization url
  AuthorizationCodeGrant _grant;

  // Credentials
  final String _githubClientId = credentials.githubClientId;

  // OAuth scopes for repository and user information
  final List<String> _githubScopes = ['repo', 'read:org'];

  // Endpoints
  final _tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  final _authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  final Uri _redirectUri =
      Uri.parse('https://adventures-in-tech-world.web.app/#/');
  // final Uri _redirectUri =
  // Uri.parse('https://adventures-in-tech-world.web.app/');

  GitHubRedirect() {
    // create the grant used to generate the authorization url
    _grant = AuthorizationCodeGrant(
      _githubClientId,
      _authorizationEndpoint,
      _tokenEndpoint,
    );
  }

  Uri get uri =>
      _grant.getAuthorizationUrl(_redirectUri, scopes: _githubScopes);
}

import 'package:oauth2/oauth2.dart';
import 'package:adventures_in_tech_world/utils/public_credentials.dart'
    as public_credentials;
import 'package:meta/meta.dart';

class GitHubRedirect {
  // used to generate the authorization url
  AuthorizationCodeGrant _grant;

  // OAuth scopes for repository and user information
  final List<String> _githubScopes = ['repo', 'read:org'];

  // Endpoints
  final _tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  final _authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  final Uri _redirectUri =
      Uri.parse('https://adventures-in-tech-world.web.app/github/');

  GitHubRedirect() {
    // create the grant used to generate the authorization url
    _grant = AuthorizationCodeGrant(
      public_credentials.githubClientId,
      _authorizationEndpoint,
      _tokenEndpoint,
    );
  }

  Uri uriWith({@required String state}) => _grant
      .getAuthorizationUrl(_redirectUri, scopes: _githubScopes, state: state);
}

import 'package:adventures_in/actions/auth/store_auth_state.dart';
import 'package:adventures_in/actions/auth/store_auth_token.dart';
import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/enums/auth_state.dart';
import 'package:adventures_in/utils/credentials.dart' as credentials;
import 'package:oauth2/oauth2.dart';

class AuthService {
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
  final Uri _redirectUri = Uri.parse('http://localhost/');

  AuthService() {
    // create the grant used to generate the authorization url
    _grant = AuthorizationCodeGrant(
      _githubClientId,
      _authorizationEndpoint,
      _tokenEndpoint,
    );
  }

  Future<ReduxAction> checkAuthState() async {
    return Future.value(StoreAuthState(state: AuthState.redirectedAndWaiting));
  }

  Uri get githubRedirectUri =>
      _grant.getAuthorizationUrl(_redirectUri, scopes: _githubScopes);

  Future<ReduxAction> signOut() async {
    // try {
    //   await FirebaseAuth.instance.signOut();
    //   await _googleSignIn.signOut();
    //   // TODO: add sign out for sign in with apple provider
    //   // see Issue #6 https://github.com/nickmeinhold/crowdleague_public/issues/6
    // } catch (error, trace) {
    //   return AddProblem.from(
    //     message: error.toString(),
    //     type: ProblemType.signOut,
    //     traceString: trace.toString(),
    //   );
    // }

    // // we let the AuthStateObserver dispatch a ClearUserData action when it
    // // observes the relevant event
    // return null;
  }
}

class GitHubLoginException implements Exception {
  const GitHubLoginException(this.message);
  final String message;
  @override
  String toString() => message;
}

import 'package:adventures_in/actions/auth/store_auth_state.dart';
import 'package:adventures_in/actions/auth/store_auth_token.dart';
import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/enums/auth_state.dart';
import 'package:adventures_in/utils/git_hub_redirect.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final gitHubRedirect = GitHubRedirect();

  Future<ReduxAction> checkAuthState() async {
    return Future.value(StoreAuthState(state: AuthState.redirectedAndWaiting));
  }

  Uri get githubRedirectUri => gitHubRedirect.uri;

  Future<ReduxAction> exchangeCodeForToken(
      Map<String, String> queryParameters) async {
    final token = await http.read(
        'https://us-central1-flutter-github-desktop.cloudfunctions.net/getToken',
        headers: queryParameters);

    return StoreAuthToken(token: token);
  }

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

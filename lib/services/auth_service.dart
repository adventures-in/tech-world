import 'package:adventures_in_tech_world/actions/auth/store_anonymous_id.dart';
import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';
import 'package:adventures_in_tech_world/extensions/firebase_user_extensions.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/utils/git_hub_redirect.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // used to generate the authorization url
  AuthorizationCodeGrant _grant;

  Uri githubRedirectUri(String state) => gitHubRedirect.uriWith(state: state);

  Future<ReduxAction> signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      return StoreAnonymousId(id: authResult.user.uid);
    } catch (error, trace) {
      return AddProblem(
          errorString: error.toString(),
          traceString: trace.toString(),
          type: ProblemType.signInAnonymously);
    }
  }

  Future<Adventurer> signInWithFirebase(String token) async {
    final credential = GithubAuthProvider.getCredential(token: token);

    final authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return authResult.user.toAdventurer();
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

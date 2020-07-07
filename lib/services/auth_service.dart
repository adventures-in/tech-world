import 'package:adventures_in_tech_world/actions/auth/store_auth_step.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_token.dart';
import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_step.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';
import 'package:adventures_in_tech_world/extensions/firebase_user_extensions.dart';
import 'package:adventures_in_tech_world/models/adventurers/adventurer.dart';
import 'package:adventures_in_tech_world/utils/git_hub_redirect.dart';
import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final gitHubRedirect = GitHubRedirect();

  Uri get githubRedirectUri => gitHubRedirect.uri;

  /// Uses the code sent in url parameters by a redirect to get an auth token
  /// by making a call to our cloud function (that has the secret needed to
  /// exchange the code with github for a token).
  Stream<ReduxAction> exchangeCodeForToken(
      BuiltMap<String, String> queryParameters) async* {
    try {
      // change the auth step so UI can indicate job has begun
      yield StoreAuthStep(step: AuthStep.exchangingCode);

      // make a call to our cloud function which will use the code to get a token
      final token = await http.read(
          'https://us-central1-adventures-in-tech-world.cloudfunctions.net/getAuthTokenFromGitHub',
          headers: queryParameters.toMap());

      // put the token in our store
      yield StoreAuthToken(token: token);

      // change the auth step so UI can indicate job done
      yield StoreAuthStep(step: AuthStep.exchangedCode);
    } catch (error, trace) {
      // if an exception was thrown add a problem to the store
      yield AddProblem(
          type: ProblemType.exchangeGitHubCodeForToken,
          errorString: error.toString(),
          traceString: trace?.toString());

      // reset the UI
      yield StoreAuthStep(step: AuthStep.waitingForInput);
    }
  }

  Future<ReduxAction> signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
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

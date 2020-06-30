import 'package:adventures_in/actions/auth/store_auth_state.dart';
import 'package:adventures_in/actions/redux_action.dart';
import 'package:adventures_in/enums/auth_state.dart';

class AuthService {
  AuthService();

  Future<ReduxAction> checkAuthState() async {
    return Future.value(StoreAuthState(state: AuthState.redirectedAndWaiting));
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

import 'dart:async';

import 'package:adventures_in_tech_world/actions/auth/store_user_data.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/problem_location.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:adventures_in_tech_world/extensions/firebase_user_extensions.dart';

extension ConnectAndConvert on FirebaseAuth {
  /// Observe the auth state and convert each [FirebaseUser]
  /// into a [ReduxAction] and send to the store using the passed in [StreamController]
  StreamSubscription<FirebaseUser> connectAuthState(
      StreamController<ReduxAction> controller) {
    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(
        ProblemLocation.connectFirebaseAuthExtension, controller.add);

    // listen to the onAuthStateChanged stream, convert events to actions and
    // dispatch to the store with the controller
    return onAuthStateChanged.listen((firebaseUser) {
      try {
        controller.add(StoreUserData(userData: firebaseUser.toData()));
      } catch (error, trace) {
        handleProblem(error, trace);
      }
    }, onError: handleProblem);
  }
}

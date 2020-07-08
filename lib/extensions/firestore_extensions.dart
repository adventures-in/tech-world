import 'dart:async';

import 'package:adventures_in_tech_world/actions/auth/store_auth_state.dart';
import 'package:adventures_in_tech_world/actions/auth/store_auth_token.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/auth/auth_state.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension ConnectAndConvert on Firestore {
  /// Observe the document at /tokens/${userId} and convert each [DocumentSnapshot]
  /// into a [ReduxAction] and send to the store using the passed in [StreamController]
  StreamSubscription<DocumentSnapshot> connectToAuthToken(
      String userId, StreamController<ReduxAction> controller) {
    // create a function to be called on finding an error
    final handleProblem =
        generateProblemHandler(ProblemType.connectToAuthToken, controller.add);

    // listen to the firestore stream, convert events to actions and dispatch to
    // the store with the controller
    return document('tokens/${userId}').snapshots().listen((docSnapshot) {
      try {
        if (docSnapshot.exists) {
          final githubMap = docSnapshot.data['github'] as Map<String, dynamic>;
          final token = githubMap['access_token'] as String;
          controller.add(StoreAuthToken(token: token));
          controller.add(StoreAuthState(state: AuthState.signedInWithGitHub));
        } else {
          controller.add(StoreAuthState(state: AuthState.notSignedIn));
        }
      } catch (error, trace) {
        handleProblem(error, trace);
      }
    }, onError: handleProblem);
  }
}

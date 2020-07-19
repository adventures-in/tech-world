import 'dart:async';

import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/problem_location.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

extension ConnectAndConvert on Firestore {
  /// Observe the document at /tokens/${userId} and convert each [DocumentSnapshot]
  /// into a [ReduxAction] and send to the store using the passed in [StreamController]
  StreamSubscription<DocumentSnapshot> connectTempTokenToStore(
      String userId, StreamController<ReduxAction> controller) {
    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(
        ProblemLocation.connectTempTokenToStore, controller.add);

    // listen to the firestore stream, convert events to actions and dispatch to
    // the store with the controller
    return document('tokens/${userId}').snapshots().listen((docSnapshot) {
      try {
        if (docSnapshot.exists) {
          final githubMap = docSnapshot.data['github'] as Map<String, dynamic>;
          final token = githubMap['access_token'] as String;
          controller.add(StoreGitHubToken(token: token));
        } else {
          controller.add(StoreGitHubToken(token: null));
        }
      } catch (error, trace) {
        handleProblem(error, trace);
      }
    }, onError: handleProblem);
  }
}

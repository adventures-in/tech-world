import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:redfire/types.dart';
import 'package:tech_world/actions/adventurers/store_adventurer_action.dart';
import 'package:tech_world/actions/auth/store_git_hub_token.dart';

//updateUserInfo
AuthUserData authUserData, String token
'/users/${authUserData.uid}'
set, merge = true
final Map<String, dynamic> data = <String, dynamic>{
      'gitHubToken': token,
      'displayName': authUserData.displayName ??
          ((authUserData.providers.isNotEmpty)
              ? authUserData.providers.first.displayName
              : null),
      'photoURL': authUserData.photoURL ??
          ((authUserData.providers.isNotEmpty)
              ? authUserData.providers.first.photoURL
              : null)
    };


// updateAuthToken(Provider provider, String uid, String token)
    if (provider == Provider.google) {
      return _firestore.doc('/adventurers/$uid').set(
          <String, dynamic>{'googleToken': token}, SetOptions(merge: true));
    }


class DatabaseService {

  /// Observe the document at /tokens/${uid} and convert each
  /// [DocumentSnapshot] into a [ReduxAction] then send to the store using the
  /// passed in [StreamController].
  void connectTempToken({@required String uid}) {
    assert(uid != null);

    final dbSection = DatabaseSection.tempToken;

    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(
        _storeController.add, 'FireStoreService -> connectTempToken');

    try {
      // connect the database to the store and keep the subscription
      subscriptions[dbSection] =
          _firestore.doc('tokens/$uid').snapshots().listen((docSnapshot) {
        try {
          // listen to the firestore stream, convert events to actions and
          // dispatch to the store with the controller
          if (docSnapshot.exists) {
            final githubMap =
                docSnapshot.data()['github'] as Map<String, dynamic>;
            final token = githubMap['access_token'] as String;
            _storeController.add(StoreGitHubToken(token: token));
          } else {
            _storeController.add(StoreGitHubToken(token: null));
          }
        } catch (error, trace) {
          handleProblem(error, trace);
        }
      }, onError: handleProblem);
    } catch (error, trace) {
      handleProblem(error, trace);
    }
  }

  void disconnect(DatabaseSection dbSection) =>
      subscriptions[dbSection]?.cancel();

  Future<void> deleteAnonymousAccount(String userId) async {
    assert(userId != null);

    await _firestore
        .doc('/anon/$userId')
        .set(<String, dynamic>{'delete': true});
  }

  Future<String> retrieveStoredToken(String userId) {
    return _firestore
        .doc('/users/$userId')
        .get()
        .then((snapshot) => snapshot['gitHubToken'] as String);
  }
}

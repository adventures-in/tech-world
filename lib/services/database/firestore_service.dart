import 'dart:async';

import 'package:adventures_in_tech_world/actions/adventurers/store_adventurer.dart';
import 'package:adventures_in_tech_world/actions/auth/store_git_hub_token.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/app/database_section.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/extensions/document_snapshot_extensions.dart';
import 'package:adventures_in_tech_world/models/auth/auth_user_data.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:adventures_in_tech_world/utils/problems_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class FirestoreService implements DatabaseService {
  /// The [FirebaseFirestore] instance
  final FirebaseFirestore _firestore;

  /// The stream of the [_storeController] is used just once on app load, to
  /// connect the [_storeController] to the redux [Store]
  /// Functions that observe parts of the database thus don't return anything,
  /// they just connect the store to the database and keep the subscription so
  /// functions that disregard (stop observing) that part of the database just
  /// cancel the subscription.
  @override
  Stream<ReduxAction> get storeStream => _storeController.stream;

  /// Keep track of the subscriptions so we can cancel them later.
  Map<DatabaseSection, StreamSubscription> subscriptions = {};

  /// The [_storeController] is connected to the redux [Store] via [storeStrea]
  /// and is used by the [DatabaseService] to add actions to the stream where
  /// they will be dispatched by the store.
  final StreamController<ReduxAction> _storeController =
      StreamController<ReduxAction>();

  FirestoreService(FirebaseFirestore firestore) : _firestore = firestore;

  @override
  Future<void> updateUserInfo(AuthUserData authUserData, String token) {
    return _firestore.doc('/users/${authUserData.uid}').set(<String, dynamic>{
      'gitHubToken': token,
      'displayName': authUserData.displayName ??
          ((authUserData.providers.isNotEmpty)
              ? authUserData.providers.first.displayName
              : null),
      'photoURL': authUserData.photoURL ??
          ((authUserData.providers.isNotEmpty)
              ? authUserData.providers.first.photoURL
              : null)
    }, SetOptions(merge: true));
  }

  @override
  Future<void> updateAuthToken(Provider provider, String uid, String token) {
    if (provider == Provider.google) {
      return _firestore.doc('/adventurers/${uid}').set(
          <String, dynamic>{'googleToken': token}, SetOptions(merge: true));
    } else {
      return null;
    }
  }

  /// Observe the document at /adventurers/${uid} and convert each
  /// [DocumentSnapshot] into a [ReduxAction] then send to the store using the
  /// passed in [StreamController].
  @override
  void connectAdventurerData({@required String uid}) {
    assert(uid != null);

    final dbSection = DatabaseSection.adventurerData;

    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(
        _storeController.add, 'FireStoreService -> connectAdventurerData');

    try {
      // connect the database to the store and keep the subscription
      subscriptions[dbSection] = _firestore
          .doc('adventurers/${uid}')
          .snapshots()
          .listen((docSnapshot) {
        try {
          if (docSnapshot.exists) {
            _storeController
                .add(StoreAdventurer(adventurer: docSnapshot.toAdventurer()));
          }
        } catch (error, trace) {
          handleProblem(error, trace);
        }
      }, onError: handleProblem);
    } catch (error, trace) {
      handleProblem(error, trace);
    }
  }

  /// Observe the document at /tokens/${uid} and convert each
  /// [DocumentSnapshot] into a [ReduxAction] then send to the store using the
  /// passed in [StreamController].
  @override
  void connectTempToken({@required String uid}) {
    assert(uid != null);

    final dbSection = DatabaseSection.tempToken;

    // create a function to be called on finding an error
    final handleProblem = generateProblemHandler(
        _storeController.add, 'FireStoreService -> connectTempToken');

    try {
      // connect the database to the store and keep the subscription
      subscriptions[dbSection] =
          _firestore.doc('tokens/${uid}').snapshots().listen((docSnapshot) {
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

  @override
  void disconnect(DatabaseSection dbSection) =>
      subscriptions[dbSection]?.cancel();

  @override
  Future<void> deleteAnonymousAccount(String userId) async {
    assert(userId != null);

    await _firestore
        .doc('/anon/$userId')
        .set(<String, dynamic>{'delete': true});
  }

  @override
  Future<String> retrieveStoredToken(String userId) {
    return _firestore
        .doc('/users/$userId')
        .get()
        .then((snapshot) => snapshot['gitHubToken'] as String);
  }
}

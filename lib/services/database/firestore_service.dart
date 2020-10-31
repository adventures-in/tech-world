import 'dart:async';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/app/database_section.dart';
import 'package:adventures_in_tech_world/extensions/firestore_extensions.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
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
  Future<void> updateUserInfo(UserData userData, String token) {
    return _firestore.doc('/users/${userData.uid}').set(<String, dynamic>{
      'gitHubToken': token,
      'displayName': userData.displayName ??
          ((userData.providers.isNotEmpty)
              ? userData.providers.first.displayName
              : null),
      'photoURL': userData.photoURL ??
          ((userData.providers.isNotEmpty)
              ? userData.providers.first.photoURL
              : null)
    }, SetOptions(merge: true));
  }

  @override
  void connectTempTokenToStore({@required String uid}) {
    assert(uid != null);
    final handleProblem = generateProblemHandler(
        _storeController.add, 'FireStoreService -> connectTempTokenToStore');

    try {
      // connect the database to the store and keep the subscription
      subscriptions[DatabaseSection.tempToken] =
          _firestore.connectTempTokenToStore(uid, _storeController);
    } catch (error, trace) {
      handleProblem(error, trace);
    }
  }

  @override
  void disconnectTempToken() {
    subscriptions[DatabaseSection.tempToken]?.cancel();
  }

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

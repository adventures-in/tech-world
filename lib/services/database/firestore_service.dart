import 'dart:async';

import 'package:adventures_in_tech_world/actions/problems/add_problem.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/app/database_section.dart';
import 'package:adventures_in_tech_world/enums/problem_type.dart';
import 'package:adventures_in_tech_world/services/database/database_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:adventures_in_tech_world/extensions/firestore_extensions.dart';

class FirestoreService implements DatabaseService {
  /// The [Firestore] instance
  final Firestore _firestore;

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

  FirestoreService(Firestore firestore) : _firestore = firestore;

  @override
  void connectTokensDoc({@required String uid}) {
    assert(uid != null);
    try {
      // connect the database to the store and keep the subscription
      subscriptions[DatabaseSection.authToken] =
          _firestore.connectToAuthToken(uid, _storeController);
    } catch (error, trace) {
      _storeController.add(AddProblem(
          errorString: error.toString(),
          traceString: trace.toString(),
          type: ProblemType.observeGitHubToken));
    }
  }

  @override
  void disconnectTokensDoc({@required String uid}) {
    assert(uid != null);
    subscriptions[DatabaseSection.authToken]?.cancel();
  }
}

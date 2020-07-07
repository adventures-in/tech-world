import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/services/database/firestore_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class DatabaseService {
  final _database = FirestoreDatabase(Firestore.instance);

  /// The [Stream] is used just once on app load, to
  /// connect the [Database] to the redux [Store]
  Stream<ReduxAction> get storeStream => _database.storeStream;

  void observeAuthToken({@required String uid}) {
    assert(uid != null);
    _database.observeAuthToken(uid);
  }

  void disregardAuthToken({@required String uid}) {
    assert(uid != null);
    _database.disregardAuthToken(uid);
  }
}

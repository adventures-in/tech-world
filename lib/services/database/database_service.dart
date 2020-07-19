import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:meta/meta.dart';

abstract class DatabaseService {
  Stream<ReduxAction> get storeStream;
  Future<void> addTokenToUser(String userId, String token);
  void connectTokensDoc({@required String uid});
  void disconnectTokensDoc({@required String uid});
}

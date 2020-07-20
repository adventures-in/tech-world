import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/user_data.dart';
import 'package:meta/meta.dart';

abstract class DatabaseService {
  Stream<ReduxAction> get storeStream;
  Future<void> updateUserInfo(UserData userData, String token);
  void connectTempTokenToStore({@required String uid});
  void disconnectTempToken();
  Future<void> deleteAnonymousAccount(String userId);
  Future<String> retrieveStoredToken(String userId);
}

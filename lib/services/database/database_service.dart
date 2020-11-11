import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/app/database_section.dart';
import 'package:adventures_in_tech_world/models/auth/auth_user_data.dart';
import 'package:meta/meta.dart';

abstract class DatabaseService {
  Stream<ReduxAction> get storeStream;
  Future<void> updateUserInfo(AuthUserData authUserData, String token);
  void disconnect(DatabaseSection dbSection);
  void connectTempToken({@required String uid});
  void connectAdventurerData({@required String uid});
  Future<void> deleteAnonymousAccount(String userId);
  Future<String> retrieveStoredToken(String userId);
}

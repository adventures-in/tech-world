import 'package:adventures_in_tech_world/actions/auth/sign_out.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class SignOutReducer extends TypedReducer<AppState, SignOut> {
  SignOutReducer()
      : super((state, action) => state.rebuild((b) => b
          ..adventurer = null
          ..gitHubToken = null));
}

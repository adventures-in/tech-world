import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/sign_out.dart';
import 'package:tech_world/models/app/app_state.dart';

class SignOutReducer extends TypedReducer<AppState, SignOut> {
  SignOutReducer()
      : super((state, action) => state.rebuild((b) => b
          ..adventurer = null
          ..gitHubToken = null));
}

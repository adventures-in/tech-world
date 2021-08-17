import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/store_git_hub_token.dart';
import 'package:tech_world/models/app/app_state.dart';

class StoreGitHubTokenReducer extends TypedReducer<AppState, StoreGitHubToken> {
  StoreGitHubTokenReducer()
      : super((state, action) {
          return state.rebuild((b) => b..gitHubToken = action.token);
        });
}

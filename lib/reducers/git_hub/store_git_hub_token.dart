import 'package:redux/redux.dart';
import 'package:tech_world/actions/auth/store_git_hub_token.dart';

import '../../main.dart';

class StoreGitHubTokenReducer extends TypedReducer<AppState, StoreGitHubToken> {
  StoreGitHubTokenReducer()
      : super((state, action) {
          return state.copyWith(gitHubToken: action.token);
        });
}

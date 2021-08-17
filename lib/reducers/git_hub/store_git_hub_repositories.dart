import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_repositories.dart';
import 'package:tech_world/models/app/app_state.dart';

class StoreGitHubRepositoriesReducer
    extends TypedReducer<AppState, StoreGitHubRepositories> {
  StoreGitHubRepositoriesReducer()
      : super((state, action) => state.rebuild(
            (b) => b..gitHubRepositories.replace(action.repositories)));
}

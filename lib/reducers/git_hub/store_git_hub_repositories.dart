import 'package:adventures_in_tech_world/actions/github/store_git_hub_repositories.dart';
import 'package:adventures_in_tech_world/models/app/app_state.dart';
import 'package:redux/redux.dart';

class StoreGitHubRepositoriesReducer
    extends TypedReducer<AppState, StoreGitHubRepositories> {
  StoreGitHubRepositoriesReducer()
      : super((state, action) => state.rebuild(
            (b) => b..gitHubRepositories.replace(action.repositories)));
}

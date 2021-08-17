import 'package:redux/redux.dart';
import 'package:tech_world/actions/git_hub/store_git_hub_repositories.dart';

import '../../main.dart';

class StoreGitHubRepositoriesReducer
    extends TypedReducer<AppState, StoreGitHubRepositories> {
  StoreGitHubRepositoriesReducer()
      : super((state, action) =>
            state.copyWith(gitHubRepositories: action.repositories));
}

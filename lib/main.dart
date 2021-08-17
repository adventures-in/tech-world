import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:tech_world/enums/nav_bar_enum.dart';
import 'package:tech_world/models/adventurers/adventurer.dart';
import 'package:tech_world/models/git_hub/git_hub_issue.dart';
import 'package:tech_world/models/git_hub/git_hub_pull_request.dart';
import 'package:tech_world/models/git_hub/git_hub_repository.dart';
import 'package:tech_world/models/profile/profile_v_m.dart';
import 'package:tech_world/widgets/home/home_page.dart';

part 'main.freezed.dart';
part 'main.g.dart';

@freezed
class AppState with _$AppState, RedFireState {
  factory AppState({
    /// RedFire AppState members
    required AuthState auth,
    @PageDataConverter() required IList<PageData> pages,
    required IList<ProblemInfo> problems,
    required Settings settings,
    ProfileData? profile,

    /// Additional AppState members
    ///
    /// Profile info
    Adventurer? adventurer,
    required ProfileVM profileVM,

    /// GitHub
    String? gitHubToken,
    required IList<GitHubRepository> gitHubRepositories,
    required IList<GitHubIssue> gitHubAssignedIssues,
    required IList<GitHubPullRequest> gitHubPullRequests,

    /// Navigation
    required NavBarEnum navSelection,
  }) = _AppState;

  factory AppState.init() => AppState(
        /// RedFire init code
        auth: AuthState.init(),
        pages: <PageData>[InitialPageData()].lock,
        problems: IList(),
        settings: Settings.init(),

        /// Additional init code
        profileVM: ProfileVM.init(),
        gitHubRepositories: IList(),
        gitHubAssignedIssues: IList(),
        gitHubPullRequests: IList(),
        navSelection: NavBarEnum.projects,
      );

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}

void main() => runApp(AppWidget<AppState>(
      initialState: AppState.init(),
      initialActions: const [],
      middlewares: const [],
      reducers: const [],
      pageTransforms: const [],
      title: 'Adventures In Tech World',
      mainPage: HomePage(),
    ));

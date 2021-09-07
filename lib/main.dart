import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:tech_world/redux/reducers/store_present_list_reducer.dart';
import 'package:tech_world/services/locator.dart';
import 'package:tech_world/services/players_service.dart';

import 'main_page.dart';
import 'redux/middleware/store_auth_user_data_middleware.dart';
import 'redux/state/game/game_state.dart';

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
    required GameState game,
  }) = _AppState;

  factory AppState.init() => AppState(

      /// RedFire init code
      auth: AuthState.init(),
      pages: <PageData>[InitialPageData()].lock,
      problems: IList(),
      settings: Settings.init(),

      /// Additional init code
      game: GameState.init());

  factory AppState.fromJson(Map<String, Object?> json) =>
      _$AppStateFromJson(json);
}

void main() {
  Locator.providePlayersService(PlayersService(), overwrite: false);

  runApp(AppWidget<AppState>(
    initialState: AppState.init(),
    initialActions: const [],
    middlewares: [StoreAuthUserDataMiddleware()],
    reducers: [StorePresentListReducer()],
    pageTransforms: const [],
    title: 'Tech World', // optional, defaults to 'Title Note Set'
    mainPage: const MainPage(),
  ));
}

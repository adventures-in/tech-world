import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/extensions.dart';
import 'package:redfire/redfire.dart';
import 'package:redfire/types.dart';
import 'package:redfire/widgets.dart';
import 'package:redux/redux.dart';
import 'package:tech_world/redux/middleware/set_present_ids_middleware.dart';
import 'package:tech_world/redux/reducers/set_present_ids_reducer.dart';
import 'package:tech_world/redux/services/locator.dart';
import 'package:tech_world/redux/services/networking_service.dart';
import 'package:tech_world/redux/services/players_service.dart';
import 'package:tech_world/tech_world_game.dart';

import 'main_page.dart';
import 'redux/middleware/set_auth_user_data_middleware.dart';
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
  // We create the store separately so we can pass the onChange stream into
  // the TechWorldGame object.
  final store = Store<AppState>(
    (redfireReducers<AppState>() + [SetPresentIdsReducer()]).combine(),
    initialState: AppState.init(),
    middleware: [
      ...redfireMiddleware(),
      ...[SetPresentIdsMiddleware(), SetAuthUserDataMiddleware()]
    ],
  );

  Locator.provideNetworkingService(NetworkingService(), overwrite: false);
  Locator.providePlayersService(PlayersService(), overwrite: false);

  runApp(AppWidget<AppState>.fromStore(
      initializedStore: store,
      title: 'Tech World',
      mainPage:
          MainPage(game: TechWorldGame(appStateChanges: store.onChange))));
}

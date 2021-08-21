import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'barriers.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState, ReduxModel {
  factory GameState(
      {required Barriers barriers,
      required Set<String> presentIds}) = _GameState;

  factory GameState.init() => GameState(barriers: Barriers(), presentIds: {});

  factory GameState.fromJson(Map<String, Object?> json) =>
      _$GameStateFromJson(json);
}

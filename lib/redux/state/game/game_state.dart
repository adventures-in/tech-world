import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import 'barriers.dart';

part 'game_state.freezed.dart';
part 'game_state.g.dart';

@freezed
class GameState with _$GameState, ReduxModel {
  factory GameState(
      {required Barriers barriers,
      required ISet<String> presentIds}) = _GameState;

  factory GameState.init() =>
      GameState(barriers: Barriers(), presentIds: ISet(const {}));

  factory GameState.fromJson(Map<String, Object?> json) =>
      _$GameStateFromJson(json);
}

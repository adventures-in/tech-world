import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

import '../../../redux/state/math/double2.dart';

part 'character_state.freezed.dart';
part 'character_state.g.dart';

@freezed
class CharacterState with _$CharacterState, ReduxModel {
  factory CharacterState({required String userId, required Double2 position}) =
      _CharacterState;

  factory CharacterState.fromJson(Map<String, Object?> json) =>
      _$CharacterStateFromJson(json);
}

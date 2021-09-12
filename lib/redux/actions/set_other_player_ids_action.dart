import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'set_other_player_ids_action.freezed.dart';
part 'set_other_player_ids_action.g.dart';

@freezed
class SetOtherPlayerIdsAction with _$SetOtherPlayerIdsAction, ReduxAction {
  factory SetOtherPlayerIdsAction(ISet<String> ids) = _SetOtherPlayerIdsAction;

  factory SetOtherPlayerIdsAction.fromJson(Map<String, Object?> json) =>
      _$SetOtherPlayerIdsActionFromJson(json);
}

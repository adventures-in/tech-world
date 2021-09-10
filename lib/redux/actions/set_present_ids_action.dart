import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'set_present_ids_action.freezed.dart';
part 'set_present_ids_action.g.dart';

@freezed
class SetPresentIdsAction with _$SetPresentIdsAction, ReduxAction {
  factory SetPresentIdsAction(ISet<String> ids) = _SetPresentIdsAction;

  factory SetPresentIdsAction.fromJson(Map<String, Object?> json) =>
      _$SetPresentIdsActionFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'update_adventurer_action.freezed.dart';
part 'update_adventurer_action.g.dart';

@freezed
class UpdateAdventurerAction with _$UpdateAdventurerAction, ReduxAction {
  factory UpdateAdventurerAction({
    String? displayName,
    String? photoURL,
    String? firstName,
    String? lastName,
    String? gitHubToken,
    String? googleToken,
    String? asanaToken,
  }) = _UpdateAdventurerAction;

  factory UpdateAdventurerAction.fromJson(Map<String, Object?> json) =>
      _$UpdateAdventurerActionFromJson(json);
}

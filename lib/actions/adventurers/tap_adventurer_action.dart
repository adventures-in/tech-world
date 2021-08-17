import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_adventurer_action.freezed.dart';
part 'tap_adventurer_action.g.dart';

@freezed
class TapAdventurerAction with _$TapAdventurerAction, ReduxAction {
  factory TapAdventurerAction({@Default(false) bool turnOff}) =
      _TapAdventurerAction;

  factory TapAdventurerAction.fromJson(Map<String, Object?> json) =>
      _$TapAdventurerActionFromJson(json);
}

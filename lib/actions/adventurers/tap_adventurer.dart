import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:redfire/types.dart';

part 'tap_adventurer.freezed.dart';
part 'tap_adventurer.g.dart';

@freezed
class TapAdventurer with _$TapAdventurer, ReduxAction {
  factory TapAdventurer({@Default(false) bool? turnOff}) = _TapAdventurer;

  factory TapAdventurer.fromJson(Map<String, Object?> json) =>
      _$TapAdventurerFromJson(json);
}

library observe_adventurer;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'observe_adventurer.g.dart';

abstract class ObserveAdventurer extends Object
    with ReduxAction
    implements Built<ObserveAdventurer, ObserveAdventurerBuilder> {
  ObserveAdventurer._();

  factory ObserveAdventurer() = _$ObserveAdventurer._;

  Object toJson() =>
      serializers.serializeWith(ObserveAdventurer.serializer, this);

  static ObserveAdventurer fromJson(String jsonString) => serializers
      .deserializeWith(ObserveAdventurer.serializer, json.decode(jsonString));

  static Serializer<ObserveAdventurer> get serializer =>
      _$observeAdventurerSerializer;

  @override
  String toString() => 'OBSERVE_ADVENTURER';
}

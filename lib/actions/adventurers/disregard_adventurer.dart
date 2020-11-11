library disregard_adventurer;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'disregard_adventurer.g.dart';

abstract class DisregardAdventurer extends Object
    with ReduxAction
    implements Built<DisregardAdventurer, DisregardAdventurerBuilder> {
  DisregardAdventurer._();

  factory DisregardAdventurer() = _$DisregardAdventurer._;

  Object toJson() =>
      serializers.serializeWith(DisregardAdventurer.serializer, this);

  static DisregardAdventurer fromJson(String jsonString) => serializers
      .deserializeWith(DisregardAdventurer.serializer, json.decode(jsonString));

  static Serializer<DisregardAdventurer> get serializer =>
      _$disregardAdventurerSerializer;

  @override
  String toString() => 'DISREGARD_ADVENTURER';
}

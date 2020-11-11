library update_adventurer;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_adventurer.g.dart';

abstract class UpdateAdventurer extends Object
    with ReduxAction
    implements Built<UpdateAdventurer, UpdateAdventurerBuilder> {
  @nullable
  String get displayName;
  @nullable
  String get photoURL;
  @nullable
  String get firstName;
  @nullable
  String get lastName;
  @nullable
  String get gitHubToken;
  @nullable
  String get googleToken;
  @nullable
  String get asanaToken;

  UpdateAdventurer._();

  factory UpdateAdventurer({
    String displayName,
    String photoURL,
    String firstName,
    String lastName,
    String gitHubToken,
    String googleToken,
    String asanaToken,
  }) = _$UpdateAdventurer._;

  factory UpdateAdventurer.by(
      [void Function(UpdateAdventurerBuilder) updates]) = _$UpdateAdventurer;

  Object toJson() =>
      serializers.serializeWith(UpdateAdventurer.serializer, this);

  static UpdateAdventurer fromJson(String jsonString) => serializers
      .deserializeWith(UpdateAdventurer.serializer, json.decode(jsonString));

  static Serializer<UpdateAdventurer> get serializer =>
      _$updateAdventurerSerializer;

  @override
  String toString() => 'UPDATE_ADVENTURER';
}

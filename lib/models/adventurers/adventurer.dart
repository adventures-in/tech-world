library adventurer;

import 'dart:convert';

import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'adventurer.g.dart';

abstract class Adventurer implements Built<Adventurer, AdventurerBuilder> {
  String get id;
  String get displayName;
  String get photoURL;
  @nullable
  String get firstName;
  @nullable
  String get lastName;

  Adventurer._();

  factory Adventurer(
      {@required String id,
      @required String displayName,
      @required String photoURL,
      String firstName,
      String lastName}) = _$Adventurer._;

  factory Adventurer.by([void Function(AdventurerBuilder) updates]) =
      _$Adventurer;

  Object toJson() => serializers.serializeWith(Adventurer.serializer, this);

  static Adventurer fromJson(String jsonString) => serializers.deserializeWith(
      Adventurer.serializer, json.decode(jsonString));

  static Serializer<Adventurer> get serializer => _$adventurerSerializer;
}

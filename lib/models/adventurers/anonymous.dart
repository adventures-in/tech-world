library anonymous;

import 'dart:convert';

import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'anonymous.g.dart';

abstract class Anonymous implements Built<Anonymous, AnonymousBuilder> {
  String get id;

  Anonymous._();

  factory Anonymous({@required String id}) = _$Anonymous._;

  factory Anonymous.by([void Function(AnonymousBuilder) updates]) = _$Anonymous;

  Object toJson() => serializers.serializeWith(Anonymous.serializer, this);

  static Anonymous fromJson(String jsonString) => serializers.deserializeWith(
      Anonymous.serializer, json.decode(jsonString));

  static Serializer<Anonymous> get serializer => _$anonymousSerializer;
}

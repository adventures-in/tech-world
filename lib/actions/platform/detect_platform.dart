library detect_platform;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'detect_platform.g.dart';

abstract class DetectPlatform extends Object
    with ReduxAction
    implements Built<DetectPlatform, DetectPlatformBuilder> {
  DetectPlatform._();

  factory DetectPlatform() = _$DetectPlatform._;

  Object toJson() => serializers.serializeWith(DetectPlatform.serializer, this);

  static DetectPlatform fromJson(String jsonString) => serializers
      .deserializeWith(DetectPlatform.serializer, json.decode(jsonString));

  static Serializer<DetectPlatform> get serializer =>
      _$detectPlatformSerializer;

  @override
  String toString() => 'DETECT_PLATFORM';
}

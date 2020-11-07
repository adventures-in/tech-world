library update_settings;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/platform/platform_enum.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'update_settings.g.dart';

abstract class UpdateSettings extends Object
    with ReduxAction
    implements Built<UpdateSettings, UpdateSettingsBuilder> {
  PlatformEnum get platform;

  UpdateSettings._();

  factory UpdateSettings({@required PlatformEnum platform}) =
      _$UpdateSettings._;

  factory UpdateSettings.by([void Function(UpdateSettingsBuilder) updates]) =
      _$UpdateSettings;

  Object toJson() => serializers.serializeWith(UpdateSettings.serializer, this);

  static UpdateSettings fromJson(String jsonString) => serializers
      .deserializeWith(UpdateSettings.serializer, json.decode(jsonString));

  static Serializer<UpdateSettings> get serializer =>
      _$updateSettingsSerializer;

  @override
  String toString() => 'UPDATE_SETTINGS';
}

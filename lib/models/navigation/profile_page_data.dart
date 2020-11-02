library profile_page_data;

import 'dart:convert';

import 'package:adventures_in_tech_world/models/navigation/page_data.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'profile_page_data.g.dart';

abstract class ProfilePageData
    implements PageData, Built<ProfilePageData, ProfilePageDataBuilder> {
  ProfilePageData._();

  factory ProfilePageData() = _$ProfilePageData._;

  Object toJson() =>
      serializers.serializeWith(ProfilePageData.serializer, this);

  static ProfilePageData fromJson(String jsonString) => serializers
      .deserializeWith(ProfilePageData.serializer, json.decode(jsonString));

  static Serializer<ProfilePageData> get serializer =>
      _$profilePageDataSerializer;
}

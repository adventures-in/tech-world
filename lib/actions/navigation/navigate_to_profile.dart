library navigate_to_profile;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'navigate_to_profile.g.dart';

abstract class NavigateToProfile extends Object
    with ReduxAction
    implements Built<NavigateToProfile, NavigateToProfileBuilder> {
  NavigateToProfile._();

  factory NavigateToProfile() = _$NavigateToProfile._;

  factory NavigateToProfile.by(
      [void Function(NavigateToProfileBuilder) updates]) = _$NavigateToProfile;

  Object toJson() =>
      serializers.serializeWith(NavigateToProfile.serializer, this);

  static NavigateToProfile fromJson(String jsonString) => serializers
      .deserializeWith(NavigateToProfile.serializer, json.decode(jsonString));

  static Serializer<NavigateToProfile> get serializer =>
      _$navigateToProfileSerializer;

  @override
  String toString() => 'NAVIGATE_TO_PROFILE';
}

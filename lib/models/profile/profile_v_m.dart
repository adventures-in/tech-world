library profile_v_m;

import 'dart:convert';

import 'package:adventures_in_tech_world/enums/auth/linking_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'profile_v_m.g.dart';

abstract class ProfileVM implements Built<ProfileVM, ProfileVMBuilder> {
  BuiltMap<Provider, LinkingStep> get linkingStep;

  ProfileVM._();

  factory ProfileVM({@required BuiltMap<Provider, LinkingStep> linkingStep}) =
      _$ProfileVM._;

  factory ProfileVM.by([void Function(ProfileVMBuilder) updates]) = _$ProfileVM;

  Object toJson() => serializers.serializeWith(ProfileVM.serializer, this);

  static ProfileVM fromJson(String jsonString) => serializers.deserializeWith(
      ProfileVM.serializer, json.decode(jsonString));

  static Serializer<ProfileVM> get serializer => _$profileVMSerializer;
}

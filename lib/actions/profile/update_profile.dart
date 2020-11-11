library update_profile;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/enums/auth/authorization_state.dart';
import 'package:adventures_in_tech_world/enums/auth/authorizing_step.dart';
import 'package:adventures_in_tech_world/enums/auth/linking_step.dart';
import 'package:adventures_in_tech_world/enums/auth/provider.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'update_profile.g.dart';

abstract class UpdateProfile extends Object
    with ReduxAction
    implements Built<UpdateProfile, UpdateProfileBuilder> {
  Provider get provider;
  @nullable
  LinkingStep get linkingStep;
  @nullable
  AuthorizingStep get authorizingStep;
  @nullable
  AuthorizationState get authorizationState;

  UpdateProfile._();

  factory UpdateProfile(
      {@required Provider provider,
      LinkingStep linkingStep,
      AuthorizingStep authorizingStep,
      AuthorizationState authorizationState}) = _$UpdateProfile._;

  factory UpdateProfile.by([void Function(UpdateProfileBuilder) updates]) =
      _$UpdateProfile;

  Object toJson() => serializers.serializeWith(UpdateProfile.serializer, this);

  static UpdateProfile fromJson(String jsonString) => serializers
      .deserializeWith(UpdateProfile.serializer, json.decode(jsonString));

  static Serializer<UpdateProfile> get serializer => _$updateProfileSerializer;

  @override
  String toString() => 'UPDATE_PROFILE';
}

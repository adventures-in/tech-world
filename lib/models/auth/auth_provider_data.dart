library auth_provider_data;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:meta/meta.dart';

part 'auth_provider_data.g.dart';

abstract class AuthProviderData extends Object
    with ReduxAction
    implements Built<AuthProviderData, AuthProviderDataBuilder> {
  /// The provider identifier.
  String get providerId;

  /// The provider’s user ID for the user.
  String get uid;

  /// The name of the user.
  @nullable
  String get displayName;

  /// The URL of the user’s profile photo.
  @nullable
  String get photoUrl;

  /// The user’s email address.
  @nullable
  String get email;

  /// The user's phone number.
  @nullable
  String get phoneNumber;

  AuthProviderData._();

  factory AuthProviderData({
    @required String providerId,
    @required String uid,
    @required String displayName,
    @required String photoUrl,
    @required String email,
    @required String phoneNumber,
  }) = _$AuthProviderData._;

  factory AuthProviderData.by(
      [void Function(AuthProviderDataBuilder) updates]) = _$AuthProviderData;

  Object toJson() =>
      serializers.serializeWith(AuthProviderData.serializer, this);

  static AuthProviderData fromJson(String jsonString) => serializers
      .deserializeWith(AuthProviderData.serializer, json.decode(jsonString));

  static Serializer<AuthProviderData> get serializer =>
      _$authProviderDataSerializer;

  @override
  String toString() => 'AUTH_PROVIDER_DATA';
}

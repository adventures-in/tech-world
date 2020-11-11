library auth_user_data;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'auth_user_data.g.dart';

/// [createdOn] and [lastSignedInOn] are in UTC as required for serialization
abstract class AuthUserData extends Object
    with ReduxAction
    implements Built<AuthUserData, AuthUserDataBuilder> {
  String get uid;
  @nullable
  String get displayName;
  @nullable
  String get photoURL;
  @nullable
  String get email;
  @nullable
  String get phoneNumber;
  @nullable
  DateTime get createdOn;
  DateTime get lastSignedInOn;
  bool get isAnonymous;
  bool get emailVerified;
  BuiltList<AuthProviderData> get providers;

  @memoized
  bool get hasGitHub => providers
      .where((provider) => provider.providerId == 'github.com')
      .isNotEmpty;

  AuthUserData._();

  factory AuthUserData({
    @required String uid,
    @required String displayName,
    @required String photoURL,
    @required String email,
    @required String phoneNumber,
    @required DateTime createdOn,
    @required DateTime lastSignedInOn,
    @required bool isAnonymous,
    @required bool emailVerified,
    @required BuiltList<AuthProviderData> providers,
  }) = _$AuthUserData._;

  factory AuthUserData.by([void Function(AuthUserDataBuilder) updates]) =
      _$AuthUserData;

  Object toJson() => serializers.serializeWith(AuthUserData.serializer, this);

  static AuthUserData fromJson(String jsonString) => serializers
      .deserializeWith(AuthUserData.serializer, json.decode(jsonString));

  static Serializer<AuthUserData> get serializer => _$authUserDataSerializer;

  @override
  String toString() => 'AUTH_USER_DATA';
}

library user_data;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'user_data.g.dart';

/// [createdOn] and [lastSignedInOn] are in UTC as required for serialization
abstract class UserData extends Object
    with ReduxAction
    implements Built<UserData, UserDataBuilder> {
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

  UserData._();

  factory UserData({
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
  }) = _$UserData._;

  factory UserData.by([void Function(UserDataBuilder) updates]) = _$UserData;

  Object toJson() => serializers.serializeWith(UserData.serializer, this);

  static UserData fromJson(String jsonString) =>
      serializers.deserializeWith(UserData.serializer, json.decode(jsonString));

  static Serializer<UserData> get serializer => _$userDataSerializer;

  @override
  String toString() => 'USER_DATA';
}

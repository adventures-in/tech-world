library user_data;

import 'dart:convert';

import 'package:adventures_in_tech_world/models/auth/auth_provider_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:meta/meta.dart';

part 'user_data.g.dart';

abstract class UserData extends Object
    with ReduxAction
    implements Built<UserData, UserDataBuilder> {
  String get providerId;
  String get uid;
  String get displayName;
  String get photoUrl;
  String get email;
  String get phoneNumber;
  DateTime get createdOn;
  DateTime get lastSignedInOn;
  bool get isAnonymous;
  bool get isEmailVerified;
  List<AuthProviderData> get providers;

  UserData._();

  factory UserData({
    @required String providerId,
    @required String uid,
    @required String displayName,
    @required String photoUrl,
    @required String email,
    @required String phoneNumber,
    @required DateTime createdOn,
    @required DateTime lastSignedInOn,
    @required bool isAnonymous,
    @required bool isEmailVerified,
    @required List<AuthProviderData> providers,
  }) = _$UserData._;

  factory UserData.by([void Function(UserDataBuilder) updates]) = _$UserData;

  Object toJson() => serializers.serializeWith(UserData.serializer, this);

  static UserData fromJson(String jsonString) =>
      serializers.deserializeWith(UserData.serializer, json.decode(jsonString));

  static Serializer<UserData> get serializer => _$userDataSerializer;

  @override
  String toString() => 'USER_DATA';
}

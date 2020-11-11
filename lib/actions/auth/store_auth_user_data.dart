library store_auth_user_data;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/models/auth/auth_user_data.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'store_auth_user_data.g.dart';

abstract class StoreAuthUserData extends Object
    with ReduxAction
    implements Built<StoreAuthUserData, StoreAuthUserDataBuilder> {
  @nullable
  AuthUserData get authUserData;

  StoreAuthUserData._();

  factory StoreAuthUserData({@required AuthUserData authUserData}) =
      _$StoreAuthUserData._;

  factory StoreAuthUserData.by(
      [void Function(StoreAuthUserDataBuilder) updates]) = _$StoreAuthUserData;

  Object toJson() =>
      serializers.serializeWith(StoreAuthUserData.serializer, this);

  static StoreAuthUserData fromJson(String jsonString) => serializers
      .deserializeWith(StoreAuthUserData.serializer, json.decode(jsonString));

  static Serializer<StoreAuthUserData> get serializer =>
      _$storeAuthUserDataSerializer;

  @override
  String toString() {
    var userDataSummary = '-';

    if (authUserData == null) {
      userDataSummary = 'null';
    } else if (authUserData.isAnonymous) {
      userDataSummary = 'anon-${authUserData.uid.substring(0, 4)}...';
    } else {
      userDataSummary = '${authUserData.uid.substring(0, 4)}...';
    }

    return 'STORE_USER_DATA: $userDataSummary';
  }
}

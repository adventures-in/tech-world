library sign_in_anonymously;

import 'dart:convert';

import 'package:adventures_in_tech_world/actions/redux_action.dart';
import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sign_in_anonymously.g.dart';

abstract class SignInAnonymously extends Object
    with ReduxAction
    implements Built<SignInAnonymously, SignInAnonymouslyBuilder> {
  SignInAnonymously._();

  factory SignInAnonymously() = _$SignInAnonymously._;

  factory SignInAnonymously.by(
      [void Function(SignInAnonymouslyBuilder) updates]) = _$SignInAnonymously;

  Object toJson() =>
      serializers.serializeWith(SignInAnonymously.serializer, this);

  static SignInAnonymously fromJson(String jsonString) => serializers
      .deserializeWith(SignInAnonymously.serializer, json.decode(jsonString));

  static Serializer<SignInAnonymously> get serializer =>
      _$signInAnonymouslySerializer;

  @override
  String toString() => 'SIGN_IN_ANONYMOUSLY';
}

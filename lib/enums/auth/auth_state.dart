import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'auth_state.g.dart';

class AuthState extends EnumClass {
  static Serializer<AuthState> get serializer => _$authStateSerializer;
  static const AuthState unknown = _$unknown;
  static const AuthState notSignedIn = _$notSignedIn;
  static const AuthState signedInAnonymously = _$signedInAnonymously;
  static const AuthState signedInWithGitHub = _$signedInWithGitHub;
  static const Map<AuthState, int> _$indexMap = {
    unknown: 0,
    notSignedIn: 1,
    signedInAnonymously: 2,
    signedInWithGitHub: 3,
  };

  const AuthState._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<AuthState> get values => _$values;
  static AuthState valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(AuthState.serializer, this);
}

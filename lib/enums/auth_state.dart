import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in/models/app/serializers.dart';

part 'auth_state.g.dart';

class AuthState extends EnumClass {
  static Serializer<AuthState> get serializer => _$authStateSerializer;
  static const AuthState checking = _$checking;
  static const AuthState waitingAfterRedirect = _$waitingAfterRedirect;
  static const AuthState signingInWithGitHub = _$signingInWithGitHub;
  static const AuthState signedIn = _$signedIn;
  static const Map<AuthState, int> _$indexMap = {
    checking: 0,
    waitingAfterRedirect: 1,
    signingInWithGitHub: 2,
    signedIn: 3,
  };

  const AuthState._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<AuthState> get values => _$values;
  static AuthState valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(AuthState.serializer, this);
}

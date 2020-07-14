import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'package:adventures_in_tech_world/models/app/serializers.dart';

part 'auth_state.g.dart';

class AuthState extends EnumClass {
  static Serializer<AuthState> get serializer => _$authStateSerializer;
  static const AuthState unknown = _$unknown;
  static const AuthState notSignedIn = _$notSignedIn;
  // the first step is to sign in to firebase anonymously
  static const AuthState signedInAnonymously = _$signedInAnonymously;
  // when we get a token we use it to sign in with firebase
  static const AuthState signedIn = _$signedIn;
  // when we see a github token we link to / sign in with and add the token
  // to a service so we are authorized to make API calls
  static const AuthState signedInAndGitHubToken = _$signedInAndGitHubToken;
  static const Map<AuthState, int> _$indexMap = {
    unknown: 0,
    notSignedIn: 1,
    signedInAnonymously: 2,
    signedIn: 3,
    signedInAndGitHubToken: 3,
  };

  const AuthState._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<AuthState> get values => _$values;
  static AuthState valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(AuthState.serializer, this);
}

library google_sign_in_credential;

import 'dart:convert';

import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'google_sign_in_credential.g.dart';

/// A BuiltValue version of google_sign_in/GoogleSignInAuthentication
///
/// Holds authentication tokens after sign in.
abstract class GoogleSignInCredential
    implements Built<GoogleSignInCredential, GoogleSignInCredentialBuilder> {
  /// An OpenID Connect ID token that identifies the user.
  @nullable
  String get idToken;

  /// The OAuth2 access token to access Google services.
  @nullable
  String get accessToken;

  /// Server auth code used to access Google Login
  @nullable
  String get serverAuthCode;

  GoogleSignInCredential._();

  factory GoogleSignInCredential(
      {@required String idToken,
      @required String accessToken,
      @required String serverAuthCode}) = _$GoogleSignInCredential._;

  factory GoogleSignInCredential.by(
          [void Function(GoogleSignInCredentialBuilder) updates]) =
      _$GoogleSignInCredential;

  Object toJson() =>
      serializers.serializeWith(GoogleSignInCredential.serializer, this);

  static GoogleSignInCredential fromJson(String jsonString) =>
      serializers.deserializeWith(
          GoogleSignInCredential.serializer, json.decode(jsonString));

  static Serializer<GoogleSignInCredential> get serializer =>
      _$googleSignInCredentialSerializer;
}

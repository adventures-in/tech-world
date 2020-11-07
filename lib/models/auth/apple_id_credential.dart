library apple_id_credential;

import 'dart:convert';

import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:meta/meta.dart';

part 'apple_id_credential.g.dart';

/// A built_value version of [sign_in_with_apple/authorization_credential.dart]
///
/// Authorization details from a successful Sign in with Apple flow.
///
/// Most fields are optional in this class.
///
/// Especially [givenName], [familyName], and [email] member will only be provided on the first authorization between
/// the app and Apple ID.
///
/// The [authorizationCode] member is always present and should be used to check the authorizations with Apple servers
/// from your backend. Upon successful validation, you should create a session in your system for the current user,
/// or consider her now logged in.
abstract class AppleIdCredential
    implements Built<AppleIdCredential, AppleIdCredentialBuilder> {
  /// An identifier associated with the authenticated user.
  ///
  /// This will always be provided on iOS and macOS systems. On Android, however, this will not be present.
  /// This will stay the same between sign ins, until the user deauthorizes your App.
  @nullable
  String get userIdentifier;

  /// The users given name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  @nullable
  String get givenName;

  /// The users family name, in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.fullName] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  @nullable
  String get familyName;

  /// The users email in case it was requested.
  /// You will need to provide the [AppleIDAuthorizationScopes.email] scope to the [AppleIDAuthorizationRequest] for requesting this information.
  ///
  /// This information will only be provided on the first authorizations.
  /// Upon further authorizations, you will only get the [userIdentifier],
  /// meaning you will need to store this data securely on your servers.
  /// For more information see: https://forums.developer.apple.com/thread/121496
  @nullable
  String get email;

  /// The verification code for the current authorization.
  ///
  /// This code should be used by your server component to validate the authorization with Apple within 5 minutes upon receiving it.
  String get authorizationCode;

  /// A JSON Web Token (JWT) that securely communicates information about the user to your app.
  @nullable
  String get identityToken;

  /// The `state` parameter that was passed to the request.
  ///
  /// This data is not modified by Apple.
  @nullable
  String get state;

  AppleIdCredential._();

  factory AppleIdCredential({
    @required String userIdentifier,
    @required String givenName,
    @required String familyName,
    @required String email,
    @required String authorizationCode,
    @required String identityToken,
    @required String state,
  }) = _$AppleIdCredential._;

  factory AppleIdCredential.by(
      [void Function(AppleIdCredentialBuilder) updates]) = _$AppleIdCredential;

  Object toJson() =>
      serializers.serializeWith(AppleIdCredential.serializer, this);

  static AppleIdCredential fromJson(String jsonString) => serializers
      .deserializeWith(AppleIdCredential.serializer, json.decode(jsonString));

  static Serializer<AppleIdCredential> get serializer =>
      _$appleIdCredentialSerializer;
}

/// An OAuth2 access token.
class AccessToken {
  /// The token type, usually "Bearer"
  final String type;

  /// The access token data.
  final String data;

  /// Time at which the token will be expired (UTC time)
  final DateTime expiry;

  /// [expiry] must be a UTC `DateTime`.
  AccessToken(this.type, this.data, this.expiry) {
    if (!expiry.isUtc) {
      throw ArgumentError('The expiry date must be a Utc DateTime.');
    }
  }

  bool get hasExpired {
    return DateTime.now().toUtc().isAfter(expiry);
  }

  @override
  String toString() => 'AccessToken(type=$type, data=$data, expiry=$expiry)';
}

/// OAuth2 Credentials.
class AccessCredentials {
  /// An access token.
  final AccessToken accessToken;

  /// A refresh token, which can be used to refresh the access credentials.
  ///
  /// This field may be null.
  final String refreshToken;

  /// A JWT used in calls to Google APIs that accept an id_token param.
  final String? idToken;

  /// Scopes these credentials are valid for.
  final List<String> scopes;

  AccessCredentials(this.accessToken, this.refreshToken, this.scopes,
      {this.idToken});
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_with_git_hub;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AuthWithGitHub> _$authWithGitHubSerializer =
    new _$AuthWithGitHubSerializer();

class _$AuthWithGitHubSerializer
    implements StructuredSerializer<AuthWithGitHub> {
  @override
  final Iterable<Type> types = const [AuthWithGitHub, _$AuthWithGitHub];
  @override
  final String wireName = 'AuthWithGitHub';

  @override
  Iterable<Object> serialize(Serializers serializers, AuthWithGitHub object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  AuthWithGitHub deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new AuthWithGitHubBuilder().build();
  }
}

class _$AuthWithGitHub extends AuthWithGitHub {
  factory _$AuthWithGitHub([void Function(AuthWithGitHubBuilder) updates]) =>
      (new AuthWithGitHubBuilder()..update(updates)).build();

  _$AuthWithGitHub._() : super._();

  @override
  AuthWithGitHub rebuild(void Function(AuthWithGitHubBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthWithGitHubBuilder toBuilder() =>
      new AuthWithGitHubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthWithGitHub;
  }

  @override
  int get hashCode {
    return 778993026;
  }
}

class AuthWithGitHubBuilder
    implements Builder<AuthWithGitHub, AuthWithGitHubBuilder> {
  _$AuthWithGitHub _$v;

  AuthWithGitHubBuilder();

  @override
  void replace(AuthWithGitHub other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AuthWithGitHub;
  }

  @override
  void update(void Function(AuthWithGitHubBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthWithGitHub build() {
    final _$result = _$v ?? new _$AuthWithGitHub._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

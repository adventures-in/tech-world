// GENERATED CODE - DO NOT MODIFY BY HAND

part of redirect_to_github;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RedirectToGithub> _$redirectToGithubSerializer =
    new _$RedirectToGithubSerializer();

class _$RedirectToGithubSerializer
    implements StructuredSerializer<RedirectToGithub> {
  @override
  final Iterable<Type> types = const [RedirectToGithub, _$RedirectToGithub];
  @override
  final String wireName = 'RedirectToGithub';

  @override
  Iterable<Object> serialize(Serializers serializers, RedirectToGithub object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  RedirectToGithub deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new RedirectToGithubBuilder().build();
  }
}

class _$RedirectToGithub extends RedirectToGithub {
  factory _$RedirectToGithub(
          [void Function(RedirectToGithubBuilder) updates]) =>
      (new RedirectToGithubBuilder()..update(updates)).build();

  _$RedirectToGithub._() : super._();

  @override
  RedirectToGithub rebuild(void Function(RedirectToGithubBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RedirectToGithubBuilder toBuilder() =>
      new RedirectToGithubBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RedirectToGithub;
  }

  @override
  int get hashCode {
    return 416717019;
  }
}

class RedirectToGithubBuilder
    implements Builder<RedirectToGithub, RedirectToGithubBuilder> {
  _$RedirectToGithub _$v;

  RedirectToGithubBuilder();

  @override
  void replace(RedirectToGithub other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$RedirectToGithub;
  }

  @override
  void update(void Function(RedirectToGithubBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RedirectToGithub build() {
    final _$result = _$v ?? new _$RedirectToGithub._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

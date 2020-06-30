// GENERATED CODE - DO NOT MODIFY BY HAND

part of sign_out;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignOut> _$signOutSerializer = new _$SignOutSerializer();

class _$SignOutSerializer implements StructuredSerializer<SignOut> {
  @override
  final Iterable<Type> types = const [SignOut, _$SignOut];
  @override
  final String wireName = 'SignOut';

  @override
  Iterable<Object> serialize(Serializers serializers, SignOut object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  SignOut deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new SignOutBuilder().build();
  }
}

class _$SignOut extends SignOut {
  factory _$SignOut([void Function(SignOutBuilder) updates]) =>
      (new SignOutBuilder()..update(updates)).build();

  _$SignOut._() : super._();

  @override
  SignOut rebuild(void Function(SignOutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignOutBuilder toBuilder() => new SignOutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignOut;
  }

  @override
  int get hashCode {
    return 957153408;
  }
}

class SignOutBuilder implements Builder<SignOut, SignOutBuilder> {
  _$SignOut _$v;

  SignOutBuilder();

  @override
  void replace(SignOut other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SignOut;
  }

  @override
  void update(void Function(SignOutBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignOut build() {
    final _$result = _$v ?? new _$SignOut._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

// GENERATED CODE - DO NOT MODIFY BY HAND

part of check_auth_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CheckAuthState> _$checkAuthStateSerializer =
    new _$CheckAuthStateSerializer();

class _$CheckAuthStateSerializer
    implements StructuredSerializer<CheckAuthState> {
  @override
  final Iterable<Type> types = const [CheckAuthState, _$CheckAuthState];
  @override
  final String wireName = 'CheckAuthState';

  @override
  Iterable<Object> serialize(Serializers serializers, CheckAuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    return <Object>[];
  }

  @override
  CheckAuthState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    return new CheckAuthStateBuilder().build();
  }
}

class _$CheckAuthState extends CheckAuthState {
  factory _$CheckAuthState([void Function(CheckAuthStateBuilder) updates]) =>
      (new CheckAuthStateBuilder()..update(updates)).build();

  _$CheckAuthState._() : super._();

  @override
  CheckAuthState rebuild(void Function(CheckAuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckAuthStateBuilder toBuilder() =>
      new CheckAuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckAuthState;
  }

  @override
  int get hashCode {
    return 512145200;
  }
}

class CheckAuthStateBuilder
    implements Builder<CheckAuthState, CheckAuthStateBuilder> {
  _$CheckAuthState _$v;

  CheckAuthStateBuilder();

  @override
  void replace(CheckAuthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CheckAuthState;
  }

  @override
  void update(void Function(CheckAuthStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CheckAuthState build() {
    final _$result = _$v ?? new _$CheckAuthState._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

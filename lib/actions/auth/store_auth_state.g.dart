// GENERATED CODE - DO NOT MODIFY BY HAND

part of store_auth_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<StoreAuthState> _$storeAuthStateSerializer =
    new _$StoreAuthStateSerializer();

class _$StoreAuthStateSerializer
    implements StructuredSerializer<StoreAuthState> {
  @override
  final Iterable<Type> types = const [StoreAuthState, _$StoreAuthState];
  @override
  final String wireName = 'StoreAuthState';

  @override
  Iterable<Object> serialize(Serializers serializers, StoreAuthState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'state',
      serializers.serialize(object.state,
          specifiedType: const FullType(AuthState)),
    ];

    return result;
  }

  @override
  StoreAuthState deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StoreAuthStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(AuthState)) as AuthState;
          break;
      }
    }

    return result.build();
  }
}

class _$StoreAuthState extends StoreAuthState {
  @override
  final AuthState state;

  factory _$StoreAuthState([void Function(StoreAuthStateBuilder) updates]) =>
      (new StoreAuthStateBuilder()..update(updates)).build();

  _$StoreAuthState._({this.state}) : super._() {
    if (state == null) {
      throw new BuiltValueNullFieldError('StoreAuthState', 'state');
    }
  }

  @override
  StoreAuthState rebuild(void Function(StoreAuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StoreAuthStateBuilder toBuilder() =>
      new StoreAuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreAuthState && state == other.state;
  }

  @override
  int get hashCode {
    return $jf($jc(0, state.hashCode));
  }
}

class StoreAuthStateBuilder
    implements Builder<StoreAuthState, StoreAuthStateBuilder> {
  _$StoreAuthState _$v;

  AuthState _state;
  AuthState get state => _$this._state;
  set state(AuthState state) => _$this._state = state;

  StoreAuthStateBuilder();

  StoreAuthStateBuilder get _$this {
    if (_$v != null) {
      _state = _$v.state;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(StoreAuthState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$StoreAuthState;
  }

  @override
  void update(void Function(StoreAuthStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$StoreAuthState build() {
    final _$result = _$v ?? new _$StoreAuthState._(state: state);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

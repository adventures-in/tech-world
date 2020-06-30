// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AuthState _$checking = const AuthState._('checking');
const AuthState _$redirectedAndWaiting =
    const AuthState._('redirectedAndWaiting');
const AuthState _$signedIn = const AuthState._('signedIn');

AuthState _$valueOf(String name) {
  switch (name) {
    case 'checking':
      return _$checking;
    case 'redirectedAndWaiting':
      return _$redirectedAndWaiting;
    case 'signedIn':
      return _$signedIn;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<AuthState> _$values = new BuiltSet<AuthState>(const <AuthState>[
  _$checking,
  _$redirectedAndWaiting,
  _$signedIn,
]);

Serializer<AuthState> _$authStateSerializer = new _$AuthStateSerializer();

class _$AuthStateSerializer implements PrimitiveSerializer<AuthState> {
  @override
  final Iterable<Type> types = const <Type>[AuthState];
  @override
  final String wireName = 'AuthState';

  @override
  Object serialize(Serializers serializers, AuthState object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  AuthState deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      AuthState.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

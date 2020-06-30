// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem_type.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ProblemType _$googleSignIn = const ProblemType._('googleSignIn');
const ProblemType _$appleSignIn = const ProblemType._('appleSignIn');

ProblemType _$valueOf(String name) {
  switch (name) {
    case 'googleSignIn':
      return _$googleSignIn;
    case 'appleSignIn':
      return _$appleSignIn;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ProblemType> _$values =
    new BuiltSet<ProblemType>(const <ProblemType>[
  _$googleSignIn,
  _$appleSignIn,
]);

Serializer<ProblemType> _$problemTypeSerializer = new _$ProblemTypeSerializer();

class _$ProblemTypeSerializer implements PrimitiveSerializer<ProblemType> {
  @override
  final Iterable<Type> types = const <Type>[ProblemType];
  @override
  final String wireName = 'ProblemType';

  @override
  Object serialize(Serializers serializers, ProblemType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ProblemType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ProblemType.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

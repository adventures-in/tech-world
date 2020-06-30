// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brightness_mode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const BrightnessMode _$light = const BrightnessMode._('light');
const BrightnessMode _$dark = const BrightnessMode._('dark');
const BrightnessMode _$system = const BrightnessMode._('system');

BrightnessMode _$valueOf(String name) {
  switch (name) {
    case 'light':
      return _$light;
    case 'dark':
      return _$dark;
    case 'system':
      return _$system;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<BrightnessMode> _$values =
    new BuiltSet<BrightnessMode>(const <BrightnessMode>[
  _$light,
  _$dark,
  _$system,
]);

Serializer<BrightnessMode> _$brightnessModeSerializer =
    new _$BrightnessModeSerializer();

class _$BrightnessModeSerializer
    implements PrimitiveSerializer<BrightnessMode> {
  @override
  final Iterable<Type> types = const <Type>[BrightnessMode];
  @override
  final String wireName = 'BrightnessMode';

  @override
  Object serialize(Serializers serializers, BrightnessMode object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  BrightnessMode deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      BrightnessMode.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

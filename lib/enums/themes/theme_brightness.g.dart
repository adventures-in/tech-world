// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_brightness.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ThemeBrightness _$light = const ThemeBrightness._('light');
const ThemeBrightness _$dark = const ThemeBrightness._('dark');

ThemeBrightness _$valueOf(String name) {
  switch (name) {
    case 'light':
      return _$light;
    case 'dark':
      return _$dark;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<ThemeBrightness> _$values =
    new BuiltSet<ThemeBrightness>(const <ThemeBrightness>[
  _$light,
  _$dark,
]);

Serializer<ThemeBrightness> _$themeBrightnessSerializer =
    new _$ThemeBrightnessSerializer();

class _$ThemeBrightnessSerializer
    implements PrimitiveSerializer<ThemeBrightness> {
  @override
  final Iterable<Type> types = const <Type>[ThemeBrightness];
  @override
  final String wireName = 'ThemeBrightness';

  @override
  Object serialize(Serializers serializers, ThemeBrightness object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  ThemeBrightness deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      ThemeBrightness.valueOf(serialized as String);
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

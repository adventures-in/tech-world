// GENERATED CODE - DO NOT MODIFY BY HAND

part of theme_set;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ThemeSet> _$themeSetSerializer = new _$ThemeSetSerializer();

class _$ThemeSetSerializer implements StructuredSerializer<ThemeSet> {
  @override
  final Iterable<Type> types = const [ThemeSet, _$ThemeSet];
  @override
  final String wireName = 'ThemeSet';

  @override
  Iterable<Object> serialize(Serializers serializers, ThemeSet object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'colors',
      serializers.serialize(object.colors,
          specifiedType: const FullType(ThemeColors)),
      'brightness',
      serializers.serialize(object.brightness,
          specifiedType: const FullType(ThemeBrightness)),
    ];

    return result;
  }

  @override
  ThemeSet deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ThemeSetBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'colors':
          result.colors.replace(serializers.deserialize(value,
              specifiedType: const FullType(ThemeColors)) as ThemeColors);
          break;
        case 'brightness':
          result.brightness = serializers.deserialize(value,
                  specifiedType: const FullType(ThemeBrightness))
              as ThemeBrightness;
          break;
      }
    }

    return result.build();
  }
}

class _$ThemeSet extends ThemeSet {
  @override
  final ThemeColors colors;
  @override
  final ThemeBrightness brightness;

  factory _$ThemeSet([void Function(ThemeSetBuilder) updates]) =>
      (new ThemeSetBuilder()..update(updates)).build();

  _$ThemeSet._({this.colors, this.brightness}) : super._() {
    if (colors == null) {
      throw new BuiltValueNullFieldError('ThemeSet', 'colors');
    }
    if (brightness == null) {
      throw new BuiltValueNullFieldError('ThemeSet', 'brightness');
    }
  }

  @override
  ThemeSet rebuild(void Function(ThemeSetBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeSetBuilder toBuilder() => new ThemeSetBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeSet &&
        colors == other.colors &&
        brightness == other.brightness;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, colors.hashCode), brightness.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ThemeSet')
          ..add('colors', colors)
          ..add('brightness', brightness))
        .toString();
  }
}

class ThemeSetBuilder implements Builder<ThemeSet, ThemeSetBuilder> {
  _$ThemeSet _$v;

  ThemeColorsBuilder _colors;
  ThemeColorsBuilder get colors => _$this._colors ??= new ThemeColorsBuilder();
  set colors(ThemeColorsBuilder colors) => _$this._colors = colors;

  ThemeBrightness _brightness;
  ThemeBrightness get brightness => _$this._brightness;
  set brightness(ThemeBrightness brightness) => _$this._brightness = brightness;

  ThemeSetBuilder();

  ThemeSetBuilder get _$this {
    if (_$v != null) {
      _colors = _$v.colors?.toBuilder();
      _brightness = _$v.brightness;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ThemeSet other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ThemeSet;
  }

  @override
  void update(void Function(ThemeSetBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ThemeSet build() {
    _$ThemeSet _$result;
    try {
      _$result = _$v ??
          new _$ThemeSet._(colors: colors.build(), brightness: brightness);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'colors';
        colors.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ThemeSet', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

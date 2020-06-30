// GENERATED CODE - DO NOT MODIFY BY HAND

part of settings;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Settings> _$settingsSerializer = new _$SettingsSerializer();

class _$SettingsSerializer implements StructuredSerializer<Settings> {
  @override
  final Iterable<Type> types = const [Settings, _$Settings];
  @override
  final String wireName = 'Settings';

  @override
  Iterable<Object> serialize(Serializers serializers, Settings object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'darkTheme',
      serializers.serialize(object.darkTheme,
          specifiedType: const FullType(ThemeSet)),
      'lightTheme',
      serializers.serialize(object.lightTheme,
          specifiedType: const FullType(ThemeSet)),
      'brightnessMode',
      serializers.serialize(object.brightnessMode,
          specifiedType: const FullType(BrightnessMode)),
    ];

    return result;
  }

  @override
  Settings deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SettingsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'darkTheme':
          result.darkTheme.replace(serializers.deserialize(value,
              specifiedType: const FullType(ThemeSet)) as ThemeSet);
          break;
        case 'lightTheme':
          result.lightTheme.replace(serializers.deserialize(value,
              specifiedType: const FullType(ThemeSet)) as ThemeSet);
          break;
        case 'brightnessMode':
          result.brightnessMode = serializers.deserialize(value,
              specifiedType: const FullType(BrightnessMode)) as BrightnessMode;
          break;
      }
    }

    return result.build();
  }
}

class _$Settings extends Settings {
  @override
  final ThemeSet darkTheme;
  @override
  final ThemeSet lightTheme;
  @override
  final BrightnessMode brightnessMode;

  factory _$Settings([void Function(SettingsBuilder) updates]) =>
      (new SettingsBuilder()..update(updates)).build();

  _$Settings._({this.darkTheme, this.lightTheme, this.brightnessMode})
      : super._() {
    if (darkTheme == null) {
      throw new BuiltValueNullFieldError('Settings', 'darkTheme');
    }
    if (lightTheme == null) {
      throw new BuiltValueNullFieldError('Settings', 'lightTheme');
    }
    if (brightnessMode == null) {
      throw new BuiltValueNullFieldError('Settings', 'brightnessMode');
    }
  }

  @override
  Settings rebuild(void Function(SettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SettingsBuilder toBuilder() => new SettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Settings &&
        darkTheme == other.darkTheme &&
        lightTheme == other.lightTheme &&
        brightnessMode == other.brightnessMode;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, darkTheme.hashCode), lightTheme.hashCode),
        brightnessMode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Settings')
          ..add('darkTheme', darkTheme)
          ..add('lightTheme', lightTheme)
          ..add('brightnessMode', brightnessMode))
        .toString();
  }
}

class SettingsBuilder implements Builder<Settings, SettingsBuilder> {
  _$Settings _$v;

  ThemeSetBuilder _darkTheme;
  ThemeSetBuilder get darkTheme => _$this._darkTheme ??= new ThemeSetBuilder();
  set darkTheme(ThemeSetBuilder darkTheme) => _$this._darkTheme = darkTheme;

  ThemeSetBuilder _lightTheme;
  ThemeSetBuilder get lightTheme =>
      _$this._lightTheme ??= new ThemeSetBuilder();
  set lightTheme(ThemeSetBuilder lightTheme) => _$this._lightTheme = lightTheme;

  BrightnessMode _brightnessMode;
  BrightnessMode get brightnessMode => _$this._brightnessMode;
  set brightnessMode(BrightnessMode brightnessMode) =>
      _$this._brightnessMode = brightnessMode;

  SettingsBuilder();

  SettingsBuilder get _$this {
    if (_$v != null) {
      _darkTheme = _$v.darkTheme?.toBuilder();
      _lightTheme = _$v.lightTheme?.toBuilder();
      _brightnessMode = _$v.brightnessMode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Settings other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Settings;
  }

  @override
  void update(void Function(SettingsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Settings build() {
    _$Settings _$result;
    try {
      _$result = _$v ??
          new _$Settings._(
              darkTheme: darkTheme.build(),
              lightTheme: lightTheme.build(),
              brightnessMode: brightnessMode);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'darkTheme';
        darkTheme.build();
        _$failedField = 'lightTheme';
        lightTheme.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Settings', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'brightness_mode.g.dart';

class BrightnessMode extends EnumClass {
  static Serializer<BrightnessMode> get serializer =>
      _$brightnessModeSerializer;
  static const BrightnessMode light = _$light;
  static const BrightnessMode dark = _$dark;
  static const BrightnessMode system = _$system;
  static const Map<BrightnessMode, int> _$indexMap = {
    light: 0,
    dark: 1,
    system: 2
  };

  const BrightnessMode._(String name) : super(name);

  int get index => _$indexMap[this];
  bool get isLight => this == BrightnessMode.light;
  bool get isDark => this == BrightnessMode.dark;
  bool get isSystem => this == BrightnessMode.system;
  static BuiltSet<BrightnessMode> get values => _$values;
  static BrightnessMode valueOf(String name) => _$valueOf(name);

  Object toJson() => serializers.serializeWith(BrightnessMode.serializer, this);
}

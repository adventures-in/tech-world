import 'package:adventures_in_tech_world/utils/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'theme_brightness.g.dart';

class ThemeBrightness extends EnumClass {
  static Serializer<ThemeBrightness> get serializer =>
      _$themeBrightnessSerializer;
  static const ThemeBrightness light = _$light;
  static const ThemeBrightness dark = _$dark;
  static const Map<ThemeBrightness, int> _$indexMap = {light: 0, dark: 1};

  const ThemeBrightness._(String name) : super(name);

  int get index => _$indexMap[this];
  static BuiltSet<ThemeBrightness> get values => _$values;
  static ThemeBrightness valueOf(String name) => _$valueOf(name);

  Object toJson() =>
      serializers.serializeWith(ThemeBrightness.serializer, this);
}

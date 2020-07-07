library theme_colors;

import 'dart:convert';

import 'package:adventures_in_tech_world/models/app/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'theme_colors.g.dart';

abstract class ThemeColors implements Built<ThemeColors, ThemeColorsBuilder> {
  // colors

  static const int adventures_in_blue = 0xFF2196F3;

  static const int flutter_dark_blue = 0xFF04599C;
  static const int flutter_middle_blue = 0xFF30B8F6;
  static const int flutter_light_blue = 0xFF5EC8F8;

  static const int firebase_yellow = 0xFFFFCB2C;

  static const int primary_grey = 0xFFAAAAAA;
  static const int secondary_grey = 0xFF999999;

  // members

  int get primary;
  int get secondary;
  @nullable
  int get error;

  ThemeColors._();

  factory ThemeColors([void Function(ThemeColorsBuilder) updates]) =
      _$ThemeColors;

  static final standard = ThemeColors((b) => b
    ..primary = adventures_in_blue
    ..secondary = firebase_yellow);

  static final greyscale = ThemeColors((b) => b
    ..primary = primary_grey
    ..secondary = secondary_grey);

  Object toJson() => serializers.serializeWith(ThemeColors.serializer, this);

  static ThemeColors fromJson(String jsonString) => serializers.deserializeWith(
      ThemeColors.serializer, json.decode(jsonString));

  static Serializer<ThemeColors> get serializer => _$themeColorsSerializer;
}

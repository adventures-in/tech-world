import 'package:adventures_in/enums/themes/brightness_mode.dart';
import 'package:flutter/material.dart';

extension MakeThemeMode on ThemeMode {
  static ThemeMode from(BrightnessMode brightness) {
    return (brightness.isLight)
        ? ThemeMode.light
        : (brightness.isDark) ? ThemeMode.dark : ThemeMode.system;
  }
}

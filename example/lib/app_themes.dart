import 'package:flutter/material.dart';

///   created               : Aditya Pratama
///   originalFilename      : app_themes
///   date                  : May 2022
///   —————————————————————————————————————————————————————————————————————————————
///   feature:
///   - light mode
///   - dark mode
///

mixin AppThemes {
  // —————————————————————————————————————————————————————————————————————————————
  // light
  // —————————————————————————————————————————————————————————————————————————————
  static final light = ThemeData.light(useMaterial3: true);

  // —————————————————————————————————————————————————————————————————————————————
  // dark
  // —————————————————————————————————————————————————————————————————————————————
  static final dark = ThemeData.dark(useMaterial3: true);

  static ThemeMode get theme => ThemeMode.light;
}

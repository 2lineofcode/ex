import 'package:flutter/material.dart';

mixin AppThemes {
  static final light = ThemeData.light(useMaterial3: true);

  static final dark = ThemeData.dark(useMaterial3: true);

  static ThemeMode get theme => ThemeMode.light;
}

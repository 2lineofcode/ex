import 'package:flutter/material.dart';

import 'color.dart';

mixin ExTypography {
  // LIGHT THEME TEXT
  static const TextTheme lightTextTheme = TextTheme(
    bodyLarge: TextStyle(color: Color(0xFF000C17), fontSize: 16, height: 1.4),
    bodyMedium: TextStyle(color: colorNeutral, fontSize: 14, height: 1.4),
    displayLarge: TextStyle(color: Color(0xFF000C17), fontSize: 18, height: 1.4, fontWeight: FontWeight.w700),
    displayMedium: TextStyle(color: Color(0xFF000C17), fontSize: 18, height: 1.4),
    bodySmall: TextStyle(color: Color(0xFF7F8790), fontSize: 12, height: 1.4),
    labelSmall: TextStyle(color: colorPrimary),
  );

  // DARK THEME TEXT
  static const TextTheme darkTextTheme = TextTheme(
    bodyLarge: TextStyle(color: colorWhite, fontSize: 16, height: 1.4),
    bodyMedium: TextStyle(color: colorWhite, fontSize: 14, height: 1.4),
    displayLarge: TextStyle(color: colorWhite, fontSize: 18, height: 1.4),
    displayMedium: TextStyle(color: colorWhite, fontSize: 18, height: 1.4),
    bodySmall: TextStyle(color: colorWhite, fontSize: 12, height: 1.4),
    labelSmall: TextStyle(color: colorWhite),
  );
}

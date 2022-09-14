import 'package:flutter/material.dart';

import 'color.dart';

mixin ExTypography {
  // LIGHT THEME TEXT
  static const TextTheme lightTextTheme = TextTheme(
    bodyText1: TextStyle(color: Color(0xFF000C17), fontSize: 16),
    bodyText2: TextStyle(color: Color(0xFF454C52), fontSize: 14),
    headline1: TextStyle(color: Color(0xFF000C17), fontSize: 18),
    headline2: TextStyle(color: Color(0xFF000C17), fontSize: 18),
    caption: TextStyle(color: Color(0xFF7F8790), fontSize: 12),
    overline: TextStyle(color: colorPrimary),
  );

  // DARK THEME TEXT
  static const TextTheme darkTextTheme = TextTheme(
    bodyText1: TextStyle(color: colorWhite, fontSize: 16),
    bodyText2: TextStyle(color: colorWhite, fontSize: 14),
    headline1: TextStyle(color: colorWhite, fontSize: 18),
    headline2: TextStyle(color: colorWhite, fontSize: 18),
    caption: TextStyle(color: colorWhite, fontSize: 12),
    overline: TextStyle(color: colorWhite),
  );
}

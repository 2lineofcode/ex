import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/index.dart';

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
  static final light = ThemeData(
    // Coloring
    primaryColor: colorPrimary,
    primaryColorDark: colorPrimaryDark,
    primaryColorLight: colorPrimaryLight,
    primaryIconTheme: IconThemeData(color: colorNeutral),
    scaffoldBackgroundColor: colorWhite,
    dividerColor: colorNeutral[200],

    // ListTile
    listTileTheme: ListTileThemeData(
      textColor: colorBlack,
      minLeadingWidth: 16,
      contentPadding: EdgeInsets.all(0),
    ),

    // FAB
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: TextStyle(fontWeight: FontWeight.w700),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
    ),

    // AppBar
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: colorBlack),
      color: Colors.white,
      elevation: .1,
      centerTitle: false,
      titleTextStyle: TextStyle(color: colorBlack, fontFamily: 'InterSans'),
      actionsIconTheme: IconThemeData(color: Colors.grey),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    // Text
    textTheme: GoogleFonts.interTextTheme(ExTypography.lightTextTheme),
    snackBarTheme: const SnackBarThemeData(backgroundColor: colorPrimaryLight),

    // Icon
    iconTheme: const IconThemeData(color: colorPrimary),
    popupMenuTheme: const PopupMenuThemeData(color: colorNeutralLight),

    // InputDecoration
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(fontSize: 14, color: colorBlack),
      hintStyle: TextStyle(fontSize: 14, color: colorNeutral[300]),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    ),

    // Card
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorNeutral[150]!),
        borderRadius: BorderRadius.circular(4),
      ),
    ),

    // Chip
    chipTheme: ChipThemeData.fromDefaults(
      secondaryColor: colorSuccess[50]!,
      labelStyle: TextStyle(color: colorSuccess, fontSize: 12),
      primaryColor: colorSuccess,
    ),
    colorScheme: const ColorScheme.light(primary: colorPrimary).copyWith(secondary: colorAccent).copyWith(background: colorWhite).copyWith(error: colorError),
  );

  // —————————————————————————————————————————————————————————————————————————————
  // dark
  // —————————————————————————————————————————————————————————————————————————————
  static final dark = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
    primaryColor: colorPrimary,
    primaryColorDark: colorPrimaryDark,
    primaryColorLight: colorPrimaryLight,
    primaryIconTheme: IconThemeData(color: colorNeutral),
    cardColor: colorWhite,
    scaffoldBackgroundColor: colorNeutral[900],
    disabledColor: colorNeutral[100],
    hintColor: colorNeutral[300],
    dividerColor: colorNeutral[200],
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorPrimary[800],
    ),
    listTileTheme: ListTileThemeData(
      textColor: colorWhite,
      minLeadingWidth: 16,
    ),
    appBarTheme: AppBarTheme(
      color: colorNeutral[500],
      iconTheme: IconThemeData(color: colorWhite),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 1.0,
      titleTextStyle: TextStyle(color: colorWhite, fontWeight: FontWeight.bold),
      toolbarTextStyle: TextStyle(color: colorWhite),
      centerTitle: false,
      actionsIconTheme: IconThemeData(color: colorWhite),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: colorPrimary,
      textTheme: ButtonTextTheme.accent,
      colorScheme: ColorScheme.highContrastDark(),
    ),
    cardTheme: CardTheme(
      color: colorNeutralDark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states) => colorAccent),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) => TextStyle(color: colorWhite)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) => TextStyle(color: colorWhite)),
      ),
    ),
    snackBarTheme: SnackBarThemeData(backgroundColor: colorBlack),
    iconTheme: IconThemeData(color: colorWhite),
    popupMenuTheme: PopupMenuThemeData(color: colorNeutral[900]),
    colorScheme: ColorScheme.dark(primary: colorNeutral[500]!).copyWith(secondary: colorAccent).copyWith(background: colorNeutral[900]).copyWith(error: colorError),
  );

  static ThemeMode get theme => ThemeMode.light;
}

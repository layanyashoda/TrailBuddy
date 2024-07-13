import 'package:flutter/material.dart';
import 'package:trailbuddy/utils/theme/custom_themes/text_theme.dart';

import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';

class TrailAppTheme {
  TrailAppTheme._();

  /// Light Theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TrailTextTheme.lightTextTheme,
    chipTheme: TrailChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TrailBarTheme.lightAppbarTheme,
    checkboxTheme: TrailCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TrailBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TrailElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TrailOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TrailFormFieldTheme.lightInputDecorationTheme,
  );

  /// Dark Theme
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TrailTextTheme.darkTextTheme,
    chipTheme: TrailChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TrailBarTheme.darkAppbarTheme,
    checkboxTheme: TrailCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TrailBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TrailElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TrailOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TrailFormFieldTheme.darkInputDecorationTheme,
  );
}
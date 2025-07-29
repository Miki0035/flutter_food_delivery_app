import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/themes/custom_themes/app_bar_theme.dart';
import 'package:food_delivery_app/utilis/themes/custom_themes/check_box_theme.dart';
import 'package:food_delivery_app/utilis/themes/custom_themes/input_decoration_theme.dart';
import 'package:food_delivery_app/utilis/themes/custom_themes/navigation_bar_theme.dart';

class FAppTheme {
  FAppTheme._();

  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: 'Quicksand',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xFFFAFAFA),
    appBarTheme: FAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: FInputDecorationTheme.lightInputDecorationTheme,
    navigationBarTheme: FNavigationBarTheme.lightNavigationBarTheme,
    checkboxTheme: FCheckBoxTheme.lightCheckBoxTheme,
  );
}

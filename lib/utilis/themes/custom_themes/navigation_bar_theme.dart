import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FNavigationBarTheme {
  FNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
        labelPadding: EdgeInsets.all(FSize.normalSpace),
        backgroundColor: Colors.white,
        elevation: 2.0,
        indicatorColor: Colors.transparent,
        indicatorShape: null,
      );
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FInputDecorationTheme {
  FInputDecorationTheme._();

  static const InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
        labelStyle: TextStyle(
          fontSize: FSize.fontSizeLg,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: FColor.orange, width: 1.0),
        ),
      );
}

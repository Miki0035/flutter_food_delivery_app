import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FDescriptionText extends StatelessWidget {
  final String description;

  const FDescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,

      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: FSize.fontSizeLg,
        height: 1.5,
      ),
    );
  }
}

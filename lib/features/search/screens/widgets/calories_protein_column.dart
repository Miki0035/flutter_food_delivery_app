import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FCalorieProteinColumn extends StatelessWidget {
  final String title;
  final int value;
  final String measurement;

  const FCalorieProteinColumn({
    super.key,
    required this.title,
    required this.value,
    this.measurement = "",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: FSize.fontSizeLg,
          ),
        ),
        SizedBox(height: 4.0,),
        Text(
          "$value $measurement",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: FSize.fontSizeLg,
          ),
        ),
      ],
    );
  }
}

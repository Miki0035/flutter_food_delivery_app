
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FIconWithTextRow extends StatelessWidget {
  final String image;
  final String text;

  const FIconWithTextRow({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(image, width: 20.0, height: 20.0, fit: BoxFit.contain),
        SizedBox(width: 6.0,),
        Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: FSize.fontSizeLg,
          ),
        ),
      ],
    );
  }
}

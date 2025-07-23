import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FImageAsIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String image;

  const FImageAsIconButton({super.key, this.onPressed, required this.image});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Image.asset(
        image,
        color: Colors.black,
        width: FSize.iconMd,
        height: FSize.iconMd,
      ),
    );
  }
}

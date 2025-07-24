import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FImageAsIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final String image;
  final double iconSize;

  const FImageAsIconButton({
    super.key,
    this.onPressed,
    required this.image,
    this.backgroundColor = Colors.transparent,
    this.iconColor = Colors.black,
    this.iconSize = FSize.iconMd,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      style: IconButton.styleFrom(backgroundColor: backgroundColor),
      icon: Image.asset(
        image,
        color: iconColor,
        width: FSize.iconMd,
        height: FSize.iconMd,
      ),
    );
  }
}

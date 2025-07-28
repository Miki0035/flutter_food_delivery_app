import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FImageButtonContainer extends StatelessWidget {
  final String image;
  final double size;
  final double imageSize;
  final Color backgroundColor;
  final Color imageColor;
  final VoidCallback onTap;

  const FImageButtonContainer({
    super.key,
    required this.image,
    required this.size,
    required this.backgroundColor,
    required this.imageColor,
    required this.onTap,
    required this.imageSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(FSize.normalSpace),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Image.asset(
          image,
          width: imageSize,
          height: imageSize,
          color: imageColor,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

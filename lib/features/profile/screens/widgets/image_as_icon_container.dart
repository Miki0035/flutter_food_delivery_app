import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FImageAsIconContainer extends StatelessWidget {
  final String image;
  final Color backgroundColor;
  final double imageSize;
  final double containerSize;

  const FImageAsIconContainer({
    super.key,
    required this.image,
    this.backgroundColor = FColor.lightOrange,
    this.imageSize = FSize.iconLg,
    this.containerSize = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      padding: EdgeInsets.all(FSize.defaultSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: backgroundColor.withValues(alpha: 0.1),
      ),
      child: Image.asset(
        image,
        color: FColor.orange,
        fit: BoxFit.contain,
        width: imageSize,
        height: imageSize,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FImageAsIconContainer extends StatelessWidget {
  final String image;

  const FImageAsIconContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      padding: EdgeInsets.all(FSize.defaultSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: FColor.lightOrange.withValues(alpha: 0.1),
      ),
      child: Image.asset(
        image,
        color: FColor.orange,
        width: FSize.iconLg,
        height: FSize.iconLg,
      ),
    );
  }
}

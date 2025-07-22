import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FStackedContainerWithNotificationCount extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final int notificationCount;
  final String image;
  final double width;
  final double height;

  const FStackedContainerWithNotificationCount({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.notificationCount = 0,
    this.width = FSize.iconXl,
    this.height = FSize.iconXl,
    required this.image,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Image.asset(image, fit: BoxFit.contain, color: iconColor),
        ),
        if (notificationCount != 0)
          Positioned(
            top: -10,
            right: -5,
            child: Container(
              width: FSize.iconMd,
              height: FSize.iconMd,
              decoration: BoxDecoration(
                color: FColor.orange,
                borderRadius: BorderRadius.circular(50.0),
              ),

              child: Text(
                '$notificationCount',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

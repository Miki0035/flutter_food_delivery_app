import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FStackedContainerWithNotificationCount extends StatelessWidget {
  final Color backgroundColor;
  final int notificationCount;

  const FStackedContainerWithNotificationCount({
    super.key,
    this.backgroundColor = Colors.black,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: FSize.iconXl,
          height: FSize.iconXl,
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Image.asset(
            FImage.bag,
            fit: BoxFit.contain,
            color: Colors.white,
          ),
        ),
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

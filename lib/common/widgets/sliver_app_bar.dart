import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FSliverAppBar extends StatelessWidget {
  final String upperTitle;
  final String lowerTitle;
  final bool showDownArrow;
  final int notificationCount;

  const FSliverAppBar({
    super.key,
    required this.upperTitle,
    required this.lowerTitle,
    this.showDownArrow = true,
    this.notificationCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(FSize.normalSpace),
      sliver: SliverAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              upperTitle.toUpperCase(),
              style: TextStyle(
                fontSize: FSize.fontSizeSm,
                color: FColor.orange,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                Text(
                  lowerTitle,
                  style: TextStyle(
                    fontSize: FSize.fontSizeLg,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 4.0),
                if (showDownArrow)
                  Image.asset(
                    FImage.arrowDown,
                    fit: BoxFit.contain,
                    color: Colors.black,
                    width: FSize.iconXs,
                    height: FSize.iconXs,
                  ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              top: FSize.normalSpace,
              right: FSize.defaultSpace,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: FSize.iconXl,
                  height: FSize.iconXl,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
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
            ),
          ),
        ],
      ),
    );
  }
}

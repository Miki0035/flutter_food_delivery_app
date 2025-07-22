import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';
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
            child: FStackedContainerWithNotificationCount(
              notificationCount: notificationCount,
              backgroundColor: Colors.black,
              iconColor: Colors.white,
              image: FImage.bag,
            ),
          ),
        ],
      ),
    );
  }
}

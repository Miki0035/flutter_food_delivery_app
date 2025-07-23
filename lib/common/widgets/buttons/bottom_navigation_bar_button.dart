import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';

class FBottomNavigationBarButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String image;
  final String label;
  final Color iconColor;
  final Color textColor;

  const FBottomNavigationBarButton({
    super.key,
    this.onTap,
    required this.image,
    required this.iconColor,
    required this.label,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FStackedContainerWithNotificationCount(
              image: image,
              iconColor: iconColor,
            ),
            Text(
              label,
              style: TextStyle(color: textColor, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

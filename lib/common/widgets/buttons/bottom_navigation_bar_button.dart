import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class FBottomNavigationBarButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String image;
  final String label;
  final Color iconColor;
  final Color textColor;
  final int notificationCount;

  const FBottomNavigationBarButton({
    super.key,
    this.onTap,
    required this.image,
    required this.iconColor,
    required this.label,
    required this.textColor,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<FCartProvider>();
    return GestureDetector(
      onTap: onTap,
      child: SingleChildScrollView(
        child: Column(
          children: [
            FStackedContainerWithNotificationCount(
              image: image,
              iconColor: iconColor,
              notificationCount: notificationCount,
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

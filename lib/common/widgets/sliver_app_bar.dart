import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FSliverAppBar extends StatelessWidget {
  final int notificationCount;
  final Widget? leading;
  final Widget? title;
  final List<Widget>? actions;
  final bool centerTitle;

  const FSliverAppBar({
    super.key,
    this.notificationCount = 2,
    this.title,
    this.actions,
    this.centerTitle = false,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(FSize.normalSpace),
      sliver: SliverAppBar(
        leading: leading,
        title: title,
        actions: actions,
        centerTitle: centerTitle,
      ),
    );
  }
}

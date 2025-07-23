import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/appbar_tile_with_subtitle.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          FSliverAppBar(
            title: FAppBarTitleWithSubtitle(
              title: "Search",
              subtitle: "Find your Favorite Food",
              showDownArrow: true,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  top: FSize.normalSpace,
                  right: FSize.defaultSpace,
                ),
                child: FStackedContainerWithNotificationCount(
                  notificationCount: 2,
                  backgroundColor: Colors.black,
                  iconColor: Colors.white,
                  image: FImage.bag,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

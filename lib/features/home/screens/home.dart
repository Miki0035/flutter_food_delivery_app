import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/data.dart';
import 'package:food_delivery_app/common/widgets/appbar_tile_with_subtitle.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:food_delivery_app/features/home/screens/widgets/home_menu_item_container.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<FCartProvider>();
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            FSliverAppBar(
              title: Consumer<DatabaseRepository>(
                builder:
                    (context, provider, child) => FAppBarTitleWithSubtitle(
                      title: "Deliver to",
                      subtitle:
                          provider.dbUser.address1 ??
                          "Please update your profile address ",
                      showDownArrow: true,
                    ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(
                    top: FSize.normalSpace,
                    right: FSize.defaultSpace,
                  ),
                  child: FStackedContainerWithNotificationCount(
                    notificationCount: cartProvider.cartItems.length,
                    backgroundColor: Colors.black,
                    iconColor: Colors.white,
                    image: FImage.bag,
                  ),
                ),
              ],
            ),

            SliverPadding(
              padding: EdgeInsets.all(FSize.defaultSpace),
              sliver: SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        separatorBuilder:
                            (context, index) =>
                                SizedBox(height: FSize.defaultSpace),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeListItems.length,
                        itemBuilder: (context, index) {
                          return FHomeMenuItemContainer(
                            item: homeListItems[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

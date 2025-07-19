import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/data.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/features/home/screens/widgets/home_menu_item_container.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            FSliverAppBar(
              upperTitle: 'Deliver to',
              lowerTitle: 'Addis Abeba, Ethiopia',
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

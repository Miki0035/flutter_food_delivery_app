import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/appbar_tile_with_subtitle.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/image_as_icon_container.dart';
import 'package:food_delivery_app/features/search/providers/search_provider.dart';
import 'package:food_delivery_app/features/search/screens/widgets/search_bar.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class FSearchView extends StatelessWidget {
  const FSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Consumer<FSearchProvider>(
        builder:
            (context, provider, child) => CustomScrollView(
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
                SliverPadding(
                  padding: EdgeInsets.all(FSize.defaultSpace),

                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        FSearchBar(controller: provider.controller),
                        SizedBox(height: FSize.defaultSpace * 1.4),
                        SizedBox(
                          height: 45.0,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (context, index) =>
                                    SizedBox(width: FSize.defaultSpace),
                            itemCount: provider.categories.length,
                            itemBuilder:
                                (context, index) => GestureDetector(
                                  onTap: () => provider.changeIndex(index),
                                  child: Container(
                                    width: 90.0,
                                    margin: EdgeInsets.symmetric(vertical: 4.0),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withValues(
                                            alpha: 0.5,
                                          ),
                                          spreadRadius: 1.0,
                                          blurRadius: 2.0,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      color:
                                          index == provider.selectedIndex
                                              ? FColor.orange
                                              : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider.categories[index].name,
                                        style: TextStyle(
                                          color:
                                              index == provider.selectedIndex
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          ),
                        ),
                        SizedBox(height: FSize.defaultSpace * 1.4),
                      ],
                    ),
                  ),
                ),

                SliverPadding(
                  padding: EdgeInsets.all(FSize.defaultSpace),
                  sliver: SliverGrid.builder(
                    itemCount: 5,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      mainAxisSpacing: MediaQuery.sizeOf(context).width / 12,
                      crossAxisSpacing: MediaQuery.sizeOf(context).width / 20,
                    ),
                    itemBuilder:
                        (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,

                            children: [
                              Positioned(
                                top: -70,
                                child: Hero(
                                  tag: 1,
                                  child: Image.asset(
                                    FImage.burgerOne,
                                    width: 150.0,
                                    height: 150.0,
                                  ),
                                ),
                              ),
                              SizedBox(height: FSize.defaultSpace,),
                              Positioned(
                                bottom: 0,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Wendy's Burger",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: FSize.fontSizeLg,
                                      ),
                                    ),
                                    SizedBox(height: 4.0,),
                                    Text(
                                      "From \$10.4",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: FSize.fontSizeMd,
                                      ),
                                    ),
                                    TextButton.icon(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        overlayColor: FColor.orange.withValues(alpha: 0.5),
                                        splashFactory: InkRipple.splashFactory
                                      ),
                                      label: Text(
                                        "Add to Cart",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: FColor.orange,
                                        ),
                                      ),
                                      icon: FImageAsIconContainer(
                                        image: FImage.plus,
                                        imageSize: FSize.iconSm,
                                        backgroundColor: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
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

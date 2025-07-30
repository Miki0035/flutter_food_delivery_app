import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/appbar_tile_with_subtitle.dart';
import 'package:food_delivery_app/common/widgets/empty_state_container.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:food_delivery_app/features/search/providers/search_provider.dart';
import 'package:food_delivery_app/features/search/screens/detail_screen.dart';
import 'package:food_delivery_app/features/search/screens/widgets/grid_view_menu_item_container.dart';
import 'package:food_delivery_app/features/search/screens/widgets/search_bar.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class FSearchView extends StatelessWidget {
  const FSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<FCartProvider>();
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
                        // SEARCH BAR
                        FSearchBar(controller: provider.query),

                        SizedBox(height: FSize.defaultSpace * 1.4),

                        // HORIZONTAL LIST FILTER ITEMS
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
                                  onTap: () => provider.changeCategory(index),
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
                                          index == provider.selectedCategory
                                              ? FColor.orange
                                              : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        provider.categories[index].name,
                                        style: TextStyle(
                                          color:
                                              index == provider.selectedCategory
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
                      ],
                    ),
                  ),
                ),

                provider.filteredMenus.isEmpty
                    ? FEmptyStateContainer(
                      message: "Nothing matched your search",
                      description:
                          "Try a different search term or check for typos.",
                    )
                    //GRID VIEW SECTION
                    : SliverPadding(
                      padding: EdgeInsets.symmetric(
                        horizontal: FSize.defaultSpace,
                        vertical: FSize.defaultSpace * 5,
                      ),
                      sliver: SliverGrid.builder(
                        itemCount: provider.filteredMenus.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 250,
                          mainAxisSpacing:
                              MediaQuery.sizeOf(context).height / 12,
                          crossAxisSpacing:
                              MediaQuery.sizeOf(context).width / 20,
                        ),
                        itemBuilder:
                            (context, index) => FGridViewItemContainer(
                              onTap: () {
                                provider.setSelectedItem(index);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FDetailScreen(),
                                  ),
                                );
                              },
                              name: provider.filteredMenus[index].name,
                              image: provider.filteredMenus[index].imageUrl,
                              price: provider.filteredMenus[index].price,
                              index: provider.filteredMenus[index].name,
                              addToCart: () {
                                if (!context.mounted) return;
                                final success = cartProvider.addItemToCart(
                                  provider.filteredMenus[index],
                                  1,
                                );
                                if (success && context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Item added to cart",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: FSize.fontSizeLg,
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },
                            ),
                      ),
                    ),
              ],
            ),
      ),
    );
  }
}

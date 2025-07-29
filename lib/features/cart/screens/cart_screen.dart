import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/models/cart_model.dart';
import 'package:food_delivery_app/common/widgets/appbar_tile_with_subtitle.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/buttons/text_button.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:food_delivery_app/features/cart/screens/widgets/cart_item_list_tile.dart';
import 'package:food_delivery_app/features/cart/screens/widgets/payment_summary_description_value_row.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_provider.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/image_as_icon_container.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/outlined_button.dart';
import 'package:food_delivery_app/features/search/screens/detail_screen.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<FBottomNavBarProvider>();
    final user = context.read<DatabaseRepository>();
    return Consumer<FCartProvider>(
      builder:
          (context, provider, child) => Scaffold(
            body: CustomScrollView(
              slivers: [
                FSliverAppBar(
                  leading: FImageAsIconButton(
                    image: FImage.arrowBack,
                    onPressed: () => navProvider.back(),
                  ),
                  title: Text(
                    'Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: FSize.fontSizeLg,
                    ),
                  ),
                  centerTitle: true,
                  actions: [FImageAsIconButton(image: FImage.search)],
                ),

                // ADDRESS LOCATION
                SliverPadding(
                  padding: EdgeInsets.all(FSize.defaultSpace),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FAppBarTitleWithSubtitle(
                            title: "Delivery Location",
                            subtitle:
                                "${user.userDoc?.address1 ?? "update profile"} ",
                          ),
                        ),

                        OutlinedButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            side: BorderSide(color: FColor.orange),
                          ),
                          child: Text(
                            "Change Location",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: FColor.orange,
                              fontSize: FSize.fontSizeLg,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // LIST VIEW OF CART ITEMS
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(childCount: 2, (
                      context,
                      index,
                    ) {
                      final cartItem = provider.cartItems[0];

                      return FCartListTileContainer(
                        price: (cartItem.item.price * cartItem.quantity)
                            .toStringAsFixed(2),
                        name: cartItem.item.name,
                        plusTap:
                            () =>
                                provider.increaseItemQuantityFromCart(cartItem),
                        minusTap:
                            () =>
                                provider.decreaseItemQuantityFromCart(cartItem),
                        image: cartItem.item.imageUrl,
                        onDelete: () {},
                        quantity: "${cartItem.quantity}",
                      );
                    }),
                  ),
                ),

                // PAYMENT SUMMARY SECTION
                SliverToBoxAdapter(
                  child: Container(
                    margin: EdgeInsets.all(FSize.defaultSpace),
                    padding: EdgeInsets.all(FSize.defaultSpace),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Payment Summary",
                            style: TextStyle(
                              fontSize: FSize.fontSizeLg * 1.2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: FSize.normalSpace),
                        FPaymentSummaryRow(
                          description: "Total Items (3)",
                          value: "900",
                        ),
                        SizedBox(height: FSize.normalSpace),
                        FPaymentSummaryRow(
                          description: "Discount",
                          value: "-145",
                        ),
                        SizedBox(height: FSize.defaultSpace),

                        Divider(
                          height: 0.5,
                          endIndent: 5.0,
                          color: Colors.grey.withValues(alpha: 0.2),
                        ),

                        SizedBox(height: FSize.defaultSpace),

                        FPaymentSummaryRow(description: "Total", value: "845"),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: FTextButton(buttonText: "Order Now", onPressed: () {}),
                ),
              ],
            ),
          ),
    );
  }
}

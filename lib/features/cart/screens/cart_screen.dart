import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/appbar_tile_with_subtitle.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/buttons/text_button.dart';
import 'package:food_delivery_app/common/widgets/empty_state_container.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';
import 'package:food_delivery_app/features/authentication/sign_up/screens/widgets/popup_bottom_sheet_container.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:food_delivery_app/features/cart/screens/widgets/cart_item_list_tile.dart';
import 'package:food_delivery_app/features/cart/screens/widgets/payment_summary_description_value_row.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_provider.dart';
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
            body: SafeArea(
              child: CustomScrollView(
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
                    actions: [
                      FImageAsIconButton(
                        image: FImage.search,
                        onPressed: () {
                          navProvider.changeIndex(1);
                        },
                      ),
                    ],
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
                            onPressed: () {
                              navProvider.changeIndex(3);
                            },
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

                  provider.cartItems.isEmpty
                      ? SliverToBoxAdapter(
                        child: FEmptyStateContainer(
                          message: "Cart is empty",
                          description: "Add items to your cart for purchase.",
                        ),
                      )
                      :
                      // LIST VIEW OF CART ITEMS
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        sliver: SliverList(
                          delegate: SliverChildBuilderDelegate(
                            childCount: provider.cartItems.length,
                            (context, index) {
                              final cartItem = provider.cartItems[index];

                              return FCartListTileContainer(
                                price: (cartItem.item.price * cartItem.quantity)
                                    .toStringAsFixed(2),
                                name: cartItem.item.name,
                                plusTap:
                                    () => provider.increaseItemQuantityFromCart(
                                      cartItem,
                                    ),
                                minusTap:
                                    () => provider.decreaseItemQuantityFromCart(
                                      cartItem,
                                    ),
                                image: cartItem.item.imageUrl,
                                onDelete:
                                    () => provider.removeItemFromCart(cartItem),
                                quantity: "${cartItem.quantity}",
                              );
                            },
                          ),
                        ),
                      ),

                  // PAYMENT SUMMARY SECTION
                  if (provider.cartItems.isNotEmpty)
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
                            SizedBox(height: FSize.defaultSpace),
                            FPaymentSummaryRow(
                              description:
                                  "Total Items (${provider.cartItems.length})",
                              value: provider.totalPrice(),
                            ),
                            SizedBox(height: FSize.normalSpace),
                            FPaymentSummaryRow(
                              description: "Delivery Fee",
                              value: 0,
                            ),
                            SizedBox(height: FSize.defaultSpace),

                            Divider(
                              height: 0.5,
                              endIndent: 5.0,
                              color: Colors.grey.withValues(alpha: 0.2),
                            ),

                            SizedBox(height: FSize.defaultSpace),

                            FPaymentSummaryRow(
                              description: "Total",
                              value: provider.totalPrice(),
                            ),
                          ],
                        ),
                      ),
                    ),

                  if (provider.cartItems.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Align(
                        alignment: Alignment.center,
                        child: FTextButton(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          buttonText: "Order Now",
                          onPressed: () async {
                            final success = await provider.pay();
                            if (success && context.mounted) {
                              showModalBottomSheet(
                                context: context,
                                builder:
                                    (context) => FPopUpBottomSheetContainer(
                                      buttonText: "Go to menu screen",
                                      message: "Order Successful!",
                                      description:
                                          "Your order is placed and will arrive shortly.",
                                      onPressed: () {
                                        navProvider.changeIndex(1);
                                        Navigator.of(context).pop();
                                      },
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
          ),
    );
  }
}

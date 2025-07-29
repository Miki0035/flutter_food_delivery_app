import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_button_container.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:food_delivery_app/features/search/providers/search_provider.dart';
import 'package:food_delivery_app/features/search/screens/widgets/calories_protein_column.dart';
import 'package:food_delivery_app/features/search/screens/widgets/description_text.dart';
import 'package:food_delivery_app/features/search/screens/widgets/row_with_icon_and_text.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class FDetailScreen extends StatelessWidget {
  const FDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FSearchProvider>(
      builder: (context, provider, child) {
        final item = provider.selectedItem;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              FSliverAppBar(
                showBackButton: true,
                actions: [FImageAsIconButton(image: FImage.search)],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(FSize.defaultSpace),
                  child: Column(
                    children: [
                      // UPPER SECTION
                      Row(
                        children: [
                          // MENU ITEM DETAIL
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // TITLE
                                Text(
                                  item!.name,

                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: FSize.fontSizeLg * 1.5,
                                  ),
                                ),
                                // CATEGORY
                                Text(
                                  item.category.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: FSize.fontSizeLg * 1.1,
                                  ),
                                ),

                                SizedBox(height: FSize.defaultSpace),

                                // RATING
                                Row(
                                  children: [
                                    StarRating(
                                      rating: item.rating,
                                      color: FColor.orange,
                                    ),
                                    SizedBox(width: 4.0),
                                    Text(
                                      "${item.rating}/5",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: FSize.fontSizeLg,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: FSize.defaultSpace * 2),

                                //PRICE
                                Row(
                                  children: [
                                    Text(
                                      "\$",
                                      style: TextStyle(
                                        color: FColor.orange,
                                        fontSize: FSize.fontSizeLg * 1.5,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      "${item.price}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: FSize.fontSizeLg * 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: FSize.defaultSpace * 2),

                                //CATORIES & PROTEIN
                                Row(
                                  children: [
                                    FCalorieProteinColumn(
                                      title: "Calories",
                                      value: item.calories,
                                      measurement: "Cal",
                                    ),
                                    SizedBox(width: 12.0),
                                    FCalorieProteinColumn(
                                      title: "Protein",
                                      value: item.protein,
                                      measurement: "g",
                                    ),
                                  ],
                                ),

                                SizedBox(height: FSize.normalSpace),
                              ],
                            ),
                          ),

                          // IMAGE COLUMN
                          Expanded(
                            flex: 2,
                            child: Hero(
                              tag: item.name,
                              child: Image.network(
                                item.imageUrl,
                                fit: BoxFit.contain,
                                loadingBuilder: (
                                  context,
                                  widget,
                                  loadingProgress,
                                ) {
                                  if (loadingProgress == null) {
                                    return widget;
                                  }
                                  return CircularProgressIndicator(
                                    color: FColor.orange,

                                    constraints: BoxConstraints(
                                      minWidth: 100.0,
                                      minHeight: 100.0,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: FSize.defaultSpace),
                      Container(
                        padding: EdgeInsets.all(FSize.normalSpace),
                        margin: EdgeInsets.symmetric(
                          horizontal: FSize.normalSpace,
                        ),
                        decoration: BoxDecoration(
                          color: FColor.orange.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FIconWithTextRow(
                              image: FImage.dollar,
                              text: "Free Delivery",
                            ),
                            FIconWithTextRow(
                              image: FImage.clock,
                              text: "20-30 mins",
                            ),
                            FIconWithTextRow(
                              image: FImage.star,
                              text: "${item.rating}",
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: FSize.defaultSpace),
                      // DESCRIPTION
                      FDescriptionText(
                        description:
                            "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. "
                            "Made with a juicy beef patty cooked to perfection, "
                            "it's topped with melted American cheese, crispy lettuce, tomato, & crunchy pickles.",
                      ),

                      SizedBox(height: FSize.defaultSpace),

                      // TOPPING SECTION
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Toppings",
                          style: TextStyle(
                            fontSize: FSize.fontSizeLg * 1.1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      SizedBox(height: FSize.defaultSpace),

                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.16,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder:
                              (context, index) =>
                                  SizedBox(width: FSize.defaultSpace * 1.5),
                          itemCount: provider.toppings.length,
                          itemBuilder: (context, index) {
                            final custom = provider.toppings[index];
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 0.35,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.4),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.35,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                        vertical: FSize.normalSpace,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              custom.name,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: FSize.fontSizeMd,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),

                                            FImageButtonContainer(
                                              size: 30.0,
                                              imageSize: 20.0,

                                              imageColor: Colors.white,
                                              backgroundColor: Colors.red,
                                              image: FImage.plus,
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -1,
                                    child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.35,
                                      padding: EdgeInsets.all(
                                        FSize.normalSpace,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,

                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Image.asset(
                                        custom.image,
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: FSize.defaultSpace * 2),

                      // OPTIONS SECTION
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Side options",
                          style: TextStyle(
                            fontSize: FSize.fontSizeLg * 1.1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      SizedBox(height: FSize.defaultSpace),

                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.14,
                        margin: EdgeInsets.symmetric(
                          vertical: FSize.defaultSpace,
                        ),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder:
                              (context, index) =>
                                  SizedBox(width: FSize.defaultSpace * 1.5),
                          itemCount: provider.options.length,
                          itemBuilder: (context, index) {
                            final custom = provider.options[index];
                            return Container(
                              width: MediaQuery.sizeOf(context).width * 0.28,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.4),
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.28,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                        vertical: FSize.normalSpace,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              custom.name,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: FSize.fontSizeMd,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),

                                            FImageButtonContainer(
                                              size: 30.0,
                                              imageSize: 20.0,
                                              imageColor: Colors.white,
                                              backgroundColor: Colors.red,
                                              image: FImage.plus,
                                              onTap: () {},
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 0,
                                    child: Container(
                                      width:
                                          MediaQuery.sizeOf(context).width *
                                          0.28,
                                      padding: EdgeInsets.all(
                                        FSize.normalSpace,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,

                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(20.0),
                                          bottomLeft: Radius.circular(20.0),
                                        ),
                                      ),
                                      child: Image.asset(
                                        custom.image,
                                        width: 60.0,
                                        height: 60.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      // LAST SECTION CONTAINER
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: FSize.defaultSpace * 4,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: FSize.defaultSpace * 1.5,
                          vertical: FSize.defaultSpace,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Consumer<FCartProvider>(
                          builder:
                              (context, provider, child) => Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  FPlusMinuTextRow(
                                    plusTap: provider.increase,
                                    minusTap: provider.decrease,
                                    text: "${provider.quantity}",
                                  ),

                                  // ADD TO CART BUTTON
                                  GestureDetector(
                                    onTap:
                                        () => provider.addItemToCart(
                                          item,
                                          provider.quantity,
                                        ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: FSize.normalSpace,
                                        horizontal: FSize.defaultSpace,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FColor.orange,
                                        borderRadius: BorderRadius.circular(
                                          50.0,
                                        ),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          final success = provider
                                              .addItemToCart(
                                                item,
                                                provider.quantity,
                                              );
                                          if (success && context.mounted) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
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
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              FImage.bag,
                                              width: FSize.iconSm,
                                              height: FSize.iconSm,
                                              fit: BoxFit.contain,
                                            ),
                                            SizedBox(width: FSize.normalSpace),
                                            Text(
                                              "Add to cart (\$${(item.price * provider.quantity).toStringAsFixed(0)})",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: FSize.fontSizeLg,
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
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FPlusMinuTextRow extends StatelessWidget {
  final VoidCallback minusTap;
  final VoidCallback plusTap;
  final String text;

  const FPlusMinuTextRow({
    super.key,
    required this.minusTap,
    required this.plusTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FImageButtonContainer(
          image: FImage.minus,
          size: 40.0,
          imageSize: 20.0,
          backgroundColor: FColor.orange.withValues(alpha: 0.1),
          imageColor: FColor.orange,
          onTap: minusTap,
        ),
        SizedBox(width: FSize.normalSpace),
        Text(
          text,
          softWrap: true,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: FSize.fontSizeLg,
          ),
        ),
        SizedBox(width: FSize.normalSpace),

        FImageButtonContainer(
          image: FImage.plus,
          size: 40.0,
          imageSize: 20.0,

          backgroundColor: FColor.orange.withValues(alpha: 0.1),
          imageColor: FColor.orange,
          onTap: plusTap,
        ),
      ],
    );
  }
}

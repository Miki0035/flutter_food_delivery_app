import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/image_as_icon_container.dart';
import 'package:food_delivery_app/features/search/providers/search_provider.dart';
import 'package:food_delivery_app/features/search/screens/widgets/calories_protein_column.dart';
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
                  child: Row(
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
                                  value: item.protien,
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
                            loadingBuilder: (context, widget, loadingProgress) {
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

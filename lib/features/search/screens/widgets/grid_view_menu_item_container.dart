import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/image_as_icon_container.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class FGridViewItemContainer extends StatelessWidget {
  final String name;
  final String image;
  final double price;
  final String index;
  final VoidCallback? onTap;
  final VoidCallback? addToCart;

  const FGridViewItemContainer({
    super.key,
    required this.name,
    required this.price,
    this.onTap,
    required this.index,
    required this.image,
    this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final containerWidth = constraints.maxWidth;
            return Stack(
              clipBehavior: Clip.none,

              children: [
                Positioned(
                  top: -50,
                  left: (containerWidth / 2) - (100.0 / 2),
                  child: Hero(
                    tag: index,
                    child: Image.network(
                      image,
                      width: 100.0,
                      height: 100.0,
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
                SizedBox(height: FSize.normalSpace),

                Positioned.fill(
                  bottom: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: FSize.fontSizeLg,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "From \$$price",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: FSize.fontSizeMd,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: addToCart,
                        style: TextButton.styleFrom(
                          overlayColor: FColor.orange.withValues(alpha: 0.5),
                          splashFactory: InkRipple.splashFactory,
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
            );
          },
        ),
      ),
    );
  }
}

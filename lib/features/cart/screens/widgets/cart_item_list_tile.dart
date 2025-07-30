import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/row_with_plus_minus_button_and_text.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/image_as_icon_container.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FCartListTileContainer extends StatelessWidget {
  final VoidCallback plusTap;
  final VoidCallback minusTap;
  final VoidCallback onDelete;

  final String image;
  final String name;
  final String price;
  final String quantity;

  const FCartListTileContainer({
    super.key,
    required this.plusTap,
    required this.minusTap,
    required this.onDelete,
    required this.image,
    required this.price,
    required this.quantity,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: FSize.normalSpace),
      padding: EdgeInsets.symmetric(horizontal: FSize.normalSpace),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,

        children: [
          // CHECKBOX
          Align(
            alignment: Alignment.center,
            child: CheckboxMenuButton(
              value: true,
              onChanged: (value) {},
              child: null,
            ),
          ),

          // ITEM IMAGE
          FImageAsIconContainer(
            image: image,
            isNetworkImage: true,
            imageSize: 90.0,
            containerSize: 90.0,
            borderRadius: 12.0,
          ),

          // ITEM DESCRIPTION
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: FSize.defaultSpace,
                bottom: FSize.normalSpace,
                top: FSize.normalSpace,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: FSize.fontSizeLg,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "\$$price",
                      style: TextStyle(
                        color: FColor.orange,
                        fontWeight: FontWeight.w700,
                        fontSize: FSize.fontSizeLg,
                      ),
                    ),
                  ),
                  SizedBox(height: FSize.normalSpace),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // PLUS _MINUS ROW
                      FPlusMinuTextRow(
                        minusTap: minusTap,
                        plusTap: plusTap,
                        text: quantity,
                      ),

                      //DELETE ICON
                      FImageAsIconButton(
                        image: FImage.trash,
                        iconColor: Colors.red,
                        onPressed: onDelete,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

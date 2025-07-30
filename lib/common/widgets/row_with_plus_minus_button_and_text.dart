import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_button_container.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

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

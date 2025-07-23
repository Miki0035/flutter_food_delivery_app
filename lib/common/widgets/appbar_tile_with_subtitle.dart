import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FAppBarTitleWithSubtitle extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool showDownArrow;

  const FAppBarTitleWithSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
    this.showDownArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: FSize.fontSizeSm,
            color: FColor.orange,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 4.0),
        Row(
          children: [
            Text(
              subtitle,
              style: TextStyle(
                fontSize: FSize.fontSizeLg,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(width: 4.0),
            if (showDownArrow)
              Image.asset(
                FImage.arrowDown,
                fit: BoxFit.contain,
                color: Colors.black,
                width: FSize.iconXs,
                height: FSize.iconXs,
              ),
          ],
        ),
      ],
    );
  }
}

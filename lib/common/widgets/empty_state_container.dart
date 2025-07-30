import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FEmptyStateContainer extends StatelessWidget {
  final String message;
  final String description;

  const FEmptyStateContainer({
    super.key,
    required this.message,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          FImage.emptyState,
          width: 250.0,
          height: 250.0,
          fit: BoxFit.contain,
        ),
        Text(
          message,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: FSize.fontSizeLg,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: FSize.fontSizeMd,
          ),
        ),
      ],
    );
  }
}

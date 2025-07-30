import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FPaymentSummaryRow extends StatelessWidget {
  final String description;
  final double value;

  const FPaymentSummaryRow({
    super.key,
    required this.description,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: FSize.fontSizeLg,
          ),
        ),
        Text(
          value == 0 ? " Free" : "\$${value.toStringAsFixed(2)}",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: FSize.fontSizeLg,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;

  const FTextButton({super.key, this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: FColor.orange,
          padding: EdgeInsets.symmetric(vertical: FSize.normalSpace),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: FSize.fontSizeLg,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

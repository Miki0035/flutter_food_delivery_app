import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/buttons/text_button.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';


class FPopUpBottomSheetContainer extends StatelessWidget {
  final VoidCallback? onPressed;
  final String message;
  final String description;
  final String buttonText;

  const FPopUpBottomSheetContainer({
    super.key,
    this.onPressed,
    required this.message,
    required this.description,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            FImage.success,
            width: 200.0,
            height: 200.0,
            fit: BoxFit.contain,
          ),
          Text(
            message,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: FSize.fontSizeLg * 1.5,
            ),
          ),
          SizedBox(height: FSize.normalSpace),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: FSize.fontSizeLg,
            ),
          ),
          SizedBox(height: FSize.defaultSpace),
          FTextButton(
            onPressed: onPressed,
            buttonText: buttonText,
            width: MediaQuery.sizeOf(context).width * 0.8,
          ),
        ],
      ),
    );
  }
}

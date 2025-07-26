import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FSearchBar extends StatelessWidget {
  final TextEditingController controller;

  const FSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      controller: controller,
      backgroundColor: WidgetStatePropertyAll(Colors.white),
      shadowColor: WidgetStatePropertyAll(Colors.grey),

      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
      hintText: "Search for any food",
      hintStyle: WidgetStatePropertyAll(
        TextStyle(fontWeight: FontWeight.w500, fontSize: FSize.fontSizeLg),
      ),
      trailing: [FImageAsIconButton(image: FImage.search)],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_provider.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<FBottomNavBarProvider>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          FSliverAppBar(
            leading: FImageAsIconButton(
              image: FImage.arrowBack,
              onPressed: () => navProvider.back(),
            ),
            title: Text(
              'Cart',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: FSize.fontSizeLg,
              ),
            ),
            centerTitle: true,
            actions: [FImageAsIconButton(image: FImage.search)],
          ),
        ],
      ),
    );
  }
}

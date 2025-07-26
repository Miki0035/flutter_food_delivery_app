import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/buttons/bottom_navigation_bar_button.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_provider.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';

class FBottomNavBar extends StatelessWidget {
  const FBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FBottomNavBarProvider>(
        builder:
            (context, navProvider, _) => Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: kBottomNavigationBarHeight * 1.5,
                  ),
                  child: navProvider.screens[navProvider.currentIndex],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 70,
                    margin: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: MediaQuery.of(context).padding.bottom * 1.2,
                  ),
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(20),
                          blurRadius: 20,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children:
                          navProvider.navButtons.indexed.map((nav) {
                            return FBottomNavigationBarButton(
                              onTap: () => navProvider.changeIndex(nav.$1),
                              image: nav.$2.icon,
                              label: nav.$2.label,
                              textColor:
                                  navProvider.currentIndex == nav.$1
                                      ? FColor.orange
                                      : Colors.black,
                              iconColor:
                                  navProvider.currentIndex == nav.$1
                                      ? FColor.orange
                                      : Colors.black,
                            );
                          }).toList(),
                    ),
                  ),
                ),
              ],
            ),
      ),
      // bottomNavigationBar: Consumer<FBottomNavBarProvider>(
      //     builder:
      //         (context, navProvider, _) =>
      // ),
    );
  }
}

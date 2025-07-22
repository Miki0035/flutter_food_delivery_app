import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/bottom_navigation_bar_button.dart';
import 'package:food_delivery_app/features/cart/screens/cart_screen.dart';
import 'package:food_delivery_app/features/home/screens/home.dart';
import 'package:food_delivery_app/features/profile/screens/profile_screen.dart';
import 'package:food_delivery_app/features/search/screens/search_screen.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:provider/provider.dart';

class FBottomNavBar extends StatelessWidget {
  const FBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FBottomNavBarProvider(),
      child: Scaffold(
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
      ),
    );
  }
}

class FBottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  final List<NavButton> navButtons = [
    NavButton(label: "Home", icon: FImage.home),
    NavButton(label: "Search", icon: FImage.search),
    NavButton(label: "Cart", icon: FImage.bag),
    NavButton(label: "Profile", icon: FImage.person),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

class NavButton {
  final String label;
  final String icon;

  NavButton({required this.label, required this.icon});
}

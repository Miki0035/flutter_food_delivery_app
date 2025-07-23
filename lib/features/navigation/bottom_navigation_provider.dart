import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/screens/cart_screen.dart';
import 'package:food_delivery_app/features/home/screens/home.dart';
import 'package:food_delivery_app/features/profile/screens/profile_screen.dart';
import 'package:food_delivery_app/features/search/screens/search_screen.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';

class FBottomNavBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  int previousIndex = 0;
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
    if (currentIndex != index) {
      previousIndex = currentIndex;
      currentIndex = index;
      notifyListeners();
    }
  }

  void back() {
    currentIndex = previousIndex;
    notifyListeners();
  }
}

class NavButton {
  final String label;
  final String icon;

  NavButton({required this.label, required this.icon});
}

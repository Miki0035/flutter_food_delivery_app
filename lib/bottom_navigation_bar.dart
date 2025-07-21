import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/screens/cart_screen.dart';
import 'package:food_delivery_app/features/home/screens/home.dart';
import 'package:food_delivery_app/features/profile/screens/profile_screen.dart';
import 'package:food_delivery_app/features/search/screens/search_screen.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/common/widgets/stacked_container_with_notification_count.dart';

class FBottomNavBar extends StatelessWidget {
  const FBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FBottomNavBarProvider(),
      child: Scaffold(
        body: Consumer<FBottomNavBarProvider>(
          builder:
              (context, navProvider, _) =>
                  navProvider.screens[navProvider.currentIndex],
        ),
        bottomNavigationBar: Consumer<FBottomNavBarProvider>(
          builder:
              (context, navProvider, _) => Container(
                margin: EdgeInsets.all(FSize.defaultSpace),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: NavigationBar(
                  height: 70,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedIndex: navProvider.currentIndex,
                  onDestinationSelected:
                      (value) => navProvider.changeIndex(value),
                  destinations: [
                    NavigationDestination(
                      icon: FStackedContainerWithNotificationCount(
                        notificationCount: 2,
                      ),
                      label: "Home",
                    ),
                    NavigationDestination(
                      icon: FStackedContainerWithNotificationCount(
                        notificationCount: 2,
                      ),
                      label: "Search",
                    ),
                    NavigationDestination(
                      icon: Image.asset(FImage.bag),
                      label: "Cart",
                    ),
                    NavigationDestination(
                      icon: Image.asset(FImage.person),
                      label: "Profile",
                    ),
                  ],
                ),
              ),
        ),
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

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

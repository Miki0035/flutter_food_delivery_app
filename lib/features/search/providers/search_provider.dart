import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/models/seach_menu_category_model.dart';

class FSearchProvider extends ChangeNotifier {
  final controller = TextEditingController();
  int selectedIndex = 0;

  final List<FSearchMenuCategory> categories = [
    FSearchMenuCategory(name: "All", description: ""),
    FSearchMenuCategory(name: "Burgers", description: "Juciy grilled burgers"),
    FSearchMenuCategory(
      name: "Pizzas",
      description: "Oven-baked cheesy pizzas",
    ),
    FSearchMenuCategory(
      name: "Burritos",
      description: "Rolled Mexican delights",
    ),
    FSearchMenuCategory(
      name: "Sandwiches",
      description: "Stacked and stuffed sandwiches",
    ),
    FSearchMenuCategory(
      name: "Wraps",
      description: "Rolled up wraps packed with flavor",
    ),
    FSearchMenuCategory(
      name: "Bowls",
      description: "Balanced rice and protein bowls",
    ),
  ];


  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}

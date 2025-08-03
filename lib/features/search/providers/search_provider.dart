import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/models/menu_item_model.dart';
import 'package:food_delivery_app/common/data/models/seach_menu_category_model.dart';
import 'package:food_delivery_app/common/data/models/topping_option_model.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';

class FSearchProvider extends ChangeNotifier {
  final query = TextEditingController();
  late final List<FMenuItem> menus;
  int selectedCategory = 0;
  String _searchText = "";
  FMenuItem? selectedItem;

  Timer? _debounce;

  List<FMenuItem> filteredMenus = [];

  //TOPPINGS
  final List<FToppingOptionModel> toppings = [
    FToppingOptionModel(
      image: FImage.tomatoes,
      name: "Tomato",
      type: CustomizationType.topping,
    ),
    FToppingOptionModel(
      image: FImage.onionRings,
      name: "Onions",
      type: CustomizationType.topping,
    ),
    FToppingOptionModel(
      image: FImage.cheese,
      name: "Cheese",
      type: CustomizationType.topping,
    ),
    FToppingOptionModel(
      image: FImage.bacon,
      name: "Bacon",
      type: CustomizationType.topping,
    ),
    FToppingOptionModel(
      image: FImage.pickles,
      name: "Pickle",
      type: CustomizationType.topping,
    ),
    FToppingOptionModel(
      image: FImage.mushrooms,
      name: "Mushroom",
      type: CustomizationType.topping,
    ),
    FToppingOptionModel(
      image: FImage.avocado,
      name: "Avocado",
      type: CustomizationType.topping,
    ),
  ];

  final List<FToppingOptionModel> options = [
    //OPTIONS
    FToppingOptionModel(
      image: FImage.fries,
      name: "Fries",
      type: CustomizationType.option,
    ),
    FToppingOptionModel(
      image: FImage.coleslaw,
      name: "Coleslaw",
      type: CustomizationType.option,
    ),
    FToppingOptionModel(
      image: FImage.salad,
      name: "Salad",
      type: CustomizationType.option,
    ),
    FToppingOptionModel(
      image: FImage.pringles,
      name: "Pringles",
      type: CustomizationType.option,
    ),
    FToppingOptionModel(
      image: FImage.mozz,
      name: "Mozz",
      type: CustomizationType.option,
    ),
  ];

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

  FSearchProvider() {
    query.addListener(_onSearchChanged);
    menus = [
      FMenuItem(
        name: "Classic Cheeseburger",
        description:
            "A timeless favorite, the Classic Cheeseburger brings together a juicy beef patty, "
            "melty cheese, crisp lettuce, and fresh tomato—crafted for that perfect bite every time.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/044/844/600/large_2x/homemade-fresh-tasty-burger-with-meat-and-cheese-classic-cheese-burger-and-vegetable-ai-generated-free-png.png",
        price: 25.99,
        rating: 4.5,
        calories: 550,
        protein: 25,
        category: getCategoryByName("Burgers"),
        customizations: ["Extra Cheese", "Coke", "Fries", "Onions", "Bacon"],
      ),
      FMenuItem(
        name: "Pepperoni Pizza",
        description:
            "Crave-worthy and cheesy, this Pepperoni Pizza is loaded with gooey mozzarella and generous slices of pepperoni "
            "for a bold, savory flavor that never disappoints.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/023/742/417/large_2x/pepperoni-pizza-isolated-illustration-ai-generative-free-png.png",
        price: 30.99,
        rating: 4.7,
        calories: 700,
        protein: 30,
        category: getCategoryByName("Pizzas"),
        customizations: [
          "Extra Cheese",
          "Jalapeños",
          "Garlic Bread",
          "Coke",
          "Olives",
        ],
      ),
      FMenuItem(
        name: "Bean Burrito",
        description:
            "The Bean Burrito is a hearty handheld stuffed with flavorful beans, fluffy rice, and zesty "
            "salsa—wrapped to perfection for a satisfying bite.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/055/133/581/large_2x/deliciously-grilled-burritos-filled-with-beans-corn-and-fresh-vegetables-served-with-lime-wedge-and-cilantro-isolated-on-transparent-background-free-png.png",
        price: 20.99,
        rating: 4.2,
        calories: 480,
        protein: 18,
        category: getCategoryByName("Burritos"),
        customizations: ["Jalapeños", "Iced Tea", "Fries", "Salad"],
      ),
      FMenuItem(
        name: "BBQ Bacon Burger",
        description:
            "Sink your teeth into smoky bliss with the BBQ Bacon Burger—featuring crispy bacon, tangy BBQ sauce, and sharp "
            "cheddar layered over a juicy beef pattyr",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/060/236/245/large_2x/a-large-hamburger-with-cheese-onions-and-lettuce-free-png.png",
        price: 27.5,
        rating: 4.8,
        calories: 650,
        protein: 29,
        category: getCategoryByName("Burgers"),
        customizations: ["Onions", "Fries", "Coke", "Bacon", "Avocado"],
      ),
      FMenuItem(
        name: "Chicken Caesar Wrap",
        description:
            "The Chicken Caesar Wrap is a light yet flavorful option—grilled chicken, crunchy lettuce, and "
            "creamy Caesar dressing rolled into a soft wrap for a fresh bite.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/048/930/603/large_2x/caesar-wrap-grilled-chicken-isolated-on-transparent-background-free-png.png",
        price: 21.5,
        rating: 4.4,
        calories: 490,
        protein: 28,
        category: getCategoryByName("Wraps"),
        customizations: ["Extra Cheese", "Coke", "Potato Wedges", "Tomatoes"],
      ),
      FMenuItem(
        name: "Grilled Veggie Sandwich",
        description:
            "Roasted to perfection, the Grilled Veggie Sandwich features vibrant vegetables,"
            " rich pesto, and melted cheese for a wholesome, satisfying experience.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/047/832/012/large_2x/grilled-sesame-seed-bread-veggie-sandwich-with-tomato-and-onion-free-png.png",
        price: 19.99,
        rating: 4.1,
        calories: 420,
        protein: 19,
        category: getCategoryByName("Sandwiches"),
        customizations: [
          "Mushrooms",
          "Olives",
          "Mozzarella Sticks",
          "Iced Tea",
        ],
      ),
      FMenuItem(
        name: "Double Patty Burger",
        description:
            "For serious appetites, the Double Patty Burger stacks two juicy beef patties with gooey cheese for a"
            " towering bite of bold, meaty flavor.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/060/359/627/large_2x/double-cheeseburger-with-lettuce-tomatoes-cheese-and-sesame-bun-free-png.png",
        price: 32.99,
        rating: 4.9,
        calories: 720,
        protein: 35,
        category: getCategoryByName("Burgers"),
        customizations: [
          "Extra Cheese",
          "Onions",
          "Fries",
          "Coke",
          "Chicken Nuggets",
        ],
      ),
      FMenuItem(
        name: "Paneer Tikka Wrap",
        description:
            "Bursting with bold spices, the Paneer Tikka Wrap is packed with grilled paneer, crisp veggies, "
            "and mint chutney—perfectly wrapped for on-the-go flavor.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/057/913/530/large_2x/delicious-wraps-a-tantalizing-array-of-wraps-filled-with-vibrant-vegetables-succulent-fillings-and-fresh-ingredients-artfully-arranged-for-a-mouthwatering-culinary-experience-free-png.png",
        price: 23.99,
        rating: 4.6,
        calories: 470,
        protein: 20,
        category: getCategoryByName("Wraps"),
        customizations: ["Jalapeños", "Tomatoes", "Salad", "Fries", "Iced Tea"],
      ),
      FMenuItem(
        name: "Mexican Burrito Bowl",
        description:
            "Dig into a vibrant mix of rice, beans, corn, guacamole, and salsa in our Mexican Burrito Bowl—every spoonful full of color and flavor.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/057/466/374/large_2x/healthy-quinoa-bowl-with-avocado-tomato-and-black-beans-ingredients-free-png.png",
        price: 26.49,
        rating: 4.7,
        calories: 610,
        protein: 24,
        category: getCategoryByName("Bowls"),
        customizations: ["Avocado", "Sweet Corn", "Salad", "Iced Tea"],
      ),
      FMenuItem(
        name: "Spicy Chicken Sandwich",
        description:
            "Turn up the heat with our Spicy Chicken Sandwich—crispy chicken layered with fiery sauce and tangy pickles for a bold, craveable crunch.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/051/814/008/large_2x/a-grilled-chicken-sandwich-with-lettuce-and-tomatoes-free-png.png",
        price: 24.99,
        rating: 4.3,
        calories: 540,
        protein: 26,
        category: getCategoryByName("Sandwiches"),
        customizations: [
          "Jalapeños",
          "Onions",
          "Fries",
          "Coke",
          "Choco Lava Cake",
        ],
      ),
      FMenuItem(
        name: "Classic Margherita Pizza",
        description:
            "Simple yet iconic, the Classic Margherita Pizza combines fresh tomatoes, creamy mozzarella, and fragrant basil on a crisp crust.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/058/700/845/large_2x/free-isolated-on-transparent-background-delicious-pizza-topped-with-fresh-tomatoes-basil-and-melted-cheese-perfect-for-food-free-png.png",
        price: 26.99,
        rating: 4.1,
        calories: 590,
        protein: 21,
        category: getCategoryByName("Pizzas"),
        customizations: ["Extra Cheese", "Olives", "Coke", "Garlic Bread"],
      ),
      FMenuItem(
        name: "Protein Power Bowl",
        description:
            "Fuel up with the Protein Power Bowl—grilled chicken, quinoa, and garden-fresh veggies come together in a clean, high-protein meal.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/056/106/379/large_2x/top-view-salad-with-chicken-avocado-tomatoes-and-lettuce-free-png.png",
        price: 29.99,
        rating: 4.8,
        calories: 580,
        protein: 38,
        category: getCategoryByName("Bowls"),
        customizations: ["Avocado", "Salad", "Sweet Corn", "Iced Tea"],
      ),
      FMenuItem(
        name: "Paneer Burrito",
        description:
            "Spiced just right, the Paneer Burrito features tender paneer, seasoned rice, beans, and masala for a vegetarian delight full of flavor.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/056/565/254/large_2x/burrito-with-cauliflower-and-vegetables-free-png.png",
        price: 24.99,
        rating: 4.2,
        calories: 510,
        protein: 22,
        category: getCategoryByName("Burritos"),
        customizations: ["Jalapeños", "Fries", "Garlic Bread", "Coke"],
      ),
      FMenuItem(
        name: "Chicken Club Sandwich",
        description:
            "Stacked high with grilled chicken, crisp lettuce, cheese, and ripe tomato, the Chicken Club Sandwich delivers layers of hearty satisfaction.",
        imageUrl:
            "https://static.vecteezy.com/system/resources/previews/060/364/135/large_2x/a-flavorful-club-sandwich-with-turkey-bacon-and-fresh-vegetables-sliced-and-isolated-on-a-transparent-background-free-png.png",
        price: 27.49,
        rating: 4.5,
        calories: 610,
        protein: 31,
        category: getCategoryByName("Sandwiches"),
        customizations: ["Bacon", "Tomatoes", "Mozzarella Sticks", "Iced Tea"],
      ),
    ];
    filteredMenus = menus;
  }

  void _onSearchChanged() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _searchText = query.text.trim().toLowerCase();
      changeCategory(selectedCategory);
    });
  }

  // FILTER WITH CATEGORY AND SEARCH QUERY
  void changeCategory(int index) {
    selectedCategory = index;
    filteredMenus =
        menus.where((menu) {
          final filteredBySearch = menu.name.trim().toLowerCase().contains(
            _searchText,
          );

          final filteredByCategories =
              categories[selectedCategory].name.toLowerCase() == "all" ||
              menu.category.name == categories[selectedCategory].name;
          return filteredByCategories && filteredBySearch;
        }).toList();
    notifyListeners();
  }

  //returns Category object to menu
  FSearchMenuCategory getCategoryByName(String name) {
    return categories.firstWhere((category) => category.name == name);
  }

  void setSelectedItem(int index) {
    selectedItem = filteredMenus[index];
    notifyListeners();
  }

  // sets customization for item
  void addCustomizationForItem(FMenuItem item, String customizationName) {
    item.customizations.add(customizationName);
    notifyListeners();
  }

  // sets customization for item
  void removeCustomizationFromItem(FMenuItem item, String customizationName) {
    item.customizations.remove(customizationName);
    notifyListeners();
  }

  @override
  void dispose() {
    query.removeListener(_onSearchChanged);
    _debounce?.cancel();
    query.dispose();
    super.dispose();
  }
}

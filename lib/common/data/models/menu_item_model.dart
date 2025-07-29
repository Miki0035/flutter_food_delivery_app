import 'package:food_delivery_app/common/data/models/seach_menu_category_model.dart';

class FMenuItem {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final int calories;
  final int protein;
  final FSearchMenuCategory category;
  final List<String> customizations;

  FMenuItem({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.calories,
    required this.protein,
    required this.category,
    required this.customizations,
  });
}

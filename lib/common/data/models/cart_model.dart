import 'package:food_delivery_app/common/data/models/menu_item_model.dart';

class FCart {
  final FMenuItem item;
  int quantity;

  FCart({required this.item, required this.quantity});
}

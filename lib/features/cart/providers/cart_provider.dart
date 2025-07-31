import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/models/cart_model.dart';
import 'package:food_delivery_app/common/data/models/menu_item_model.dart';

class FCartProvider extends ChangeNotifier {
  List<FCart> cartItems = [];

  int quantity = 0;

  void increase() {
    if (quantity != 10) {
      ++quantity;
    }
    notifyListeners();
  }

  void decrease() {
    if (quantity != 0) {
      --quantity;
    }
    notifyListeners();
  }

  bool addItemToCart(FMenuItem item, int quantity) {
    cartItems.add(FCart(item: item, quantity: quantity));
    notifyListeners();
    return true;
  }

  bool removeItemFromCart(FCart item) {
    cartItems.remove(item);
    notifyListeners();
    return true;
  }

  void decreaseItemQuantityFromCart(FCart item) {
    if (item.quantity != 0) {
      item.quantity = item.quantity - 1;
    }
    notifyListeners();
  }

  void increaseItemQuantityFromCart(FCart item) {
    item.quantity = item.quantity + 1;
    notifyListeners();
  }

  double totalPrice() {
    final total = cartItems
        .map((cart) => cart.item.price * cart.quantity)
        .fold(0.0, (prev, element) => prev + element);
    return total;
  }

  void clearCartItems() {
    cartItems.clear();
    notifyListeners();
  }
}

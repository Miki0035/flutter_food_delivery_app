import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app/common/data/models/cart_model.dart';
import 'package:food_delivery_app/common/data/models/menu_item_model.dart';
import 'package:food_delivery_app/utilis/constants/stripe.dart';
import 'package:http/http.dart' as http;

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

  Future<bool> pay() async {
    try {
      // INTIZALIZAE AMOUNT & CURRENCY
      final paymentIntent = await createPayment();
      if (paymentIntent == null) return false;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntent!['client_secret'],
          style: ThemeMode.light,
          merchantDisplayName: 'Food Delivery',
        ),
      );

      // DSIPALY PAYMENT SHEET
      await displayPaymentSheet();

      // CLEAR CART ITEMS
      clearCartItems();
      return true;
    } catch (e) {
      print('Cart provider pay: $e');
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future<dynamic> createPayment() async {
    try {
      Map<String, dynamic> body = {
        'amount': (totalPrice() * 100).toStringAsFixed(0),
        'currency': 'USD',
      };

      // MAKE POST TO STRIPE
      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${StripeConfig.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (e) {
      print('Create Payment error: $e');
      return null;
    }
  }

  Future<void> displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      print('Error Stripe : $e');
    } catch (e) {
      print('display sheet error: $e');
    }
  }
}

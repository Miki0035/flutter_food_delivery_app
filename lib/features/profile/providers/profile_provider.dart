import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';

class FProfileProvider extends ChangeNotifier {
  final AuthRepository _auth;
  final DatabaseRepository _db;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();

  bool isLoading = false;

  FProfileProvider(this._auth, this._db) {
    init();
  }

  Future<void> init() async {
    final user = await _auth.getUser();
    if (user != null) {
      final doc = await _db.getUserDocument(user: user);
      if (doc != null) {
        fullNameController.text = doc.name;
        emailController.text = doc.email;
        phoneController.text = doc.phone ?? "";
        // address1Controller.text = user.address1 ?? "";
      }
    }
  }

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // edit profile
  void editProfile() {}

  //logout
  Future<bool> logout() async {
    setIsLoading(true);
    try {
      return await _auth.signOut();
    } catch (e) {
      rethrow;
    } finally {
      setIsLoading(false);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';

class LoginProvider extends ChangeNotifier {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool isLoading = false;

  void setObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final AuthRepository _auth;

  LoginProvider(this._auth);

  //implement login
  Future<bool> login() async {
    if (!loginFormKey.currentState!.validate()) {
      return false;
    }
    setIsLoading(true);
    try {
      final user = await _auth.login(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );
      if (user == null) {
        return false;
      }
      return true;
    } catch (e) {
      rethrow;
    } finally {
      setIsLoading(false);
      notifyListeners();
    }
  }
}

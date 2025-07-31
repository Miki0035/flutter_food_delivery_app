import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';

class SignUpProvider extends ChangeNotifier {
  final fullNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  final AuthRepository _auth;

  bool isLoading = false;
  bool obscureText = true;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void setObscureText() {
    obscureText = !obscureText;
    notifyListeners();
  }

  SignUpProvider(this._auth);

  //sign up
  Future<bool> signUp() async {
    if (!signUpFormKey.currentState!.validate()) {
      return false;
    }
    setIsLoading(true);
    try {

      final user = await _auth.createUser(
        fullName: fullNameTextController.text.trim(),
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

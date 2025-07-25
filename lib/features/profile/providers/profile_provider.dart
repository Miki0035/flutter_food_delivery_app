import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/models/profile_list_tile_model.dart';
import 'package:food_delivery_app/common/data/models/user_document.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';

class FProfileProvider extends ChangeNotifier {
  final AuthRepository _auth;
  final DatabaseRepository _db;

  final emailController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();

  FUserDocument userDoc = FUserDocument.empty();

  final List<FProfileListTileModel> profileListTile = [
    FProfileListTileModel(label: "Full Name", icon: FImage.user),
    FProfileListTileModel(label: "Email", icon: FImage.envelope),
    FProfileListTileModel(label: "Phone number", icon: FImage.phone),
    FProfileListTileModel(label: "Address 1 - (Home)", icon: FImage.location),
    FProfileListTileModel(label: "Address 2 - (Work)", icon: FImage.location),
  ];

  GlobalKey<FormState> profileEditForm = GlobalKey<FormState>();

  bool isLoading = false;

  FProfileProvider(this._auth, this._db) {
    init();
  }

  Future<void> init() async {
    try {
      final user = await _auth.getUser();
      if (user != null) {
        emailController.text = _db.dbUser.email;
        fullNameController.text = _db.dbUser.name;
        phoneController.text = _db.dbUser.phoneNumber ?? "";
        address1Controller.text = _db.dbUser.address1 ?? "";
        address2Controller.text = _db.dbUser.address2 ?? "";
      }
      print('ProfileProvider user : ${userDoc.address1}');
    } catch (e) {
      print('ProfileProvider e: $e');
      rethrow;
    } finally {
      notifyListeners();
    }
  }

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // edit profile
  Future<bool> editProfile() async {
    if (!profileEditForm.currentState!.validate()) {
      return false;
    }
    setIsLoading(true);
    try {
      final user = await _auth.getUser();
      if (user == null) {
        return false;
      }
      final result = await _db.updateUserDocument(
        user: user,
        name: fullNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        addressOne: address1Controller.text.trim(),
        addressTwo: address2Controller.text.trim(),
      );
      if (result == null) {
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

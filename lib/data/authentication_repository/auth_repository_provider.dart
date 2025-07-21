import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

class AuthRepository extends ChangeNotifier {
  final Account _account;

  AuthRepository(Client client) : _account = Account(client);

  //implement login
  Future<User?> login({required String email, required String password}) async {
    try {
      final session = await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      final user = await _account.get();
      return user;
    } catch (e) {
      print('AuthRepo error logging user: $e');
      return null;
    }
  }

  // create user
  Future<User?> createUser({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _account.create(
        userId: ID.unique(),
        email: email,
        name: fullName,
        password: password,
      );
      return user;
    } catch (e) {
      return null;
    }
  }

  // get current user
  Future<User?> getUser() async {
    try {
      return await _account.get();
    } catch (e) {
      print('Error getting user: $e');
      return null;
    } finally {
      notifyListeners();
    }
  }

  //implement logout
}

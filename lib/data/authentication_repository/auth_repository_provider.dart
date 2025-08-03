import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';
import 'package:food_delivery_app/data/storage_repository/storage_repository.dart';

class AuthRepository extends ChangeNotifier {
  late final Account _account;
  late final DatabaseRepository _db;

  // late final StorageRepository _storage;
  // late final Avatars _avatar;

  AuthRepository({
    required Client client,
    required DatabaseRepository databaseRepo,
    required StorageRepository storageRepo,
  }) : _account = Account(client),
       // _storage = storageRepo,
       _db = databaseRepo;

  // _avatar = Avatars(client);

  //implement login
  Future<User?> login({required String email, required String password}) async {
    try {
      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      final user = await getUser();
      if (user == null) {
        return null;
      }
      await _db.getUserDocument(user: user);
      return user;
    } catch (e) {
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

      // final fileBytes = await _avatar.getInitials(name: fullName);
      // final avatarUrl = await _storage.createFile(fileBytes, fullName);
      await _db.createUserDocument(
        name: fullName,
        email: email,
        accountId: user.$id,

        // avatar: avatarUrl.toString(),
      );

      await _account.createEmailPasswordSession(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  // get current user
  Future<User?> getUser() async {
    try {
      final user = await _account.get();
      return user;
    } on AppwriteException catch (e) {
      if (e.code == 401) {
        notifyListeners(); // Notify to clear state for other listeners
        return null;
      } else {
        // IMPORTANT: Re-throw the error so FutureBuilder catches it
        return null;
      }
    }
  }

  //implement logout
  Future<bool> signOut() async {
    try {
      await _account.deleteSession(sessionId: 'current');
      return true;
    } catch (e) {
      return false;
    }
  }
}

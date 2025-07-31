import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/models/user_document.dart';
import 'package:food_delivery_app/utilis/constants/appwrite.dart';

class DatabaseRepository extends ChangeNotifier {
  late final Databases _databases;
  Document? _doc;
  FUserDocument dbUser = FUserDocument.empty();

  FUserDocument? get userDoc => dbUser;

  DatabaseRepository(Client client) : _databases = Databases(client);

  Future<bool> createUserDocument({
    required String name,
    required String email,
    required String accountId,
  }) async {
    try {
      final newUser = FUserDocument(
        name: name,
        email: email,
        accountId: accountId,
      );
      final result = await _databases.createDocument(
        databaseId: AppWriteConfig.APPWRITE_DATABASE_ID,
        collectionId: AppWriteConfig.APPWRITE_USER_COLLECTION_ID,
        documentId: ID.unique(),
        data: newUser.toMap(),
      );
      _doc = result;
      dbUser = FUserDocument.fromMap(result.data);
      return true;
    } catch (e) {
      return false;
    } finally {
      notifyListeners();
    }
  }

  Future<Document?> updateUserDocument({
    required User user,
    required String name,
    required String email,
    required String phoneNumber,
    required String addressOne,
    required String addressTwo,
  }) async {
    try {
      final updatedUser = FUserDocument(
        name: name,
        email: email,
        accountId: user.$id,
        address1: addressOne,
        address2: addressTwo,
        phoneNumber: phoneNumber,
      );
      final updated = await _databases.updateDocument(
        databaseId: AppWriteConfig.APPWRITE_DATABASE_ID,
        collectionId: AppWriteConfig.APPWRITE_USER_COLLECTION_ID,
        documentId: _doc!.$id,
        data: updatedUser.toMap(),
      );
      dbUser = FUserDocument.fromMap(updated.data);

      return updated;
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }

  Future<Document?> getUserDocument({required User user}) async {
    try {
      final results = await _databases.listDocuments(
        databaseId: AppWriteConfig.APPWRITE_DATABASE_ID,
        collectionId: AppWriteConfig.APPWRITE_USER_COLLECTION_ID,
        queries: [Query.equal('accountId', user.$id)],
      );
      if (results.documents.isEmpty) {
        return null;
      }
      _doc = results.documents.first;
      dbUser = FUserDocument.fromMap(results.documents.first.data);
      return results.documents.first;
    } catch (e) {
      return null;
    } finally {
      notifyListeners();
    }
  }
}

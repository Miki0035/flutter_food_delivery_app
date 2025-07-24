import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/appwrite.dart';

class DatabaseRepository extends ChangeNotifier {
  late final Databases _databases;

  DatabaseRepository(Client client) : _databases = Databases(client);

  Future<bool> createUserDocument({
    required String name,
    required String email,
    required String accountId,
  }) async {
    try {
      final result = await _databases.createDocument(
        databaseId: AppWriteConfig.APPWRITE_DATABASE_ID,
        collectionId: AppWriteConfig.APPWRITE_USER_COLLECTION_ID,
        documentId: ID.unique(),
        data: {"name": name, "email": email, "accountId": accountId},
      );
      print('User created: $result');
      return true;
    } catch (e) {
      print('DatabaseRepo Error creating user document: $e');
      return false;
    }
  }

  Future<Document?> updateUserDocument({
    required User user,
    required String name,
    required String email,
    required String addressOne,
    required String addressTwo,
  }) async {
    try {
      final document = await getUserDocument(user: user);
      if (document == null) {
        return null;
      }
      final updated = await _databases.updateDocument(
        databaseId: AppWriteConfig.APPWRITE_DATABASE_ID,
        collectionId: AppWriteConfig.APPWRITE_USER_COLLECTION_ID,
        documentId: document.$id,
        data: {
          "name": name,
          "email": email,
          "address_1": addressOne,
          "address_2": addressTwo,
        },
      );
      return updated;
    } catch (e) {
      print('DatabaseRepo update document error: $e');
      return null;
    }
  }

  Future<Document?> getUserDocument({required User user}) async {
    try {
      final results = await _databases.listDocuments(
        databaseId: AppWriteConfig.APPWRITE_DATABASE_ID,
        collectionId: AppWriteConfig.APPWRITE_USER_COLLECTION_ID,
        queries: [Query.equal('account', user.$id)],
      );
      if (results.documents.isEmpty) {
        return null;
      }
      return results.documents.first;
    } catch (e) {
      print('DatabaseRepo get document error: $e');
      return null;
    }
  }
}

import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/constants/appwrite.dart';

class StorageRepository extends ChangeNotifier {
  late final Storage _storage;

  StorageRepository(Client client) : _storage = Storage(client);

  Future<Uint8List?> createFile(Uint8List fileBytes, String fileName) async {
    try {
      final file = await _storage.createFile(
        bucketId: AppWriteConfig.APPWRITE_BUCKET_ID,
        fileId: ID.unique(),
        file: InputFile.fromBytes(bytes: fileBytes, filename: fileName),
      );
      final avatarUrl = _storage.getFilePreview(
        bucketId: AppWriteConfig.APPWRITE_BUCKET_ID,
        fileId: file.$id,
      );
      return avatarUrl;
    } catch (e) {
      return null;
    }
  }
}

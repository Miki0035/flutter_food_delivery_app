import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/utilis/constants/appwrite.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  final client =
      Client()
        ..setProject(AppWriteConfig.APPWRITE_PROJECT_ID)
        ..setEndpoint(AppWriteConfig.APPWRITE_API_END_POINT)
        ..setSelfSigned();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthRepository>(
          create: (context) => AuthRepository(client),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

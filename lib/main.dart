import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';
import 'package:food_delivery_app/data/storage_repository/storage_repository.dart';
import 'package:food_delivery_app/features/cart/providers/cart_provider.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_provider.dart';
import 'package:food_delivery_app/features/search/providers/search_provider.dart';
import 'package:food_delivery_app/utilis/constants/appwrite.dart';
import 'package:food_delivery_app/utilis/constants/stripe.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // STRIPE CONFIG
  Stripe.publishableKey = StripeConfig.publishableKey;


  final client =
      Client()
        ..setProject(AppWriteConfig.APPWRITE_PROJECT_ID)
        ..setEndpoint(AppWriteConfig.APPWRITE_API_END_POINT)
        ..setSelfSigned();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DatabaseRepository>(
          create: (context) => DatabaseRepository(client),
        ),
        ChangeNotifierProvider<StorageRepository>(
          create: (context) => StorageRepository(client),
        ),
        ChangeNotifierProvider<AuthRepository>(
          create:
              (context) => AuthRepository(
                client: client,
                databaseRepo: context.read<DatabaseRepository>(),
                storageRepo: context.read<StorageRepository>(),
              ),
        ),
        ChangeNotifierProvider<FBottomNavBarProvider>(
          create: (context) => FBottomNavBarProvider(),
        ),
        ChangeNotifierProvider<FSearchProvider>(
          create: (context) => FSearchProvider(),
        ),
        ChangeNotifierProvider<FCartProvider>(
          create: (context) => FCartProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

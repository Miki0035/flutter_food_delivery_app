import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_bar.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/features/authentication/sign_up/screens/sign_up_screen.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/themes/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FAppTheme.lightThemeData,
      home: FutureBuilder<User?>(
        future: context.read<AuthRepository>().getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: const Center(
                child: CircularProgressIndicator(color: FColor.orange),
              ),
            );
          } else if (snapshot.hasError || snapshot.data == null) {
            return const SignUpScreen();
          } else {
            return const FBottomNavBar();
          }
        },
      ),
    );
  }
}

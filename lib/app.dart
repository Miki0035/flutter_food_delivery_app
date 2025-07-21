import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/bottom_navigation_bar.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/features/authentication/sign_up/screens/sign_up_screen.dart';
import 'package:food_delivery_app/features/home/screens/home.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/themes/theme.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthRepository>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FAppTheme.lightThemeData,
      home: const FBottomNavBar(),
      // FutureBuilder(
      //   future: auth.getUser(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Scaffold(
      //         body: Center(
      //           child: CircularProgressIndicator(color: FColor.orange),
      //         ),
      //       );
      //     } else if (snapshot.hasError) {
      //       print('FutureBuilder Error: ${snapshot.error}');
      //       return const SignUpScreen();
      //     } else {
      //       final User? user = snapshot.data;
      //       if (user != null) {
      //         print('Signed in user $user');
      //         return const FBottomNavBar();
      //       } else {
      //         return const SignUpScreen();
      //       }
      //     }
      //   },
      // ),
    );
  }
}

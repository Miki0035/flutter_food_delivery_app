import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/authentication/sign_up/screens/sign_up_screen.dart';
import 'package:food_delivery_app/features/home/screens/home.dart';
import 'package:food_delivery_app/utilis/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FAppTheme.lightThemeData,
      home: const SignUpScreen(),
    );
  }
}

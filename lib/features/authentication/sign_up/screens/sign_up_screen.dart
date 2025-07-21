import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/features/authentication/sign_up/providers/sign_up_provider.dart';
import 'package:food_delivery_app/features/authentication/sign_up/screens/widgets/sign_up_view.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(context.read<AuthRepository>()),
      child: SignUpView(),
    );
  }
}
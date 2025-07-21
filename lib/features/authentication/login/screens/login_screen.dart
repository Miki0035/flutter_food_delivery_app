import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/features/authentication/login/providers/login_provider.dart';
import 'package:food_delivery_app/features/authentication/login/screens/widgets/login_view.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(context.read<AuthRepository>()),
      child: LoginView(),
    );
  }
}

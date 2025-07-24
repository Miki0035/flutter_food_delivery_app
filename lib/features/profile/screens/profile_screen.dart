import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/authentication_repository/auth_repository_provider.dart';
import 'package:food_delivery_app/data/database_repository/database_repository.dart';
import 'package:food_delivery_app/features/profile/providers/profile_provider.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/profile_view.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) => FProfileProvider(
            context.read<AuthRepository>(),
            context.read<DatabaseRepository>(),
          ),
      child: ProfileView(),
    );
  }
}

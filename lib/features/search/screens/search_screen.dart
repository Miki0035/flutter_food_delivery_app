import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/search/providers/search_provider.dart';
import 'package:food_delivery_app/features/search/screens/widgets/search_view.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FSearchProvider(),
      child: FSearchView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recips_app/views/all_recipes_view.dart';
import 'package:recips_app/views/search_view.dart';
import 'package:recips_app/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.id: (context) => const SplashView(),
        AllRecipesView.id: (context) => const AllRecipesView(),
        SearchView.id: (context) => const SearchView(),
      },
      initialRoute: SplashView.id,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:recips_app/cubit/theme_cubit/theme_state.dart';
import 'package:recips_app/views/home_view.dart';
import 'package:recips_app/views/search_view.dart';

void main() {
  runApp(const YummyRecipesApp());
}

class YummyRecipesApp extends StatelessWidget {
  const YummyRecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..getTheme(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: state is ThemeChanged ? state.theme : ThemeMode.system,
            darkTheme: ThemeData.dark(),
            theme: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
            ),
            routes: {
              HomeView.id: (context) => const HomeView(),
              SearchView.id: (context) => const SearchView(),
            },
            initialRoute: HomeView.id,
          );
        },
      ),
    );
  }
}

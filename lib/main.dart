import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:recips_app/cubit/theme_cubit/theme_state.dart';
import 'package:recips_app/views/all_recipes_view.dart';
import 'package:recips_app/views/search_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            theme: ThemeData.light(),
            routes: {
              AllRecipesView.id: (context) => const AllRecipesView(),
              SearchView.id: (context) => const SearchView(),
            },
            initialRoute: AllRecipesView.id,
          );
        },
      ),
    );
  }
}

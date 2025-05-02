import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/constant.dart';
import 'package:recips_app/cubit/search_cubit.dart';
import 'package:recips_app/cubit/theme_cubit/theme_cubit.dart';
import 'package:recips_app/widgets/recommend_list_view.dart';
import 'package:recips_app/widgets/search_home_card.dart';
import 'package:recips_app/widgets/category_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'homeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: buildHomeAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SearchCard(),
                const Text(
                  'Categories',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                ),
                const CategoryListView(),
                const RecommendedListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildHomeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          Image.asset("assets/food-13646 1.png", width: 48),
          const SizedBox(width: 10),
          const Text(
            'Yummy ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
          ),
          const Text(
            'Recipes',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: kPrimaryColor,
            ),
          ),
          Spacer(),
          IconButton.filled(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                Colors.amber.withValues(alpha: 0.1),
              ),
            ),
            onPressed: () {
              context.read<ThemeCubit>().changeTheme(context);
            },
            icon: Icon(
              Theme.of(context).brightness == Brightness.light
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
              color: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/constant.dart';
import 'package:recips_app/cubit/search_cubit.dart';
import 'package:recips_app/widgets/recommend_list_view.dart';
import 'package:recips_app/widgets/search_home_card.dart';
import 'package:recips_app/widgets/category_list_view.dart';

class AllRecipesView extends StatelessWidget {
  const AllRecipesView({super.key});
  static String id = 'allRecipes';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/food-13646 1.png", width: 48),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Yummy ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22)),
                      const Text(
                        'Recipes',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                            color: kPrimaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SearchCard(),
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Color.fromARGB(255, 45, 45, 45),
                    ),
                  ),
                  const CategoryListView(),
                  const RecommendedListView(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recips_app/cubit/recipe_cubit.dart';
import 'package:recips_app/cubit/recipe_state.dart';
import 'package:recips_app/helper/get_recipe_data.dart';
import 'package:recips_app/views/recommended_view.dart';
import 'package:recips_app/widgets/recipe_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCubit()..getRecommendedRecipe(),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recommended',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      // color: Color.fromARGB(255, 45, 45, 45),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (state is RecipeLoaded) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    RecommendedView(recipes: state.recipes),
                          ),
                        );
                      }
                    },
                    child: Text(
                      "View all",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Color.fromARGB(228, 81, 81, 81),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              if (state is RecipeLoaded)
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 2, top: 10),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      state.recipes.length > 6 ? 6 : state.recipes.length,
                  itemBuilder:
                      (context, index) => Column(
                        children: [
                          RecipeCard(
                            recipe: state.recipes[index],
                            index: index,
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                )
              else if (state is RecipeError)
                const Center(child: Text("Error"))
              else
                Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(left: 2, top: 10),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: recipeDetails().length,
                    itemBuilder:
                        (context, index) => Column(
                          children: [
                            RecipeCard(
                              recipe: recipeDetails()[index],
                              index: index,
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

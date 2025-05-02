import 'package:flutter/material.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/widgets/recipe_card.dart';

class RecommendedView extends StatelessWidget {
  final List<Recipe> recipes;
  const RecommendedView({super.key, required this.recipes});

  static const String id = 'recommended_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Recommended",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 2, top: 20),
          physics: const BouncingScrollPhysics(),
          itemCount: recipes.length,
          itemBuilder:
              (context, index) => Column(
                children: [
                  RecipeCard(recipe: recipes[index], index: index),
                  const SizedBox(height: 40),
                ],
              ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recips_app/helper/custom_recipe_data.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/views/recipe_details_view.dart';
import 'package:recips_app/widgets/recipe_card.dart';

class RecipeListScreen extends StatelessWidget {
  final String category;

  const RecipeListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category Recipes')),
      body: FutureBuilder<List<Recipe>>(
        future: getRecipesByCategory(category.toLowerCase()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No recipes found for this category'),
            );
          }

          final recipes = snapshot.data!;

          return ListView.builder(
            padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 20.0),
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              RecipeDetailsView(recipe: recipes[index]),
                    ),
                  );
                },
                child: Column(
                  children: [
                    RecipeCard(recipe: recipes[index], index: index),
                    const SizedBox(height: 40),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

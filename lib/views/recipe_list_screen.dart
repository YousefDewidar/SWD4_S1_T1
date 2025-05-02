import 'package:flutter/material.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/views/recipe_details_view.dart'; 

class RecipeListScreen extends StatelessWidget {
  final String category;
  final Future<List<Recipe>> futureRecipes;

  const RecipeListScreen({required this.category, required this.futureRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$category Recipes')),
      body: FutureBuilder<List<Recipe>>(
        future: futureRecipes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No recipes found'));
          }

          final recipes = snapshot.data!
              .where((recipe) => recipe.mealType.contains(category))
              .toList();

          return ListView.builder(
            itemCount: recipes.length,
            itemBuilder: (context, index) {
              final recipe = recipes[index];
              return ListTile(
                leading: Image.network(
                  recipe.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                title: Text(recipe.name),
                subtitle: Text('Cuisine: ${recipe.cuisine}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeDetailsView(recipe: recipe),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
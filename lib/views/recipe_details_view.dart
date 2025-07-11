import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/views/cooking_mode_view.dart';
import 'package:recips_app/widgets/favorite_icon_button.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key, required this.recipe});
  static String id = 'recipeDetails';
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailsRecipeAppBar(recipe: recipe),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        recipe.name,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => CookingModeView(
                                  imageUrl: recipe.image,
                                  recipeName: recipe.name,
                                  steps: recipe.instructions as List<String>,
                                  cookTime: recipe.cookTimeMinutes.toString(),
                                  preparationTime: recipe.prepTimeMinutes.toString(),
                                ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                      ),
                      child: Text(
                        'Cooking Mode',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Meal Type: ${recipe.mealType.join(', ')}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.purpleAccent.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange),
                    Text("${recipe.rating} (${recipe.reviewCount} reviews)"),
                   SizedBox(width: MediaQuery.of(context).size.width * 0.54),
                    const FavoriteIconButton(),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    recipeInfo(
                      Icons.schedule,
                      "${recipe.cookTimeMinutes} min",
                      Colors.amberAccent,
                    ),
                    recipeInfo(
                      Icons.local_fire_department,
                      "${recipe.caloriesPerServing} cal",
                      Colors.greenAccent,
                    ),
                    recipeInfo(
                      Icons.restaurant,
                      recipe.difficulty,
                      Colors.purpleAccent.shade100,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              DetailsSubTitle(title: "Ingredients"),
              ...recipe.ingredients.map(
                (ingredient) => ListTile(
                  leading: Icon(Icons.circle, color: Colors.green, size: 15),
                  title: Text(
                    ingredient,
                    style: TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  dense: true,
                ),
              ),
              SizedBox(height: 20),
              DetailsSubTitle(title: "Instructions"),
              SizedBox(height: 8),
              ...List.generate(recipe.instructions.length, (index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    radius: 11,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  title: Text(
                    recipe.instructions[index],
                    style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  dense: true,
                );
              }),
              SizedBox(height: 16),
              DetailsSubTitle(title: "Tags"),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children:
                      recipe.tags.map((tag) {
                        return Chip(
                          label: Text(
                            tag,
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Colors.amber[100],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        );
                      }).toList(),
                ),
              ),
              SizedBox(height: 20),
            ]),
          ),
        ],
      ),
    );
  }

  Widget recipeInfo(IconData icon, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black),
          SizedBox(width: 4),
          Text(label, style: TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

class DetailsRecipeAppBar extends StatelessWidget {
  const DetailsRecipeAppBar({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 250.0,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Navigator.pop(context),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            const Color.fromARGB(84, 200, 200, 200),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final bool isCollapsed = constraints.maxHeight <= 100 + 20;
          return FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsetsDirectional.only(start: 65, bottom: 10),
            title:
                isCollapsed
                    ? Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            recipe.image,
                            maxWidth: 60,
                            maxHeight: 60,
                          ),
                          radius: 19,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            recipe.name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                    : null,
            background: Hero(
              tag: recipe.image,
              child: CachedNetworkImage(
                imageUrl: recipe.image,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) => Center(
                      child: const CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailsSubTitle extends StatelessWidget {
  final String title;
  const DetailsSubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      color:
          Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color.fromARGB(255, 67, 67, 67),
      width: double.infinity,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }
}

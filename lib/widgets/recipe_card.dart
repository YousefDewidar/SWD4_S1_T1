import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/views/recipe_details_view.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe, required this.index});
  final Recipe recipe;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return RecipeDetailsView(recipe: recipe);
              },
            ),
          ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 100,
              right: 12,
              top: 6,
              bottom: 6,
            ),
            width: double.infinity,
            clipBehavior: Clip.none,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    index % 2 != 0
                        ? const Color.fromARGB(128, 245, 122, 163)
                        : Colors.amberAccent,
              ),
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(500),
                right: Radius.circular(500),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      '${recipe.rating} (${recipe.reviewCount} reviews)',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  'Cook Time: ${recipe.cookTimeMinutes} minutes',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
          Positioned(
            width: 90,
            height: 94,
            left: -2,
            top: -7,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                  child: Container(
                    width: 45,
                    color:
                        index % 2 != 0
                            ? const Color.fromARGB(209, 245, 122, 163)
                            : Colors.amber,
                  ),
                ),
                Positioned(
                  left: 8,
                  top: 6,
                  child: CircleAvatar(
                    backgroundColor:
                        index % 2 != 0
                            ? const Color.fromARGB(255, 253, 217, 229)
                            : Colors.amberAccent,
                    radius: 40,
                    child: Hero(
                      tag: recipe.image,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: CachedNetworkImage(
                          imageUrl: recipe.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                          placeholder:
                              (context, url) => const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                          errorWidget:
                              (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:recips_app/models/recipe_model.dart';

class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

final Dio _dio = Dio();

Future<List<Category>> getCategories() async {
  final categories = [
    "breakfast",
    "lunch",
    "dinner",
    "snack",
    "dessert",
    "appetizer",
    "side dish",
  ];

  final categoryImages = {
    "breakfast": "breakfast_image.png",
    "lunch": "lunch_image.png",
    "dinner": "dinner_image.png",
    "snack": "snack_image.png",
    "dessert": "dessert_image.png",
    "appetizer": "appetizer_image.png",
    "side dish": "side_dish_image.png",
  };

  List<Category> categoryList =
      categories.map((category) {
        return Category(
          name: category,
          image:
              'assets/${categoryImages[category.toLowerCase()] ?? "default_category.png"}',
        );
      }).toList();

  return categoryList;
}

Future<List<Recipe>> getRecipesByCategory(String mealType) async {
  try {
    final response = await _dio.get(
      'https://dummyjson.com/recipes/meal-type/$mealType',
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = response.data;
      final List<dynamic> recipes = jsonData['recipes'];
      return recipes.map((json) => Recipe.fromJson(json)).toList();
    } else {
      throw Exception(
        'Failed to load recipes for $mealType: ${response.statusCode}',
      );
    }
  } catch (e) {
    throw Exception('Error fetching recipes: $e');
  }
}

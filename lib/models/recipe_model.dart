class Recipe {
  final num id;
  final String name;
  final List<dynamic> ingredients;
  final List<dynamic> instructions;
  final num prepTimeMinutes;
  final num cookTimeMinutes;
  final num servings;
  final String difficulty;
  final String cuisine;
  final num caloriesPerServing;
  final List<dynamic> tags;
  final num userId;
  final String image;
  final num rating;
  final num reviewCount;
  final List<dynamic> mealType;

  Recipe(
      {required this.id,
      required this.name,
      required this.ingredients,
      required this.instructions,
      required this.prepTimeMinutes,
      required this.cookTimeMinutes,
      required this.servings,
      required this.difficulty,
      required this.cuisine,
      required this.caloriesPerServing,
      required this.tags,
      required this.userId,
      required this.image,
      required this.rating,
      required this.reviewCount,
      required this.mealType});

  factory Recipe.fromJson(Map<String, dynamic> map) {
    return Recipe(
      id: map['id'] as num,
      name: map['name'] as String,
      ingredients: List<String>.from((map['ingredients'] as List<dynamic>)),
      instructions: List<String>.from((map['instructions'] as List<dynamic>)),
      prepTimeMinutes: map['prepTimeMinutes'] as num,
      cookTimeMinutes: map['cookTimeMinutes'] as num,
      servings: map['servings'] as num,
      difficulty: map['difficulty'] as String,
      cuisine: map['cuisine'] as String,
      caloriesPerServing: map['caloriesPerServing'] as num,
      tags: List<String>.from((map['tags'] as List<dynamic>)),
      userId: map['userId'] as num,
      image: map['image'] as String,
      rating: map['rating'] as num,
      reviewCount: map['reviewCount'] as num,
      mealType: List<String>.from((map['mealType'] as List<dynamic>)),
    );
  }
}

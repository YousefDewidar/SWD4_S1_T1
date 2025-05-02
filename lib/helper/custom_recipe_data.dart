import 'package:recips_app/models/recipe_model.dart';
class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});
}

List<Recipe> getAllRecipes() {
  return [
    Recipe(
      id: 1,
      name: "Classic Spaghetti Bolognese",
      ingredients: [
        "1 lb spaghetti",
        "1 lb ground beef",
        "1 onion, chopped",
        "2 cloves garlic, minced",
        "1 (28 oz) can crushed tomatoes",
        "1 tsp dried oregano",
        "1/2 tsp salt",
        "1/4 tsp black pepper",
        "2 tbsp olive oil",
      ],
      instructions: [
        "Cook spaghetti according to package directions.",
        "In a large skillet, brown ground beef over medium heat. Drain off any excess grease.",
        "Add onion and garlic to the skillet and cook until softened.",
        "Stir in crushed tomatoes, oregano, salt, and pepper. Bring to a simmer and cook for 15 minutes.",
        "Serve the sauce over spaghetti.",
      ],
      prepTimeMinutes: 15,
      cookTimeMinutes: 30,
      servings: 6,
      difficulty: "Easy",
      cuisine: "Italian",
      caloriesPerServing: 450,
      tags: ["pasta", "beef", "tomato sauce"],
      userId: 101,
      image: "https://cdn.dummyjson.com/recipe-images/1.webp",
      rating: 4.5,
      reviewCount: 120,
      mealType: ["dinner"],
    ),
    Recipe(
      id: 2,
      name: "Chicken Stir-Fry",
      ingredients: [
        "1 lb boneless, skinless chicken breasts, cut into bite-sized pieces",
        "1 bell pepper, sliced",
        "1 onion, sliced",
        "1 cup broccoli florets",
        "1/2 cup soy sauce",
        "1/4 cup honey",
        "2 tbsp cornstarch",
        "1 tbsp sesame oil",
      ],
      instructions: [
        "In a bowl, whisk together soy sauce, honey, and cornstarch.",
        "Heat sesame oil in a large skillet or wok over medium-high heat.",
        "Add chicken and cook until browned.",
        "Add bell pepper, onion, and broccoli to the skillet and cook until tender-crisp.",
        "Pour the sauce over the chicken and vegetables and cook until thickened.",
        "Serve over rice.",
      ],
      prepTimeMinutes: 20,
      cookTimeMinutes: 25,
      servings: 4,
      difficulty: "Medium",
      cuisine: "Asian",
      caloriesPerServing: 380,
      tags: ["chicken", "vegetables", "stir-fry"],
      userId: 102,
      image: "https://cdn.dummyjson.com/recipe-images/1.webp",
      rating: 4.2,
      reviewCount: 95,
      mealType: ["lunch", "dinner"],
    ),
    Recipe(
      id: 3,
      name: "Chocolate Chip Cookies",
      ingredients: [
        "2 1/4 cups all-purpose flour",
        "1 tsp baking soda",
        "1 tsp salt",
        "1 cup (2 sticks) unsigned butter, softened",
        "3/4 cup granulated sugar",
        "3/4 cup packed brown sugar",
        "1 tsp vanilla extract",
        "2 large eggs",
        "2 cups chocolate chips",
      ],
      instructions: [
        "Preheat oven to 375 degrees F (190 degrees C).",
        "In a small bowl, whisk together flour, baking soda, and salt.",
        "In a large bowl, cream together butter, granulated sugar, and brown sugar until smooth.",
        "Beat in vanilla extract and eggs until well combined.",
        "Gradually add the dry ingredients to the wet ingredients, mixing until just combined.",
        "Stir in chocolate chips.",
        "Drop by rounded tablespoons onto ungreased baking sheets.",
        "Bake for 9-11 minutes, or until golden brown.",
        "Let cool on baking sheets for a few minutes before transferring to a wire rack to cool completely.",
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 10,
      servings: 24,
      difficulty: "Easy",
      cuisine: "American",
      caloriesPerServing: 150,
      tags: ["dessert", "cookies", "chocolate"],
      userId: 103,
      image: "https://cdn.dummyjson.com/recipe-images/1.webp",
      rating: 4.8,
      reviewCount: 150,
      mealType: ["dessert", "snack"],
    ),
    Recipe(
      id: 4,
      name: "Pancakes",
      ingredients: [
        "1 cup all-purpose flour",
        "1 tbsp sugar",
        "2 tsp baking powder",
        "1/2 tsp salt",
        "1 cup milk",
        "1 egg",
        "2 tbsp melted butter",
      ],
      instructions: [
        "In a bowl, mix flour, sugar, baking powder, and salt.",
        "In another bowl, whisk milk, egg, and melted butter.",
        "Combine wet and dry ingredients until just mixed.",
        "Heat a non-stick pan over medium heat.",
        "Pour 1/4 cup of batter onto the pan for each pancake.",
        "Cook until bubbles form on the surface, then flip and cook until golden.",
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 4,
      difficulty: "Easy",
      cuisine: "American",
      caloriesPerServing: 200,
      tags: ["pancakes", "breakfast"],
      userId: 104,
      image: "https://cdn.dummyjson.com/recipe-images/1.webp",
      rating: 4.6,
      reviewCount: 80,
      mealType: ["breakfast"],
    ),
    Recipe(
      id: 5,
      name: "Bruschetta",
      ingredients: [
        "1 baguette, sliced",
        "4 tomatoes, diced",
        "2 cloves garlic, minced",
        "1/4 cup fresh basil, chopped",
        "2 tbsp olive oil",
        "1 tbsp balsamic vinegar",
        "Salt and pepper to taste",
      ],
      instructions: [
        "Preheat oven to 400°F (200°C).",
        "Place baguette slices on a baking sheet and brush with olive oil.",
        "Bake for 5-7 minutes until toasted.",
        "In a bowl, mix tomatoes, garlic, basil, olive oil, and balsamic vinegar.",
        "Season with salt and pepper.",
        "Spoon the mixture onto the toasted baguette slices.",
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 7,
      servings: 6,
      difficulty: "Easy",
      cuisine: "Italian",
      caloriesPerServing: 120,
      tags: ["appetizer", "italian"],
      userId: 105,
      image: "https://cdn.dummyjson.com/recipe-images/1.webp",
      rating: 4.3,
      reviewCount: 60,
      mealType: ["appetizer"],
    ),
    Recipe(
      id: 6,
      name: "Avocado Toast",
      ingredients: [
        "2 slices of bread",
        "1 avocado",
        "1 tbsp lemon juice",
        "Salt and pepper to taste",
        "1/2 tsp red pepper flakes (optional)",
      ],
      instructions: [
        "Toast the bread slices.",
        "Mash the avocado with lemon juice, salt, and pepper.",
        "Spread the avocado mixture on the toasted bread.",
        "Sprinkle with red pepper flakes if desired.",
      ],
      prepTimeMinutes: 5,
      cookTimeMinutes: 5,
      servings: 2,
      difficulty: "Easy",
      cuisine: "American",
      caloriesPerServing: 180,
      tags: ["avocado", "toast"],
      userId: 106,
      image: "https://cdn.dummyjson.com/recipe-images/1.webp",
      rating: 4.7,
      reviewCount: 90,
      mealType: ["brunch"],
    ),
    Recipe(
      id: 7,
      name: "Mashed Potatoes",
      ingredients: [
        "2 lbs potatoes, peeled and cubed",
        "1/2 cup milk",
        "1/4 cup butter",
        "Salt and pepper to taste",
      ],
      instructions: [
        "Boil potatoes in salted water until tender, about 15 minutes.",
        "Drain and return to the pot.",
        "Add milk, butter, salt, and pepper.",
        "Mash until smooth and creamy.",
      ],
      prepTimeMinutes: 10,
      cookTimeMinutes: 15,
      servings: 4,
      difficulty: "Easy",
      cuisine: "American",
      caloriesPerServing: 200,
      tags: ["potatoes", "side"],
      userId: 107,
      image: "https://cdn.dummyjson.com/recipe-images/1.webp",
      rating: 4.4,
      reviewCount: 70,
      mealType: ["side dish"],
    ),
  ];
}

List<Category> getCategories() {
  final recipes = getAllRecipes();
  final categories = <String>{};
  for (var recipe in recipes) {
    categories.addAll(recipe.mealType.cast<String>());
  }

  final categoryImages = {
    "breakfast": "breakfast_image.png",
    "lunch": "lunch_image.png",
    "dinner": "dinner_image.png",
    "snack": "snack_image.png",
    "dessert": "dessert_image.png",
    "appetizer": "appetizer_image.png",
    "brunch": "brunch_image.png",
    "side dish": "side_dish_image.png",
  };

  List<Category> categoryList = categories.map((category) {
    return Category(
      name: category,
      image: 'assets/${categoryImages[category.toLowerCase()] ?? "default_category.png"}', // مسار من assets/ مباشرة
    );
  }).toList();

  final now = DateTime.now();
  final hour = now.hour;

  String prioritizedCategory;
  if (hour >= 5 && hour < 11) {
    prioritizedCategory = "breakfast";
  } else if (hour >= 11 && hour < 16) {
    prioritizedCategory = "lunch";
  } else if (hour >= 16 && hour < 21) {
    prioritizedCategory = "dinner";
  } else {
    prioritizedCategory = "snack";
  }

  categoryList.sort((a, b) {
    if (a.name.toLowerCase() == prioritizedCategory) return -1;
    if (b.name.toLowerCase() == prioritizedCategory) return 1;
    return a.name.compareTo(b.name);
  });

  return categoryList;
}
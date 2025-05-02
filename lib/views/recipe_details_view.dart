import 'package:flutter/material.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/widgets/details_view/image_food_details.dart';

class RecipeDetailsView extends StatelessWidget {
  const RecipeDetailsView({super.key, required this.recipe});
  static String id = 'recipeDetails';
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${recipe.name} Recipe",
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageFoodCard(
              img: recipe.image,
            ),
            SizedBox(height: 12),
            Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(recipe.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
            ),
            Padding(padding: EdgeInsets.only(left: 15),
                child: Text("Meal Type: ${recipe.mealType.join(', ')}",style: TextStyle(fontSize: 15,color:Colors.purpleAccent.shade400,fontWeight: FontWeight.w500),)),
            SizedBox(height: 6),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text("${recipe.rating} (${recipe.reviewCount} reviews)"),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  recipeInfo(Icons.schedule, "${recipe.prepTimeMinutes + recipe.cookTimeMinutes} min",Colors.amberAccent),
                  recipeInfo(Icons.local_fire_department, "${recipe.caloriesPerServing} cal",Colors.greenAccent),
                  recipeInfo(Icons.restaurant, recipe.difficulty,Colors.purpleAccent.shade100),
                ],
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Ingredients", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    ...List.generate(recipe.ingredients.length, (index) {
                      return ListTile(
                        leading: Icon(Icons.circle, color: Colors.green,size: 15,),
                        title: Text(recipe.ingredients[index],style: TextStyle(fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.w400)),
                        dense: true,
                      );
                    }),
                    SizedBox(height: 20),
                    Text("Instructions", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    ...List.generate(recipe.instructions.length, (index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.amberAccent,
                          radius: 11,
                          child: Text("${index + 1}", style: TextStyle(fontSize: 15,color: Colors.black)),
                        ),
                        title: Text(recipe.instructions[index],style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,fontWeight: FontWeight.w400)),
                        dense: true,
                      );
                    }),
                    SizedBox(height: 16),
                    Text("Tags", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      children: List.generate(recipe.tags.length, (index) {
                        return Chip(
                          label: Text(recipe.tags[index],style: TextStyle(color: Colors.black),),
                          backgroundColor: Colors.purpleAccent.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.black)),
                        );
                      }),
                    ),
                  ],
                )
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget recipeInfo(IconData icon, String label , Color color) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 40,
        decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
        child:Row(
          children: [
            Icon(icon, size: 18, color: Colors.black),
            SizedBox(width: 4),
            Text(label,style: TextStyle(color: Colors.black),),
          ],
        )
    );
  }
}

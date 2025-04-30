import 'package:flutter/material.dart';
import 'package:recips_app/helper/get_recipe_data.dart';
import 'package:recips_app/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    List newRecpieList = recipeDetails();
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 18),
      child: SizedBox(
        height: 155,
        child: ListView.builder(
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: newRecpieList.length,
          itemBuilder: (context, index) {
            return CategoryCard(recipe: newRecpieList[index]);
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:recips_app/helper/custom_recipe_data.dart';
import 'package:recips_app/views/recipe_list_screen.dart';
import 'package:recips_app/widgets/category_card.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 18),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: ListView.builder(
          shrinkWrap: true,
          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: getCategories().length,
          itemBuilder: (context, index) {
            final category = getCategories()[index];
            return TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(milliseconds: 500 + (index * 100)),
              builder: (context, value, child) {
                return Transform.scale(
                  scale: value,
                  child: Opacity(opacity: value, child: child),
                );
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              RecipeListScreen(category: category.name),
                    ),
                  );
                },
                child: CategoryCard(category: category),
              ),
            );
          },
        ),
      ),
    );
  }
}

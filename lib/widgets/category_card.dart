import 'package:flutter/material.dart';
import 'package:recips_app/models/recipe_model.dart';
import 'package:recips_app/views/recipe_details_view.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.recipe});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shadowColor: const Color.fromARGB(155, 0, 0, 0),
        shape: const StadiumBorder(),
        child: SizedBox(height: 150, width: 95, child: Column(children: [
          
            ],
          )),
      ),
    );
  }
}

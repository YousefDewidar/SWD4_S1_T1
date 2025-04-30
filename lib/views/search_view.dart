import 'package:flutter/material.dart';
import 'package:recips_app/constant.dart';
import 'package:recips_app/helper/get_recipe_data.dart';
import 'package:recips_app/widgets/recipe_card.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = "SearchView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: GestureDetector(
                onTap: () {},
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  color: Colors.white,
                  elevation: 4,
                  shadowColor: const Color.fromARGB(116, 212, 212, 212),
                  surfaceTintColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      onChanged: (v) {},
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Search...',
                        prefixIcon: Icon(
                          Icons.search,
                          color: kPrimaryColor,
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 30, minHeight: 0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 2, top: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: recipeDetails().length,
                itemBuilder: (context, index) => Column(
                  children: [
                    RecipeCard(
                      recipe: recipeDetails()[index],
                      index: index,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

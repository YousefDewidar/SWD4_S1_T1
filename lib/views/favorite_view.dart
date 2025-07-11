import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static String id = 'favoriteView';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'YourfavoriteRecipes');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Image.asset(
              'assets/snack_image.png',
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.08),
            Center(
              child: const Text(
                'Your Favorites Recipes',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
              ),
            ),
            ],
        ),
      ),
    );
  }
}
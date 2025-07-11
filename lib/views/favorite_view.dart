import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static String id = 'favoriteView';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Favorites',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
        ),
        const SizedBox(height: 18),
        Center(child: Text('No favorites added yet')),
      ],
    );
  }
}
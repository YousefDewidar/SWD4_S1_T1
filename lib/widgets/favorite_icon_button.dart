import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {},
        child: const Padding(
          padding: EdgeInsets.all(4),
          child: Icon(Icons.favorite_border, size: 25),
        ),
      ),
    );
  }
}

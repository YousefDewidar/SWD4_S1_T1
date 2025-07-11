import 'package:flutter/material.dart';

class FavoriteIconButton extends StatefulWidget {
  const FavoriteIconButton({super.key});
  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          ScaffoldMessenger.of(context).showMaterialBanner(
            MaterialBanner(content: Text("added to Favorite", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24,color: Colors.white)),
             backgroundColor: Colors.green,
             leading: const Icon(Icons.check_circle, color: Colors.white),
             actions: [
              TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: const Text('OK'),
              ),
             ]
             ),
          );
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return RotationTransition(
                turns: animation,
                child: ScaleTransition(scale: animation, child: child),
              );
            },
            child: isFavorite
                    ? const Icon(
                      Icons.favorite,
                      key: ValueKey('filled'),
                      color: Colors.red,
                    )
                    : const Icon(
                      Icons.favorite_border,
                      key: ValueKey('border'),
                    ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ImageFoodCard extends StatelessWidget {
  const ImageFoodCard({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: const Color.fromARGB(54, 167, 167, 167),
      elevation: 10,
      surfaceTintColor: Colors.white,
      margin: EdgeInsets.zero,
      shape: const ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: SizedBox(
        height: 250,
        child: Center(
          child: CircleAvatar(
            radius: 120,
            backgroundColor: Colors.transparent,
            child: Hero(
              tag: img,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(img),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

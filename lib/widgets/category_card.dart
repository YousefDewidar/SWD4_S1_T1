import 'package:flutter/material.dart';
import 'package:recips_app/constant.dart';
import 'package:recips_app/helper/custom_recipe_data.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = now.hour;
    String prioritizedCategory;
    if (hour >= 5 && hour < 11) {
      prioritizedCategory = "breakfast";
    } else if (hour >= 11 && hour < 16) {
      prioritizedCategory = "lunch";
    } else if (hour >= 16 && hour < 21) {
      prioritizedCategory = "dinner";
    } else {
      prioritizedCategory = "snack";
    }

    final isPrioritized = category.name.toLowerCase() == prioritizedCategory;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 8,
            shadowColor: Colors.black26,
            shape: const StadiumBorder(),
            child: Container(
              height: 180, 
              width: 110, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    isPrioritized
                        ? kPrimaryColor.withOpacity(0.1)
                        : Colors.grey.shade100,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    width: 100, 
                    height: 100, 
                    margin: const EdgeInsets.only(top: 15), 
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isPrioritized
                            ? kPrimaryColor
                            : Colors.grey.shade300,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(category.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12), 
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isPrioritized ? kPrimaryColor : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isPrioritized)
            Positioned(
              top: 5,
              right: 5,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
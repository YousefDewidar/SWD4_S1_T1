import 'package:flutter/material.dart';
import 'package:recips_app/helper/custom_recipe_data.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color cardColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    Color textColor = isDark ? Colors.white : Colors.black87;
    Color borderColor = isDark ? Colors.grey.shade700 : Colors.grey.shade300;
    List<Color> gradientColors = isDark
        ? [const Color(0xFF2C2C2C), const Color(0xFF1C1C1C)]
        : [Colors.white, Colors.white]; 

    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.28; 
    double cardHeight = cardWidth * 1.25;
    double imageSize = cardWidth * 0.75; 

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Stack(
        children: [
          Card(
            color: cardColor,
            surfaceTintColor: cardColor,
            elevation: 6,
            shadowColor: isDark ? Colors.black54 : Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardWidth * 0.67),
            ),
            child: Container(
              height: cardHeight,
              width: cardWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(cardWidth * 0.67),
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: imageSize,
                    height: imageSize,
                    margin: EdgeInsets.only(bottom: imageSize * 0.08),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: borderColor, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: isDark ? Colors.black54 : Colors.black12,
                          blurRadius: cardWidth * 0.05,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(category.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: cardWidth * 0.13,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
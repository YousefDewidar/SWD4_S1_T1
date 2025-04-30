import 'package:flutter/material.dart';
import 'package:recips_app/widgets/details_view/info_recipe_card.dart';

class InfoDetailsView extends StatelessWidget {
  const InfoDetailsView({
    super.key,
    required this.recIngred,
  });
  final List<String> recIngred;

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoRecipeCard(
            color: Colors.amberAccent,
            icon: Icons.timer_sharp,
            title: '5 Min',
          ),
          InfoRecipeCard(
              title: '100 kcal',
              color: Colors.greenAccent,
              icon: Icons.fireplace_outlined),
          InfoRecipeCard(
              title: '20 g',
              color: Colors.purpleAccent,
              icon: Icons.celebration),
        
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      fixedColor: AppColors.primaryColor,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart_rounded),
          label: 'Progress',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habitect/features/home/ui/views/widgets/custom_bottom_nav_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: CustomBottomNavBar());
  }
}

import 'package:flutter/material.dart';
import 'package:habitect/features/home/ui/views/home_view.dart';
import 'package:habitect/features/home/ui/views/widgets/custom_bottom_nav_bar.dart';
import 'package:habitect/features/progress/ui/views/progress_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [HomeView(), ProgressView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}

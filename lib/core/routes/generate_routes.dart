import 'package:flutter/material.dart';
import 'package:habitect/core/layout/main_layout.dart';
import 'package:habitect/core/routes/routes.dart';
import 'package:habitect/features/home/ui/views/home_view.dart';
import 'package:habitect/features/progress/ui/views/progress_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case Routes.mainLayout:
      return MaterialPageRoute(builder: (context) => const MainLayout());
    case Routes.home:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case Routes.progress:
      return MaterialPageRoute(builder: (context) => const ProgressView());
    default:
      return null;
  }
}

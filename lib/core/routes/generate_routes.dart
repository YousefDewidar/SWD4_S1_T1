import 'package:flutter/material.dart';
import 'package:habitect/core/layout/main_layout.dart';
import 'package:habitect/features/home/ui/views/home_view.dart';
import 'package:habitect/features/progress/ui/views/all_goals_view.dart';
import 'package:habitect/features/progress/ui/views/progress_view.dart';

import '../../features/progress/ui/views/your_goals_detail_process_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case MainLayout.id:
      return MaterialPageRoute(builder: (context) => const MainLayout());
    case HomeView.id:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ProgressView.id:
      return MaterialPageRoute(builder: (context) => const ProgressView());
    case AllGoalsView.id:
      return MaterialPageRoute(builder: (context) => const AllGoalsView());
    case YourGoalsDetailProcessScreen.id:
      return MaterialPageRoute(builder: (context) => const YourGoalsDetailProcessScreen());
    default:
      return null;
  }
}

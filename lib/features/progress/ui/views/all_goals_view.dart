import 'package:flutter/material.dart';
import 'package:habitect/features/progress/ui/views/widgets/custom_drop_down.dart';
import 'package:habitect/features/progress/ui/views/widgets/goals_list_view.dart';

class AllGoalsView extends StatelessWidget {
  const AllGoalsView({super.key});

  static const id = 'all_goals';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAllGoalsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: GoalsListView(),
      ),
    );
  }

  AppBar buildAllGoalsAppBar() {
    return AppBar(
      title: Text(
        'Your Goals',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),

      actionsPadding: EdgeInsets.only(right: 16),

      actions: [
        CustomDropDown(
          items: [
            "All",
            "This Month",
            "Last Month",
            "This Year",
            "Last Year",
          ],
        ),
      ],
    );
  }
}

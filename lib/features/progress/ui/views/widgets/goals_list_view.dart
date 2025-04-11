import 'package:flutter/material.dart';
import 'package:habitect/features/progress/data/models/goal.dart';
import 'package:habitect/features/progress/ui/views/widgets/goal_item.dart';

class GoalsListView extends StatelessWidget {
  const GoalsListView({super.key});

  List<Goal> goalsFakeList() => [
    Goal(
      title: 'Journaling everyday',
      progressText: '7 from 7 days target',
      progressValue: 100.0,
      status: GoalStatus.achieved,
    ),

    Goal(
      title: 'Cooking Practice',
      progressText: '7 from 7 days target',
      progressValue: 100.0,
      status: GoalStatus.achieved,
    ),

    Goal(
      title: 'Vitamin',
      progressText: '7 from 7 days target',
      progressValue: 70.0,
      status: GoalStatus.notAchieved,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: goalsFakeList().length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: GoalItem(goal: goalsFakeList()[index]),
        );
      },
    );
  }
}

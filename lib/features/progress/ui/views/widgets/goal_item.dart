import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/widgets/space.dart';
import 'package:habitect/features/progress/data/models/goal.dart';
import 'package:habitect/features/progress/ui/views/widgets/custom_circle_indcator.dart';

class GoalItem extends StatelessWidget {
  const GoalItem({super.key, required this.goal});

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CustomCircleIndicator(
            value: goal.progressValue,
            radius: 30,
            width: 5,
            fontSize: 12,
            color:
            goal.status == GoalStatus.achieved
                ? AppColors.primaryColor
                : Colors.grey,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SpaceV(4),
                Text(
                  goal.progressText,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color:
              goal.status == GoalStatus.achieved ? Color.fromARGB(79, 221, 231, 246) : null,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              goal.status == GoalStatus.achieved ? 'Achieved' : 'Not Achieved',
              style: TextStyle(
                color:
                goal.status == GoalStatus.achieved
                    ? AppColors.primaryColor
                    : Color(0xff959595),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/widgets/space.dart';
import 'package:habitect/features/progress/ui/views/all_goals_view.dart';
import 'package:habitect/features/progress/ui/views/widgets/custom_circle_indcator.dart';
import 'package:habitect/features/progress/ui/views/widgets/goals_list_view.dart';
import 'package:habitect/features/progress/ui/views/widgets/custom_drop_down.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({super.key});

  static const id = 'ProgressView';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Progress',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),

          SpaceV(12),

          // العنوان الفرعي (Progress Report + This Month)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Progress Report',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              CustomDropDown(
                items: ['This Month', 'Last Month', 'This Year', 'Last Year'],
              ),
            ],
          ),
          const SpaceV(24),

          Center(child: CustomCircleIndicator(value: 60, width: 16)),

          const SpaceV(16),

          Center(
            child: Column(
              children: const [
                Text(
                  '11 Habits goal has achieved',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SpaceV(4),
                Text(
                  '6 Habits goal hasn\'t achieved',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SpaceV(24),

          // "Your Goals" + See all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Goals',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AllGoalsView.id);
                },
                child: const Text(
                  'See all',
                  style: TextStyle(color: AppColors.lightPrimaryColor),
                ),
              ),
            ],
          ),
          const SpaceV(16),

          GoalsListView(),
        ],
      ),
    );
  }
}

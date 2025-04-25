import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/features/home/ui/views/create_new_habit_view.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 58.42,
      height: 58.42,
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder:
                (context) => Scaffold(
                  resizeToAvoidBottomInset: false,
                  backgroundColor: Colors.transparent,
                  body: Center(child: const CreateNewHabitView()),
                ),
          );
        },
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(
          side: BorderSide(color: AppColors.whiteColor, width: 4),
        ),
        child: Icon(Icons.add, color: AppColors.whiteColor, size: 35),
      ),
    );
  }
}

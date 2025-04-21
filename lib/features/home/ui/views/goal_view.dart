import 'package:flutter/material.dart';
import 'package:habitect/features/home/ui/views/widgets/goal_components.dart';
import '../../../../core/utils/app_colors.dart';

class GoalView extends StatelessWidget {
  static const id = 'your_goals';
  const GoalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Goals",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 6,
                        offset: Offset(0,4)
                    )
                  ]
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          GoalComponents(label: "Finish 5 books",linearProgress:AppColors.primaryColor),
                          SizedBox(height: 15,),
                          GoalComponents(label: "Sleep before 11 ",linearProgress:AppColors.primaryColor),
                          SizedBox(height: 15,),
                          GoalComponents(label: "Finish my homework ",linearProgress:AppColors.primaryColor),
                          SizedBox(height: 15,),
                          GoalComponents(label: "Go to my faculty ",linearProgress:AppColors.primaryColor),
                          SizedBox(height: 15,),
                          GoalComponents(label: "Go to my faculty ",linearProgress:AppColors.primaryColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

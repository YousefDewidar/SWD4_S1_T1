import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/features/home/ui/views/goal_view.dart';
import 'package:habitect/features/home/ui/views/widgets/goal_components.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed: (){},
        backgroundColor: AppColors.primaryColor,
        shape: CircleBorder(),
        child: Icon(Icons.add,color: Colors.white, size: 35,),
      ),
      body: SingleChildScrollView(
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(
                          "Your Goals",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context,GoalView.id);
                            },
                            child: Text(
                              "See all",
                              style: TextStyle(
                                  color: AppColors.lightPrimaryColor
                              ),
                            )
                        )
                      ]
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                    height: 300,
                    child: SingleChildScrollView(
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

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

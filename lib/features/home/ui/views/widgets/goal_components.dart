import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';

class GoalComponents extends StatelessWidget {
  final String label;
  final Color linearProgress ;
  const GoalComponents({
    super.key,
    required this.label,
    required this.linearProgress
  }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3)
            )
          ]
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.more_vert,
                      size: 20,
                      color: Colors.black,
                    )
                )
              ],
            ),
            SizedBox(
              height: 10,
              width: 250,
              child: LinearProgressIndicator(
                value:5/7 ,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation(linearProgress),
              ),
            ),
            SizedBox(height: 10,),
            Text("5 from 7 days target",style: TextStyle(color: Colors.black45),),
            SizedBox(height: 5,),
            Text("Every day",style: TextStyle(color: AppColors.lightPrimaryColor),),
          ],
        ),
      ),
    );
  }
}

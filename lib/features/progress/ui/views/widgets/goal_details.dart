import 'package:flutter/material.dart';
import 'package:habitect/features/progress/data/models/goal.dart';

class GoalDetails extends StatelessWidget {
  final String habitName;
  final String target;
  final String daysComplete;
  final String daysFailed;
  final String habitType;
  final String createdOn;
  final GoalStatus status;
  final double screenWidth;
  final double screenHeight;

  const GoalDetails({
    super.key,
    required this.habitName,
    required this.target,
    required this.daysComplete,
    required this.daysFailed,
    required this.habitType,
    required this.createdOn,
    required this.status,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              habitName.toUpperCase(),
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.03,
                vertical: screenHeight * 0.008,
              ),
              decoration: BoxDecoration(
                color: status == GoalStatus.achieved
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status == GoalStatus.achieved ? "Achieved" : "Not Achieved",
                style: TextStyle(
                  color:
                  status == GoalStatus.achieved ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.035,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        _buildDetailRow("Habit Name:", habitName, screenWidth),
        SizedBox(height: screenHeight * 0.01),
        _buildDetailRow("Target:", target, screenWidth),
        SizedBox(height: screenHeight * 0.01),
        _buildDetailRow("Days complete:", daysComplete, screenWidth),
        SizedBox(height: screenHeight * 0.01),
        _buildDetailRow("Days failed:", daysFailed, screenWidth),
        SizedBox(height: screenHeight * 0.01),
        _buildDetailRow("Habit type:", habitType, screenWidth),
        SizedBox(height: screenHeight * 0.01),
        _buildDetailRow("Created on:", createdOn, screenWidth),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value, double screenWidth) {
    return Text(
      "$label $value",
      style: TextStyle(fontSize: screenWidth * 0.04),
    );
  }
}
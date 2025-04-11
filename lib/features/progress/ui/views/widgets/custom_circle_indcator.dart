import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustomCircleIndicator extends StatelessWidget {
  final Color color;
  final double value;
  final double radius;
  final double width;
  final double fontSize;
  const CustomCircleIndicator({
    super.key,
    this.color = AppColors.primaryColor,
    required this.value,
    this.radius = 80,
    this.width = 12,
    this.fontSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius,
      lineWidth: width,
      backgroundColor: Color(0xFFF3F4F6),
      progressColor: color,
      animation: true,
      animationDuration: 1000,
      percent: value / 100,
      center: Text(
        '${value.toInt()}%',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 298,
      height: 49,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            color: Color(0xffFBFBFB),
          ),
        ),
      ),
    );
  }
}

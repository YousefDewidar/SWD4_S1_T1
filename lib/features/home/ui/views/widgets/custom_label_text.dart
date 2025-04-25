import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/utils/app_text_styles.dart';

class CustomLabelText extends StatelessWidget {
  final String text;

  const CustomLabelText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles.semiBold11.copyWith(fontSize: 17),
      selectionColor: AppColors.blackColor,
    );
  }
}

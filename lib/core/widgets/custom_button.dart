import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_colors.dart';
import 'package:habitect/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isEnabled;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          isEnabled
              ? AppColors.primaryColor
              : AppColors.primaryColor.withOpacity(0.5),
        ),
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(59)),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.end,
        style: TextStyles.bold16.copyWith(color: Colors.white),
      ),
    );
  }
}

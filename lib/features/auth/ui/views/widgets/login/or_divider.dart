import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: Color(0xffDDDFDF), thickness: 1, endIndent: 20),
        ),
        Text("OR", style: TextStyles.semiBold16),
        const Expanded(
          child: Divider(color: Color(0xffDDDFDF), thickness: 1, indent: 20),
        ),
      ],
    );
  }
}

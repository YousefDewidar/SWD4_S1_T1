import 'package:flutter/material.dart';

class SeeTextButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final TextStyle style;
  const SeeTextButton({super.key,
    required this.onPressed,
    required this.text,
    required this.style});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed,
        child: Text(text,
          style: style,
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:habitect/core/utils/app_text_styles.dart';
import 'package:habitect/core/widgets/icon_back.dart';

AppBar customAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(title, style: TextStyles.bold19),
    centerTitle: true,
    leadingWidth: 80,
    leading: Padding(
      padding: const EdgeInsets.all(5.0),
      child: const IconsBack(),
    ),
  );
}

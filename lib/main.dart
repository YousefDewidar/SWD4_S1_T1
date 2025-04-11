import 'package:flutter/material.dart';
import 'package:habitect/core/routes/generate_routes.dart';
import 'package:habitect/core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.mainLayout,
    );
  }
}

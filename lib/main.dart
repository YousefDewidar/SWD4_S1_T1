import 'package:flutter/material.dart';
import 'package:habitect/core/helpers/di.dart';
import 'package:habitect/core/routes/generate_routes.dart';
import 'package:habitect/features/auth/ui/views/login_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://your-supabase-url.supabase.co',
    anonKey: 'your-anon-key',
  );
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFCFCFF),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xffFCFCFF)),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: LoginView.id,
    );
  }
}

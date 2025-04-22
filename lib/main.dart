import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:habitect/core/layout/main_layout.dart';
import 'package:habitect/core/routes/generate_routes.dart';
import 'package:habitect/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  // await Supabase.initialize(
  //   url: 'https://your-supabase-url.supabase.co',
  //   anonKey: 'your-anon-key',
  // );
  // await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale("en"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffFCFCFF),
        appBarTheme: AppBarTheme(backgroundColor: Color(0xffFCFCFF)),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      // initialRoute: LoginView.id,
      initialRoute: MainLayout.id,
    );
  }
}

// bool isArabic(){
//   return Intl.getCurrentLocale() == "ar";
// }

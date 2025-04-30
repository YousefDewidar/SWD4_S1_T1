import 'package:flutter/material.dart';
import 'package:recips_app/constant.dart';
import 'package:recips_app/views/all_recipes_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffFFF2CC),
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/food-13646 1.png',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Cook Together,',
              style: TextStyle(
                  height: 1,
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500),
            ),
            const Text(
              'Stay Together',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 40,
                  fontWeight: FontWeight.w500),
            ),
          
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AllRecipesView.id, (route) => false);
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(kPrimaryColor),
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:recips_app/views/home_view.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const id = 'splash';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/splash.png', fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: SizedBox(
                height: 30,
                width: 50,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballPulse,
                  colors: [const Color.fromARGB(255, 234, 190, 57)],
                  strokeWidth: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

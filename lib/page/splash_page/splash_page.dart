import 'package:flutter/material.dart';
import 'package:sehatjantungku/page/home/bottom_navigation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BottomNavigationPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100.0,
          child: Image.asset(
              'assets/sehat_jantungku_logo.png'), 
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sehatjantungku/screens/home/home_screen.dart';
import 'package:sehatjantungku/constants/image_constant.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  MyHomeScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 100.0,
          child: Image.asset(ImageConstant.logoApp),
        ),
      ),
    );
  }
}

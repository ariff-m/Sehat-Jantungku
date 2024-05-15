import 'package:flutter/material.dart';
import 'package:sehatjantungku/screens/home/home_page.dart';
import 'package:sehatjantungku/constants/image_constant.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  MyHomePage()),
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

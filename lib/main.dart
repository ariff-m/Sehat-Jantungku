import 'package:flutter/material.dart';
import 'package:sehatjantungku/page/home/bottom_navigation.dart';
import 'package:sehatjantungku/page/home/home_page.dart';
import 'package:sehatjantungku/page/identification/identification_page.dart';
import 'package:sehatjantungku/page/maps/maps_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SehatJantungku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (_) => const BottomNavigationns(),
        '/homePage': (_) => MyHomePage(),
        '/identificatonPage': (_) => const IdentificationPage(),
        '/mapsPage': (_) => const MapsPage(),
      },
    );
  }
}

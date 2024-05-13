import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/screens/home/home_page.dart';
import 'package:sehatjantungku/screens/maps/maps_page.dart';
import 'package:sehatjantungku/screens/maps/maps_view_model.dart';
import 'package:sehatjantungku/screens/splash_page/splash_page.dart';
import 'package:sehatjantungku/screens/identification/identification_page.dart';
import 'package:sehatjantungku/screens/prevention_treatment_suggestions/prevention_page.dart';
import 'package:sehatjantungku/screens/prevention_treatment_suggestions/treatment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapsProvider()),
      ],
      child: MaterialApp(
        title: 'SehatJantungku',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/homePage': (_) => MyHomePage(),
          '/identificatonPage': (_) => const IdentificationPage(),
          '/mapsPage': (_) => const MapsPage(),
          '/preventionPage': (_) => const PreventionPage(),
          '/treatmentPage': (_) => const TreatmentPage(),
        },
      ),
    );
  }
}

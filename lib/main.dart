import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:sehatjantungku/screens/identification/identification_form.dart';
import 'package:sehatjantungku/utils/gemini_api_key.dart';
import 'package:sehatjantungku/screens/home/home_page.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/screens/maps/maps_screen.dart';
import 'package:sehatjantungku/screens/splash/splash_screen.dart';
import 'package:sehatjantungku/screens/maps/maps_view_model.dart';
import 'package:sehatjantungku/screens/suggestions/treatment_screen.dart';
import 'package:sehatjantungku/screens/suggestions/prevention_screen.dart';
import 'package:sehatjantungku/screens/suggestions/suggestion_view_model.dart';
import 'package:sehatjantungku/screens/identification/identification_screen.dart';
import 'package:sehatjantungku/screens/identification/identification_details.dart';
import 'package:sehatjantungku/screens/identification/identification_view_model.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  Gemini.init(apiKey: geminiKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MapsProvider()),
        ChangeNotifierProvider(create: (context) => TreatmentViewModel()),
        ChangeNotifierProvider(create: (context) => PreventionViewModel()),
        ChangeNotifierProvider(create: (context) => IdentificationViewModel()),
      ],
      child: MaterialApp(
        title: 'SehatJantungku',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.secondary),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/homePage': (_) => MyHomePage(),
          '/mapsPage': (_) => const MapsPage(),
          '/treatmentPage': (_) => const TreatmentPage(),
          '/preventionPage': (_) => const PreventionPage(),
          '/identificationPage': (_) => const IdentificationPage(),
          '/detailsPage': (_) => const DetailPage(),
          '/identificationFormPage': (_) => const IdentificationFormScreen(),
        },
      ),
    );
  }
}

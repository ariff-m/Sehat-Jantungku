import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:sehatjantungku/utils/gemini_api_key.dart';
import 'package:sehatjantungku/screens/home/home_screen.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/screens/maps/maps_screen.dart';
import 'package:sehatjantungku/screens/splash/splash_screen.dart';
import 'package:sehatjantungku/screens/maps/maps_view_model.dart';
import 'package:sehatjantungku/screens/suggestions/suggestion_view_model.dart';
import 'package:sehatjantungku/screens/identification/identification_form.dart';
import 'package:sehatjantungku/screens/identification/identification_screen.dart';
import 'package:sehatjantungku/screens/identification/identification_details.dart';
import 'package:sehatjantungku/screens/suggestions/treatment_suggestion_screen.dart';
import 'package:sehatjantungku/screens/suggestions/prevention_suggestion_screen.dart';
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
        ChangeNotifierProvider(create: (context) => MapsViewModel()),
        ChangeNotifierProvider(create: (context) => TreatmentViewModel()),
        ChangeNotifierProvider(create: (context) => PreventionViewModel()),
        ChangeNotifierProvider(create: (context) => IdentificationViewModel()),
      ],
      child: MaterialApp(
        title: 'Sehat Jantungku',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstant.secondary),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
          '/homeScreen': (_) => MyHomeScreen(),
          '/mapsScreen': (_) => const MapsScreen(),
          '/treatmentScreen': (_) => const TreatmentScreen(),
          '/preventionScreen': (_) => const PreventionScreen(),
          '/identificationScreen': (_) => const IdentificationScreen(),
          '/detailsScreen': (_) => const DetailScreen(),
          '/identificationFormScreen': (_) => const IdentificationFormScreen(),
        },
      ),
    );
  }
}

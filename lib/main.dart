import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:bufskit/pages/dashboard.dart';
import 'package:bufskit/pages/login.dart';
import 'package:bufskit/pages/cafeteria.dart';
import 'package:bufskit/pages/privacy_page.dart';
import 'package:bufskit/pages/dashboard.dart';
import 'package:bufskit/pages/information_page.dart';
import 'package:bufskit/pages/uninotice_page.dart';
import 'package:bufskit/pages/acanotice_page.dart';
import 'package:bufskit/pages/splash_page.dart';
import 'package:bufskit/pages/schedule_page.dart';
import 'package:bufskit/pages/score_page.dart';
import 'package:bufskit/pages/student_page.dart';
import 'package:bufskit/pages/food_page.dart';
import 'package:bufskit/pages/bus_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: const Color(0xffECECEC),
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffECECEC),
          primary: const Color(0xffFEFEFE),
          secondary: Colors.black,
          tertiary: const Color(0xff716FE9),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          labelSmall: TextStyle(fontSize: 15.0, color: Color(0xff4A4A4A)),
          labelLarge: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
          labelMedium: TextStyle(fontSize: 15.0, color: Colors.black),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: const Color(0xff131313),
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff131313),
          primary: const Color(0xff1D1D1D),
          secondary: Colors.white,
          tertiary: const Color(0xff716FE9),
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          labelSmall: TextStyle(fontSize: 15.0, color: Color(0xffB0B0B0)),
          labelLarge: TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
          labelMedium: TextStyle(fontSize: 15.0, color: Colors.white),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      initialRoute: '/cafeteria',
      routes: {
        // '/': (context) => const SplashPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/cafeteria': (context) => const CafeteriaPage(),
        '/login': (context) => const LoginPage(),
        // '/privacy': (context) => const PrivacyPage(),
        // '/information': (context) => const InformationPage(),
        // '/uninotice': (context) => const UninoticePage(),
        // '/acanotice': (context) => const AcanoticePage(),
        // '/schedule': (context) => const SchedulePage(),
        // '/score': (context) => const ScorePage(),
        // '/student': (context) => const StudentPage(),
        // '/food': (context) => const FoodPage(),
        // '/bus': (context) => const BusPage(),
      },
    );
  }
}

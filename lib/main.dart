import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:bufskit/pages/login_page.dart';
import 'package:bufskit/pages/main_page.dart';
import 'package:bufskit/pages/information_page.dart';
import 'package:bufskit/pages/uninotice_page.dart';
import 'package:bufskit/pages/acanotice_page.dart';
import 'package:bufskit/pages/splash_page.dart';
import 'package:bufskit/pages/schedule_page.dart';
import 'package:bufskit/pages/score_page.dart';
import 'package:bufskit/pages/student_page.dart';
import 'package:bufskit/pages/food_page.dart';

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
      ),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
      initialRoute: '/splash',
      routes: {
        '/': (context) => const MainPage(),
        '/splash': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/information': (context) => const InformationPage(),
        '/uninotice': (context) => const UninoticePage(),
        '/acanotice': (context) => const AcanoticePage(),
        '/schedule': (context) => const SchedulePage(),
        '/score': (context) => const ScorePage(),
        '/student': (context) => const StudentPage(),
        '/food': (context) => const FoodPage(),
      },
    );
  }
}

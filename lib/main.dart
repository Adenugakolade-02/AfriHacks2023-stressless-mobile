import 'package:flutter/material.dart';
import 'package:stressless/config/app_router.dart';
import 'package:stressless/config/app_theme.dart';
import 'package:stressless/locator.dart';
import 'package:stressless/pages/home/home_page.dart';
import 'package:stressless/pages/home/home_screen.dart';
import 'package:stressless/pages/mental_assessment/mood_info.dart';
import 'package:stressless/pages/mental_assessment/sleep_quality.dart';
import 'package:stressless/pages/mental_assessment/stress_info.dart';
import 'package:stressless/pages/mental_assessment/stressless_info.dart';
import 'package:stressless/pages/onboarding/ai_recommendation_screen.dart';
import 'package:stressless/pages/onboarding/authentication_screen.dart';
import 'package:stressless/pages/onboarding/loading_screen.dart';
import 'package:stressless/pages/onboarding/mental_assessment_five.dart';
import 'package:stressless/pages/onboarding/mental_assessment_four.dart';
import 'package:stressless/pages/onboarding/mental_assessment_one.dart';
import 'package:stressless/pages/onboarding/mental_assessment_six.dart';
import 'package:stressless/pages/onboarding/mental_assessment_three.dart';
import 'package:stressless/pages/onboarding/mental_assessment_two.dart';
import 'package:stressless/pages/onboarding/onboarding_screen.dart';
import 'package:stressless/pages/onboarding/stress_score_screen.dart';
import 'package:stressless/services/navigation_service.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeClass.lightTheme,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: serviceLocator<NavigatorService>().navigatorKey,
      home:  const AuthenticationScreen()
    );
  }
}

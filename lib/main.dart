import 'package:flutter/material.dart';
import 'package:stressless/config/app_theme.dart';
import 'package:stressless/pages/onboarding/authentication_screen.dart';
import 'package:stressless/pages/onboarding/onboarding_screen.dart';

void main() {
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
      home:  const AuthenticationScreen()
    );
  }
}

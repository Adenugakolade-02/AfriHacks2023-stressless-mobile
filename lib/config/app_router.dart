import 'package:flutter/material.dart';
import 'package:stressless/pages/home/home_screen.dart';
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
import 'package:stressless/utils/app_routes.dart';

class AppRouter{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoute.authentication:
        return _buildRoute(const AuthenticationScreen());
      case AppRoute.homeScreen:
        return _buildRoute(const HomeScreen());
      case AppRoute.stressScore:
        return _buildRoute(const StressScoreScreen());
      case AppRoute.loadingScreen:
        return _buildRoute(const LoadingScreen());
      case AppRoute.onboardingScreen:
        return _buildRoute(const OnboardingScreen());
      case AppRoute.m1:
        return _buildRoute(const MentalAssessmentOne());
      case AppRoute.m2:
        return _buildRoute(const MentalAssessmentTwo());
      case AppRoute.m3:
        return _buildRoute(const MentalAssesssmentThree());
      case AppRoute.m4:
        return _buildRoute(const MentalAssessmentFour());
      case AppRoute.m5:
        return _buildRoute(const MentalAssessmentFive());
      case AppRoute.m6:
        return _buildRoute(const MentalAssessmentSix());
      default:
        return _buildRoute(const Scaffold(
          body: Center(child: Text('Invalid route reached.'),),
      ));
    }
  }
}

Widget _transitionHandler(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    var begin = const Offset(0.0, 1.0);
    var end = Offset.zero;
    var curve = Curves.ease;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return FadeTransition(opacity: animation, child: SlideTransition(position: animation.drive(tween), child: child,),);
  }
  
Duration _forward() {
    return const Duration(milliseconds: 200);
  }

  Duration _reverse() {
    return const Duration(milliseconds: 200);
  }

  PageRouteBuilder _buildRoute(Widget child, { RouteSettings? settings }) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionsBuilder: _transitionHandler, transitionDuration: _forward(), reverseTransitionDuration: _reverse(),
    );
  }
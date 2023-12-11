import 'dart:developer';

import 'package:stressless/locator.dart';
import 'package:stressless/pages/home/home_screen.dart';
import 'package:stressless/pages/onboarding/loading_screen.dart';
import 'package:stressless/pages/onboarding/onboarding_screen.dart';
import 'package:stressless/services/navigation_service.dart';

class AppRoute{
  static const authentication = 'authentication';
  static const homeScreen = "homeScreen";
  static const stressScore = "stressScore";
  static const loadingScreen = "loadingScreen";
  static const onboardingScreen = "onboardingScreen";
  static const m1 = "m1"; //mentalAssessmentOnePage
  static const m2 = "m2";
  static const m3 = "m3";
  static const m4 = "m4";
  static const m5 = "m5";
  static const m6 = "m6";



  static Future go(String destination, { dynamic arguments, bool? pop, bool? popAll }) async {
    log("called log here in go");
    if (pop == true) {
      return await serviceLocator<NavigatorService>().popNavigateTo(destination, arguments: arguments);
    } else if (popAll == true) {
      return await serviceLocator<NavigatorService>().popAllNavigateTo(destination, arguments: arguments);
    } else {
      return await serviceLocator<NavigatorService>().navigateTo(destination, arguments: arguments);
    }
  }
  static pop<T extends Object>([T? result]) {
    return serviceLocator<NavigatorService>().pop(result);
  }

  static bool? canPop(){
    return serviceLocator<NavigatorService>().canPop();
  }
  
}
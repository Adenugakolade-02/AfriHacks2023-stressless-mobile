import 'package:get_it/get_it.dart';
import 'package:stressless/pages/home/home_view_model.dart';
import 'package:stressless/pages/onboarding/onboarding_view_model.dart';
import 'package:stressless/services/navigation_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator(){
  serviceLocator.registerLazySingleton(() => NavigatorService());
  //models
  serviceLocator.registerLazySingleton(() => OnboardingViewModel());
  serviceLocator.registerLazySingleton(() => HomeViewModel());
}
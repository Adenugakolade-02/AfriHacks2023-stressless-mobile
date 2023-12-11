import 'package:get_it/get_it.dart';
import 'package:stressless/services/navigation_service.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator(){
  serviceLocator.registerLazySingleton(() => NavigatorService());
}
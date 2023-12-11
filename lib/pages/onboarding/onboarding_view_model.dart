import 'package:flutter/material.dart';
import 'package:stressless/utils/app_routes.dart';

class OnboardingViewModel extends ChangeNotifier{
  
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late TextEditingController usernameController;
  late TextEditingController rEmailController;
  late TextEditingController rPasswordController;

  late TextEditingController mentalHealthController;

  int? selectedHealthGoalValue;
  int? selectedMoodValue;
  int? selectedSleepQualityValue;
  int? selectedStressLevelValue;
  int? selectedStressorValue;

  void signIn(){
    AppRoute.go(AppRoute.m1);
  }

  void register(){
 
  }

  void selectHealthGoal(int? value){
    selectedHealthGoalValue = value;
    notifyListeners();
  }
  void selectMoodValue(int? value){
    selectedMoodValue = value;
    notifyListeners();
  }
  void selectSleepQuality(int? value){
    selectedSleepQualityValue = value;
    notifyListeners();
  }
  void selectStressLevel(int? value){
    selectedStressLevelValue = value;
    notifyListeners();
  }
  void selectStressor(int? value){
    selectedStressorValue = value;
    notifyListeners();
  }
   void submitHealthAssessment(){
    AppRoute.go(AppRoute.loadingScreen);
    Future.delayed(const Duration(seconds: 3)).then((value) => AppRoute.go(AppRoute.stressScore));
   }
}
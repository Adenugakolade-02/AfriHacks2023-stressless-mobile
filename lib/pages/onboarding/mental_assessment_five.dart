import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stressless/locator.dart';
import 'package:stressless/pages/onboarding/onboarding_view_model.dart';
import 'package:stressless/utils/app_routes.dart';

class MentalAssessmentFive extends StatefulWidget {
  const MentalAssessmentFive({super.key});

  @override
  State<MentalAssessmentFive> createState() => _MentalAssessmentFiveState();
  
}

class _MentalAssessmentFiveState extends State<MentalAssessmentFive> {
  final OnboardingViewModel model = serviceLocator<OnboardingViewModel>();
  int? selectedIntValue;

  @override
  void initState() {
    selectedIntValue = null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return ChangeNotifierProvider.value(
      value: model,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                topHeader(),
                const SizedBox(height: 32,),
                const Text("Select stressors", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,),
                const SizedBox(height: 4,),
                SizedBox( width: size.width/1.5,child: const Text("Our AI will generate how your stressors will impact your life in general. Select all that applies", style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,)),
                const SizedBox(height: 50,),
                Consumer<OnboardingViewModel>(
                  builder: (_,model,__) {
                    return Column(
                      children: [
                        mentalAssstmentWidget(SvgPicture.asset("assets/images/solid_heart.svg"), "Life", 1,),
                        mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid work.svg"), "Work", 2,),
                        mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid family.svg"), "Family & Friends", 3,),
                        mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid happy.svg"), "Kids", 4, ),
                        mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid finance.svg"), "Finances", 5, ),
                        mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid others.svg"), "Others", 6, ),
                      ],
                    );
                  }
                ),
                const Spacer(),
                ElevatedButton(onPressed: ()=>AppRoute.go(AppRoute.m6), child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Continue"),
                    const SizedBox(width: 8,),
                    SvgPicture.asset("assets/images/Monotone arrow right sm.svg")
                  ],
                ))
              ],
            ),
          )
        ),
      ),
    );
  }

  Widget topHeader(){
    return Row(
      children: [
        GestureDetector(
          onTap: ()=>AppRoute.pop(),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF4B4D4C),
                width: 0.83
              )
            ),
            child: SvgPicture.asset("assets/images/Monotone arrow left sm.svg",height: 20,width: 20,fit:BoxFit.scaleDown),
          ),
        ),
        const SizedBox(width: 12,),
        const Text("Welcome Bolaji!", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
        const Spacer(),
        GestureDetector(
          onTap: (){},
          child: Container(
            height: 30,
            width: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: const Color(0xFFF6991A,).withOpacity(0.2),
            ),
            child: const Center(child:  Text("5 OF 6", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
          ),
        )
      ],
    );
  }
  Widget mentalAssstmentWidget(Widget leadingIcon, String title, int value){
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
        ),
        child: ListTile(
          leading: leadingIcon,
          title: Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
          selectedTileColor: const Color(0xFFC9EBDF),
          tileColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
          dense: true,
          visualDensity: const VisualDensity(vertical: 4),
          selected: model.selectedStressorValue == value,
          onTap: ()=>model.selectStressor(value),
          trailing: Radio(
            value: value,
            groupValue: model.selectedStressorValue,
            onChanged: model.selectStressor,
            activeColor: const Color(0xFF4B4D4C),
          ),
        ),
      ),
    );
  }
}
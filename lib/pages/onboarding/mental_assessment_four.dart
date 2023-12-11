import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stressless/locator.dart';
import 'package:stressless/pages/onboarding/onboarding_view_model.dart';
import 'package:stressless/utils/app_routes.dart';

class MentalAssessmentFour extends StatefulWidget {
  const MentalAssessmentFour({super.key});

  @override
  State<MentalAssessmentFour> createState() => _MentalAssessmentFourState();
}

class _MentalAssessmentFourState extends State<MentalAssessmentFour> {
  final OnboardingViewModel model = serviceLocator<OnboardingViewModel>();
  List<dynamic> trial = [
    "You are great! No Stress at all",
    "You are really good",
    "You're good but you're tired",
    "You're stressed out",
    "You Are Exremely Stressed Out."
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Scaffold(
        backgroundColor: Colors.white,

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                topHeader(),
                const SizedBox(height: 32,),
                const Text("How would you describe your mood", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,),
                const SizedBox(height: 24,),
                Consumer<OnboardingViewModel>(
                  builder: (_,model,__) {
                    return Column(
                      children: [
                        Text("${model.selectedStressLevelValue ?? ""}", style: const TextStyle(fontFamily: "Urbanist", fontSize: 180, fontWeight: FontWeight.w800, color: Color(0xFF111111)), textAlign: TextAlign.center,),
                        const SizedBox(height: 34,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            stressLevelContainer(1),
                            stressLevelContainer(2),
                            stressLevelContainer(3),
                            stressLevelContainer(4,),
                            stressLevelContainer(5,),
                          ],
                        ),
                        const SizedBox(height: 40,),
                        Text("${model.selectedStressLevelValue==null ? "" : trial[model.selectedStressLevelValue!-1]}", style: const TextStyle(fontFamily: "Urbanist", fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C)),),
                      ],
                    );
                  }
                ),
                const Spacer(),
                ElevatedButton(onPressed: ()=>AppRoute.go(AppRoute.m5), child:  Row(
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
        const Text("Assessment", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
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
            child: const Center(child:  Text("4 OF 6", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
          ),
        )
      ],
    );
  }
  Widget stressLevelContainer(value){
    return InkWell(
      onTap: ()=>model.selectStressLevel(value),
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: value==model.selectedStressLevelValue? Color(0xFFC6FCDB): Colors.white,
          shape: BoxShape.circle,
          boxShadow: value==model.selectedStressLevelValue? [BoxShadow(spreadRadius: 4,color: const Color(0xFFC6FCDB).withOpacity(0.4))] : null
        ),
      child: Center(child: Text("$value", style: TextStyle(fontFamily: "Urbanist", fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),),
      ),
    );
  }
}
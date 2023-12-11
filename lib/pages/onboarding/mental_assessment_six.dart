import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/locator.dart';
import 'package:stressless/pages/onboarding/onboarding_view_model.dart';
import 'package:stressless/utils/app_routes.dart';
import 'package:stressless/utils/widget/custom_textfield.dart';

class MentalAssessmentSix extends StatefulWidget {
  const MentalAssessmentSix({super.key});

  @override
  State<MentalAssessmentSix> createState() => _MentalAssessmentSixState();
}

class _MentalAssessmentSixState extends State<MentalAssessmentSix> {
  final OnboardingViewModel model = serviceLocator<OnboardingViewModel>();

  @override
  void initState() {
    model.mentalHealthController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    model.mentalHealthController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              topHeader(),
              const SizedBox(height: 32,),
              const Text("Mental Health Analysis", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,),
              const SizedBox(height: 6,),
              SizedBox( width: size.width/1.5,child: const Text("Freely write anything that’s on your mind here and it will be kept secret. Only our AI is listening...", style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,)),
              const SizedBox(height: 50,),
              LongFormField(controller: model.mentalHealthController),
              const SizedBox(height: 34,),
              dummyVoiceIcon(),
              // kTextFormField(title: "", prefixIcon: null, controller: TextEditingController(), maxLines: 10,),
              const Spacer(),
              ElevatedButton(onPressed: model.submitHealthAssessment, child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Submit"),
                  const SizedBox(width: 8,),
                  SvgPicture.asset("assets/images/Monotone arrow right sm.svg")
                ],
              ))
            ],
          ),
        )
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
          onTap: ()=>AppRoute.pop(),
          child: Container(
            height: 30,
            width: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              color: const Color(0xFFF6991A,).withOpacity(0.2),
            ),
            child: const Center(child:  Text("6 OF 6", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
          ),
        )
      ],
    );
  }

  Widget dummyVoiceIcon(){
    return InkWell(
      onTap: (){},
      child: Container(
        height: 40,
        // width: 156,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFC6FCDB),
          borderRadius: BorderRadius.circular(1000)
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.mic,color: Color(0xFF4B4D4C),),
            Text("Use voice Instead", style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4B4D4C)),),
          ],
        ),
      ),
    );
  }
}
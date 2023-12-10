import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/widgets/onboarding/sleep_slider_widget.dart';

class MentalAssesssmentThree extends StatefulWidget {
  const MentalAssesssmentThree({super.key});

  @override
  State<MentalAssesssmentThree> createState() => _MentalAssesssmentThreeState();
}

class _MentalAssesssmentThreeState extends State<MentalAssesssmentThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              topHeader(),
              const SizedBox(height: 32,),
              const Text("How would you rate your sleep quality?", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,),
              SleepSliderWidget()
            ],
          ),
        )
      ),
    );
  }
  Widget topHeader(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){},
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
              child: const Center(child:  Text("2 OF 5", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
            ),
          )
        ],
      ),
    );
  }
}
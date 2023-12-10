import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MentalAssessmentOne extends StatefulWidget {
  const MentalAssessmentOne({super.key});

  @override
  State<MentalAssessmentOne> createState() => _MentalAssessmentOneState();
  
}

class _MentalAssessmentOneState extends State<MentalAssessmentOne> {
  int? selectedIntValue;

  @override
  void initState() {
    selectedIntValue = null;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              topHeader(),
              const SizedBox(height: 32,),
              const Text("What’s your health goal today?", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,),
              const SizedBox(height: 50,),
              mentalAssstmentWidget(SvgPicture.asset("assets/images/solid_heart.svg"), "I wanna reduce stress", 1, selectedIntValue),
              mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid robot.svg"), "I wanna try AI Therapy", 2, selectedIntValue),
              mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid flag.svg"), "I wanna track my mood", 3, selectedIntValue),
              mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid mood happy.svg"), "I want to be a better person", 4, selectedIntValue),
              mentalAssstmentWidget(SvgPicture.asset("assets/images/Solid mobile.svg"), "Just trying out the app, mate!", 5, selectedIntValue),
              
              const Spacer(),
              ElevatedButton(onPressed: (){}, child:  Row(
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
    );
  }

  Widget topHeader(){
    return Row(
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
            child: const Center(child:  Text("SKIP", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
          ),
        )
      ],
    );
  }
  Widget mentalAssstmentWidget(Widget leadingIcon, String title, int value, int? groupValue){
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 2,
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
          selected: groupValue == value,
          onTap: (){
            setState(() {
              selectedIntValue = value;
            });
          },
          trailing: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (_){
              setState(() {
                selectedIntValue = _;
              });
            },
            activeColor: const Color(0xFF4B4D4C),
          ),
        ),
      ),
    );
  }
}
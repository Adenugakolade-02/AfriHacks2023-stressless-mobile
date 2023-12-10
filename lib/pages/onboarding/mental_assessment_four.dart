import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MentalAssessmentFour extends StatefulWidget {
  const MentalAssessmentFour({super.key});

  @override
  State<MentalAssessmentFour> createState() => _MentalAssessmentFourState();
}

class _MentalAssessmentFourState extends State<MentalAssessmentFour> {
  int? selectedStressLevel;
  List<dynamic> trial = [
    "You are great! No Stress at all",
    "You are really good",
    "You're good but you're tired",
    "You're stressed out",
    "You Are Exremely Stressed Out."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: topHeader(),centerTitle: false, backgroundColor: Colors.white, elevation: 0,),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // topHeader(),
              const SizedBox(height: 32,),
              const Text("How would you describe your mood", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,),
              const SizedBox(height: 24,),
              Text("${selectedStressLevel ?? ""}", style: const TextStyle(fontFamily: "Urbanist", fontSize: 180, fontWeight: FontWeight.w800, color: Color(0xFF111111)), textAlign: TextAlign.center,),
              const SizedBox(height: 34,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  stressLevelContainer(1, selectedStressLevel),
                  stressLevelContainer(2, selectedStressLevel),
                  stressLevelContainer(3, selectedStressLevel),
                  stressLevelContainer(4, selectedStressLevel),
                  stressLevelContainer(5, selectedStressLevel),
                ],
              ),
              const SizedBox(height: 40,),
              Text("${selectedStressLevel==null ? "" : trial[selectedStressLevel!-1]}", style: const TextStyle(fontFamily: "Urbanist", fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C)),),
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
              child: const Center(child:  Text("3 OF 5", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
            ),
          )
        ],
      ),
    );
  }
  Widget stressLevelContainer(value, selectedValue){
    return InkWell(
      onTap: (){
        setState(() {
          selectedStressLevel  = value;
        });
      },
      child: Container(
        height: 64,
        width: 64,
        decoration: BoxDecoration(
          color: value==selectedValue? Color(0xFFC6FCDB): Colors.white,
          shape: BoxShape.circle,
          boxShadow: value==selectedValue? [BoxShadow(spreadRadius: 4,color: const Color(0xFFC6FCDB).withOpacity(0.4))] : null
        ),
      child: Center(child: Text("$value", style: TextStyle(fontFamily: "Urbanist", fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),),
      ),
    );
  }
}
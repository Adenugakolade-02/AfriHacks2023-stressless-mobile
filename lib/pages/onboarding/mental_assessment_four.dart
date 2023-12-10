import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MentalAssessmentFour extends StatefulWidget {
  const MentalAssessmentFour({super.key});

  @override
  State<MentalAssessmentFour> createState() => _MentalAssessmentFourState();
}

class _MentalAssessmentFourState extends State<MentalAssessmentFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              child: const Center(child:  Text("1 OF 5", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
            ),
          )
        ],
      ),
    );
  }
}
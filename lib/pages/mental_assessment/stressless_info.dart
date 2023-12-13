import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stressless/utils/app_routes.dart';

class StressLessInfo extends StatefulWidget {
  const StressLessInfo({super.key});

  @override
  State<StressLessInfo> createState() => _StressLessInfoState();
}

class _StressLessInfoState extends State<StressLessInfo> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC9EBDF),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/images/background.svg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  topHeader("Normal", const Color(0xFFF6991A)),
                  const SizedBox(height: 30,),
                  scoreWidget(50, "Stressed, Neutral"),
                  const SizedBox(height: 25,),
                  InkWell(
                    onTap: ()=>AppRoute.go(AppRoute.aiRecommendationScreen),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                        "See StressLess AI Recommendations",
                        style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF111111), decoration: TextDecoration.underline,),
                        ),
                        const SizedBox(width: 6,),
                        SvgPicture.asset("assets/images/20  chevron double right sm.svg", height: 18, width: 18, fit: BoxFit.scaleDown,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15,),
                          const Text("Score History", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C))),
                          const SizedBox(height: 16,),
                          Expanded(
                            child: Container(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                    stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }

  Widget stresslessWidget(DateTime date, String title, String subtitle, int score){
    final monthFormatter = DateFormat("MMM");
    final dayFormatter = DateFormat("d");
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      
      child: Material(
        elevation: 0.5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
        ),
        shadowColor: const Color(0xFF4B3425),
        color: const Color(0xFFFFFFFF),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 3),
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFECE7E1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(monthFormatter.format(date), style: const TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C)),),
                  const SizedBox(height: 2,),
                  Text(dayFormatter.format(date), style: const TextStyle(fontFamily: "Urbanist", fontSize: 8, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C)),),
                ],
              ),
            ),
          ),
          title: Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111111)),),
          subtitle: Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF111111)),),
          trailing: SizedBox(
            height: 45,
            width: 45,
            child: Stack(
              children: [
                SizedBox(
                  height: 40, 
                  width: 40,
                  child: CircularProgressIndicator(
                    color: const Color(0xFF111111),
                    backgroundColor: const Color(0xFFECE7E1),
                    value: score/100,
                    strokeWidth: 5,
                  ),
                ),
                Positioned(
                  right: 18,
                  bottom: 20,
                  child: Text("$score", style: const TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w700, color: Color(0xFF0000000)),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget scoreWidget(int score, String note){
    return Stack(
      children: [
        SizedBox(
          height: 159,
          width: 159,
          child:  CircularProgressIndicator(
            color: const Color(0xFF111111),
            backgroundColor: Color(0xFFAFAFAF),
            value: score/100,
            strokeWidth: 5,
          ),
        ),
        Positioned(
          right: 40,
          bottom: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("$score", style: const TextStyle(fontFamily: "Urbanist", fontSize: 50, fontWeight: FontWeight.w700, color: Color(0xFF000000)),),
              const SizedBox(height: 4,),
              Text(note, style: const TextStyle(fontFamily: "Urbanist", fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF4B4D4C)),),
            ],
          )
        )
      ],
    );
  }

  Widget topHeader(String tag, Color color){
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
        const Text("StressLess score", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
        const Spacer(),
        Container(
          height: 30,
          width: 81,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(100)
          ),
          child: Center(
            child: Text(tag, style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: color)),
          ),
        ),
      ],
    );
  }
}
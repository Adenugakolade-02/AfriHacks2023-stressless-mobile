import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stressless/utils/app_routes.dart';

class StressInfo extends StatefulWidget {
  const StressInfo({super.key});

  @override
  State<StressInfo> createState() => _StressInfoState();
}

class _StressInfoState extends State<StressInfo> {
  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMM d');
    final Size size = MediaQuery.of(context).size;
    DateTime currentDate = DateTime.now();
    DateTime last14DaysDate = currentDate.subtract(const Duration(days: 14));
    return Scaffold(
      backgroundColor: const Color(0xFFE9DBFF),
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
                  scoreWidget(3, "Stressed, Neutral"),
                  const SizedBox(height: 16,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Major Stressors", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF070707)), textAlign: TextAlign.center,)),
                  const SizedBox(height: 30,),
                  stressorWidget(),
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
                  const SizedBox(height: 70,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30,),
                          const Text("Stress Level History", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C))),
                          const SizedBox(height: 30,),

                          SizedBox(
                            height: 302,
                            width: double.infinity,
                            child: chartTrial(),
                          ),
                          const Divider(thickness: 3,),
                          Row(
                            children: [
                              Text(format.format(last14DaysDate), style: const TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF4B4D4C)),),
                              const Spacer(),
                              Text(format.format(currentDate), style: const TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xFF4B4D4C)),),
                            ],
                          )
                          // Expanded(
                          //   child: Container(
                          //     child: SingleChildScrollView(
                          //       child: Column(
                          //         children: [
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //           stresslessWidget(DateTime.now(), "Stressed, depressed", "See a therapist", 15),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // )
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

  Widget chartTrial(){
    return BarChart(BarChartData(
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: const FlTitlesData(
        show: false
      ),
      maxY: 5,
      minY: 0,
      // add bars
      barGroups: List.generate(14, (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: Random().nextInt(6).toDouble(),
            width: 10,
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFF111111),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 5,
              color: const Color(0xFFAFAFAF)
            )
          )
        ]
        ))
      ));
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("$score", style: const TextStyle(fontFamily: "Urbanist", fontSize: 50, fontWeight: FontWeight.w700, color: Color(0xFF000000)),),
        const SizedBox(height: 4,),
        Text(note, style: const TextStyle(fontFamily: "Urbanist", fontSize: 11, fontWeight: FontWeight.w500, color: Color(0xFF4B4D4C)),),
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
        const Text("Stress Level Stats", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
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

  Widget stressorWidget(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/solid_heart.svg", height: 24, width: 24, fit: BoxFit.scaleDown, color: const Color(0xFF070707),),
            const SizedBox(height: 4,),
            const Text("Life",style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF070707)),)
          ],
        ),
        const SizedBox(width: 25,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/Solid work.svg", height: 24, width: 24, fit: BoxFit.scaleDown, color: const Color(0xFF070707),),
            const SizedBox(height: 4,),
            const Text("Work",style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF070707)),)
          ],
        ),
        const SizedBox(width: 25,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/Solid finance.svg", height: 24, width: 24, fit: BoxFit.scaleDown, color: const Color(0xFF070707),),
            const SizedBox(height: 4,),
            const Text("Finance",style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF070707)),)
          ],
        ),
      ],
    );
  }
}
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/utils/app_routes.dart';

class StressScoreScreen extends StatelessWidget {
  const StressScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC9EBDF),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/images/background.svg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text("Your StressLess score", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),
                  ),
                  const SizedBox(height: 20,),

                  const Stack(
                    children: [
                      SizedBox(
                        height: 159,
                        width: 159,
                        child:  CircularProgressIndicator(
                          color: const Color(0xFF111111),
                          backgroundColor: Color(0xFFAFAFAF),
                          value: 0.5,
                          strokeWidth: 5,
                        ),
                      ),
                      Positioned(
                        right: 50,
                        bottom: 50,
                        child: Text("50", style: TextStyle(fontFamily: "Urbanist", fontSize: 50, fontWeight: FontWeight.w700, color: Color(0xFF000000)),)
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text("This is a balanced state. Keep up the good work!", style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF4B4D4C)),),
                   SizedBox(height: size.height/8.5,),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child:Text("StressLess Score Breakdown", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),)),
                  const SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      breakdownSection("assets/images/Solid mood happy_1.svg", const Color(0xFFFFCE5C), "Mood", 60),
                      breakdownSection("assets/images/Solid stress.svg", const Color(0xFFC9A7FF), "Stress level", 35),
                      breakdownSection("assets/images/Solid sleep.svg", const Color(0xFF75DAFF), "Sleep quality", 55),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("See AI recommendations"),
                         SizedBox(width: 10,),
                        Icon(Icons.arrow_forward_rounded,)
                      ],
                  )),
                  const SizedBox(height: 16,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4B4D4C)
                    ),
                    onPressed: ()=>AppRoute.go(AppRoute.homeScreen), 
                    child: const Text("Go to your Home page")
                    )
                ],
              ),
            )
          ],
        )
      ),
    );
  }
  Widget breakdownSection(String svg, Color svgColor, String title, double score){
    return Builder(
      builder: (context) {
        Size size = MediaQuery.of(context).size;
        return Container(
          height: 128,
          width: size.width/3 -20,
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(svg, color: svgColor, height: 14, width: 14, fit: BoxFit.scaleDown,),
                  const SizedBox(width: 6,),
                  Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xFF0000000)),)
                ],
              ),
              const SizedBox(height: 16,),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 60, width: 60,
                      child: CircularProgressIndicator(
                        color: svgColor,
                        backgroundColor: Color(0xFFECE7E1),
                        value: score/100,
                        strokeWidth: 5,
                      ),
                    ),
                    Positioned(
                      right: 15,
                      bottom: 20,
                      child: Text("$score", style: const TextStyle(fontFamily: "Urbanist", fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF0000000)),)
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
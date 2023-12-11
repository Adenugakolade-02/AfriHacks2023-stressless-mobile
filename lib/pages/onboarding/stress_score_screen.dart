import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SizedBox(height: size.height*0.,),
                  const Text(
                    "Compiling Data...",
                    style: TextStyle(fontFamily: "Urbanist", fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1A1A1A)),
                  ),
                  const SizedBox(height: 12,),
                  SizedBox(
                    width: size.width*0.55,
                    child: const Text(
                      "Please wait... we are generating your mental health result based on your assessment",
                      style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF736B66),),textAlign: TextAlign.center,),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
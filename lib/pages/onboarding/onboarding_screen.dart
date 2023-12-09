import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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
                children: [
                  SizedBox(height: size.height*0.5,),
                  const Expanded(
                    child: Text(
                      "Embrace Serenity, Track Your Journey Within.",
                      style: TextStyle(fontFamily: "Urbanist", fontSize: 36, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A)),
                    )
                  ),
                  const SizedBox(height: 40,),
                  ElevatedButton(
                    onPressed: (){}, 
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Get Started"),
                         SizedBox(width: 10,),
                        Icon(Icons.arrow_forward_rounded,)
                      ],
                    )),
                  const SizedBox(height: 20,),
                  RichText(text: 
                  const TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C)),
                    children: [
                      TextSpan(
                        text: " Sign In",
                        style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFFFFCE5C)),
                      )
                    ]
                  ))
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
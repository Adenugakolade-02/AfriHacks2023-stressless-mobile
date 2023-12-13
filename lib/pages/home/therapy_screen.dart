import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TherapyPremiumScreen extends StatelessWidget {
  const TherapyPremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: SvgPicture.asset("assets/images/therapy background.svg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFE8E8E8).withOpacity(0.3),
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/images/logo.svg", height: 29, width: 46, fit: BoxFit.scaleDown,),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: size.width/1.5,
                      child: const Text("Meet a therapist that suits you best!", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF000000)),)),
                  ),
                  const SizedBox(height: 24,),
                  premiumFeatureWidget("Chat with a licensed and capable therapist "),
                  const SizedBox(height: 24,),
                  premiumFeatureWidget("24/7 live & full therapy session "),
                  const SizedBox(height: 24,),
                  premiumFeatureWidget("Unlimited conversations with your therapist "),
                  const SizedBox(height: 24,),
                  premiumFeatureWidget("Access to more than 7 days metric stats "),
                  const SizedBox(height: 32,),
                  const Divider(thickness: 1,),
                  const SizedBox(height: 32,),
                  const Text("\$4.99 / month", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF000000)),),
                  SizedBox(height: size.height*0.2,),
                  ElevatedButton(onPressed: (){}, child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Go Pro. Now!"),
                      const SizedBox(width: 8,),
                      SvgPicture.asset("assets/images/premium start.svg")
                    ],
                  )),
                ],
              ),
            )
          ],
      ),
    )
    );
  }

  Widget premiumFeatureWidget(String text){
    return Row(
      children: [
        SvgPicture.asset("assets/images/05 check round.svg", height: 18, width: 18, fit: BoxFit.scaleDown),
        const SizedBox(width: 8,),
        Text(text,style: const TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF000000)))
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MoodStatus extends StatelessWidget {
   MoodStatus({super.key});

  List<dynamic> moodDummmy = [
    ["Sun", "assets/images/Solid mood overjoyed.svg"],
    ["Mon", "assets/images/Solid mood happy_1.svg"],
    ["Tue", "assets/images/Solid mood happy_1.svg"],
    ["Wed", "assets/images/Solid mood depressed.svg"],
    ["Thu", "assets/images/Solid mood happy_1.svg"],
    ["Fri", "assets/images/Solid mood neutral.svg"],
    ["Sat", "assets/images/empty mood.svg"],
    
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: moodDummmy.map((e) => moodBar(e[1], e[0])).toList(),
        ),
      ),
    );
  }

  Widget moodBar(String svg, String dow){
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(svg, height: 38, width: 38, fit: BoxFit.scaleDown),
          const SizedBox(height: 2,),
          Text(dow, style: const TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF736B66)), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
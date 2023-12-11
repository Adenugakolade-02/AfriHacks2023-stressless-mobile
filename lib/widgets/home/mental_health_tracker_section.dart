import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/widgets/home/mental_log_pop_up.dart';

class MentalHealthTrackerSection extends StatelessWidget {
  const MentalHealthTrackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30,),
        const Text("Mental Health Metrics", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
        const SizedBox(height: 16,),
        const SizedBox(height: 16,),
        trackerCard("assets/images/Solid mood happy_1.svg", Color(0xFFFFCE5C), "Mood Tracker", "Your mood is always on the low during the week", (){
          showDialog(context: context, builder: (_){return MentalLogPopUp();});
        }),
        const SizedBox(height: 16,),
        trackerCard("assets/images/Solid stress.svg", const Color(0xFFC9A7FF), "Stress Level", "Level 3 - Normal", () => null),
        const SizedBox(height: 16,),
        trackerCard("assets/images/Solid sleep.svg", const Color(0xFF75DAFF), "Sleep Quality", "~ 4h Avg - Poor and Irregular", () => null),
      ],
    );
  }
  Widget trackerCard(String svg, Color svgColor,String title, String subTitle, Function() function ){
    return InkWell(
      onTap: function,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(blurRadius: 16, offset: Offset(0, 8), color: Color(0xFF4B3425).withOpacity(0.005))]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: svgColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: SvgPicture.asset(svg, color: svgColor, height: 24, width: 24, fit: BoxFit.scaleDown),
              ),
            ),
            const SizedBox(width: 8,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111111)),),
                const SizedBox(height: 4,),
                Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF111111)),),
              ],
            ),
            const Spacer(),
            SvgPicture.asset("assets/images/Monotone arrow right sm.svg", color: const Color(0xFF111111),)
          ],
        ),
      ),
    );
  }
}
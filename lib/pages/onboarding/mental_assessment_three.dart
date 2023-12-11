import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/widgets/onboarding/sleep_slider_widget.dart';

class MentalAssesssmentThree extends StatefulWidget {
  const MentalAssesssmentThree({super.key});

  @override
  State<MentalAssesssmentThree> createState() => _MentalAssesssmentThreeState();
}

class _MentalAssesssmentThreeState extends State<MentalAssesssmentThree> {
  int? selectedIntValue;
  List<dynamic> sleepList = [
    ["assets/images/Solid mood overjoyed.svg","Excellent","7-9 hours"],
    ["assets/images/Solid mood happy_1.svg","Good","6-7 hours"],
    ["assets/images/Solid mood neutral.svg","Fair","5 hours"],
    ["assets/images/Solid mood sad.svg","Poor","3-4 hours"],
    ["assets/images/Solid mood depressed.svg","Worst","< 3 hours"],
  ];
  @override
  Widget build(BuildContext context) {
     Size size  = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              topHeader(),
              const SizedBox(height: 32,),
              const Text("How would you rate your sleep quality?", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)), textAlign: TextAlign.center,),
              const SizedBox(height: 24,),
              ...List.generate(5, (index) => mentalAssstmentWidget(sleepList[index][0], sleepList[index][1], sleepList[index][2], index, selectedIntValue)),
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
              child: const Center(child:  Text("2 OF 5", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFF6991A),),)),
            ),
          )
        ],
      ),
    );
  }

  Widget mentalAssstmentWidget(String svg, String title, String subtitle, int value, int? groupValue){
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 1,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
        ),
        child: ListTile(
          leading: SvgPicture.asset(svg, height: 40, width: 40, fit: BoxFit.scaleDown,),
          title: Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C)),),
          subtitle: Row(
            children: [
              const Icon(Icons.alarm, color: Color(0xFFC9C7C5), size: 13,),
              const SizedBox(width: 4,),
              Text(subtitle, style: const TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w800, color: Color(0xFFC9C7C5)),)
            ],
          ),
          selectedTileColor: const Color(0xFFC9EBDF),
          tileColor: const Color(0xFFFFFFFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
          dense: true,
          visualDensity: const VisualDensity(vertical: 4),
          selected: groupValue == value,
          onTap: (){
            setState(() {
              selectedIntValue = value;
            });
          },
          trailing: Radio(
            value: value,
            groupValue: groupValue,
            onChanged: (_){
              setState(() {
                selectedIntValue = _;
              });
            },
            activeColor: const Color(0xFF4B4D4C),
          ),
        ),
      ),
    );
  }
}
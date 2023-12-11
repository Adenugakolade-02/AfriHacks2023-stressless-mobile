import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/utils/widget/custom_textfield.dart';

class MentalLogPopUp extends StatefulWidget {
  const MentalLogPopUp({super.key});

  @override
  State<MentalLogPopUp> createState() => _MentalLogPopUpState();
}

class _MentalLogPopUpState extends State<MentalLogPopUp> {
  int? selectedStressLevel;
  int? selectedMood;
  late TextEditingController controller;
  List<dynamic> trial = [
    ["Overjoyed","assets/images/Solid mood overjoyed.svg"],
    ["Happy","assets/images/Solid mood happy_1.svg"],
    ["Neutral","assets/images/Solid mood neutral.svg"],
    ["Sad","assets/images/Solid mood sad.svg"],
    ["Depressed","assets/images/Solid mood depressed.svg"],
   ];
  List<dynamic> stressInfo = [
    "You are great! No Stress at all",
    "You are really good",
    "You're good but you're tired",
    "You're stressed out",
    "You Are Exremely Stressed Out."
  ];
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: const Alignment(0, 0.5),
      child: Material(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),),
        color: Colors.transparent,
        child: Container(
          height: size.height/1.2,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              Center(
                child: SizedBox(height: 10, width: 36, child: Divider(thickness: 5, color: Colors.black,),),
              ),
              const SizedBox(height: 16,),
              const Text("Daily Mood Log", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) => moodLevelContainer(trial[index][1], trial[index][0], index, selectedMood)),
              ),
              const SizedBox(height: 24,),
              const Text("Current stress level", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) => stressLevelContainer(index+1, selectedStressLevel)),
              ),
              const SizedBox(height: 2,),
              Center(child: Text("${selectedStressLevel==null ? "" : stressInfo[selectedStressLevel!-1]}", style: const TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF4B4D4C)),)),
              const SizedBox(height: 24,),
              const Text("Mental Health Analysis", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
              const SizedBox(height: 16,),
              LongFormField(controller: controller),
              const SizedBox(height: 34,),
              ElevatedButton(onPressed: (){}, child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Log your mood"),
                  const SizedBox(width: 8,),
                  SvgPicture.asset("assets/images/Monotone arrow right sm.svg")
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget moodLevelContainer(String svg, String title, value, selectedValue){
    return InkWell(
      onTap: (){
        setState(() {
          selectedMood  = value;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: value==selectedValue? Color(0xFFC0A091): Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svg, height: 24, width: 24, fit: BoxFit.scaleDown, ),
            const SizedBox(height: 4,),
            Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF111111)),),
          ],
        )
        ),
      ),
    );
  }

  Widget stressLevelContainer(value, selectedValue){
    return InkWell(
      onTap: (){
        setState(() {
          selectedStressLevel  = value;
        });
      },
      child: Container(
        height: 51,
        width: 51,
        decoration: BoxDecoration(
          color: value==selectedValue? Color(0xFFC6FCDB): Colors.white,
          shape: BoxShape.circle,
          boxShadow: value==selectedValue? [BoxShadow(spreadRadius: 4,color: const Color(0xFFC6FCDB).withOpacity(0.4))] : null
        ),
      child: Center(child: Text("$value", style: TextStyle(fontFamily: "Urbanist", fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),),
      ),
    );
  }
}
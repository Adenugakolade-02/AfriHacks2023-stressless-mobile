import 'package:flutter/material.dart';

class MoodSliderWidget extends StatefulWidget {
  const MoodSliderWidget({super.key});

  @override
  State<MoodSliderWidget> createState() => _MoodSliderWidgetState();
}

class _MoodSliderWidgetState extends State<MoodSliderWidget> {
  late PageController pageController;
  int globalIndex = 0;

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.9, initialPage: 3);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget moodWidget(String title, svg, int index){
    return Column(
      children: [
        globalIndex==index ? Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C))) : Container(),
        const SizedBox(height: 16,),
        
      ],
    );
  }
}
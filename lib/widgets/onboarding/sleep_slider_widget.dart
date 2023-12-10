import 'package:flutter/material.dart';

class SleepSliderWidget extends StatefulWidget {
  const SleepSliderWidget({super.key});

  @override
  State<SleepSliderWidget> createState() => _SleepSliderWidgetState();
}

class _SleepSliderWidgetState extends State<SleepSliderWidget> {
  List<dynamic> trial = [
    ["Excellent","7-9 Hours","assets/images/Solid mood overjoyed.svg"],
    ["Good","6-7 Hours","assets/images/Solid mood happy_1.svg"],
    ["Fair","5 Hours","assets/images/Solid mood neutral.svg"],
    ["Poor","3-4 Hours","assets/images/Solid mood sad.svg"],
    ["Worst","<3 Hours","assets/images/Solid mood depressed.svg"],
  ];
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
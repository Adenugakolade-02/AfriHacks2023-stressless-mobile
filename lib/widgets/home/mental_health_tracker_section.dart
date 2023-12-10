import 'package:flutter/material.dart';

class MentalHealthTrackerSection extends StatelessWidget {
  const MentalHealthTrackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Mental Health Metrics", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
        const SizedBox(height: 16,),

      ],
    );
  }
  // Widget trackerCard(){

  // }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stressless/utils/date_formatter.dart';
import 'package:stressless/widgets/home/mental_health_metric_section.dart';
import 'package:stressless/widgets/home/mental_health_tracker_section.dart';
import 'package:stressless/widgets/home/mood_status.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                    boxShadow: [BoxShadow(blurRadius: 16,offset: const Offset(0, 8),color: const Color(0xFF4B3425).withOpacity(0.05))]
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      dateHeader(),
                      const SizedBox(height: 8,),
                      const Text("Hello Bolaji!", style: TextStyle(fontFamily: "Urbanist", fontSize: 30, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C))),
                      const Text("Welcome to your safe space", style: TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF736B66))),
                      const SizedBox(height: 16,),
                      MoodStatus()
                    ],
                  ),
                ),
                const SizedBox(height: 16,),
                MentalHealthMetricSection(),
                MentalHealthTrackerSection(),
                
              ],
            ),
          ),
        )
      ),
    );
  }

  Widget dateHeader(){
    return Row(
      children: [
        SvgPicture.asset("assets/images/44 calendar.svg"),
        const SizedBox(width: 12,),
        Text(formatDate(DateTime.now()), style: const TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF4B4D4C))),
      ],
    );
  }
}
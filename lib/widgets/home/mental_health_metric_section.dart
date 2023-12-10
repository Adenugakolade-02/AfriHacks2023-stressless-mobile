import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MentalHealthMetricSection extends StatelessWidget {
  const MentalHealthMetricSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Mental Health Metrics", style: TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
        const SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 170,
              width: size.width/2 -20,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFC6FCDB),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: [
                  const Row(
                    children: [
                      Icon(Icons.favorite,color: Color(0xFF111111), size: 14,),
                      const SizedBox(width: 4,),
                      Text("StressLess score", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF111111)))
                    ],
                  ),
                  const SizedBox(height: 12,),
                  Center(
                    child: Stack(
                      children: [
                        Center(
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: const CircularProgressIndicator(
                              color: const Color(0xFF111111),
                              backgroundColor: Color(0xFFAFAFAF),
                              value: 0.5,
                              strokeWidth: 5,
                            ),
                          ),
                        ),
                        Positioned(
                          right: size.width/5.5-5,
                          top: 38,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("50", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF000000)),),
                              Text("Healthy", style: TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF4B4D4C)),),
                            ],
                          )
                          )
                      ],
                    )
                  )
                ],
              )
            ),
            Container(
              height: 170,
              width: size.width/2 -20,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFFCE5C),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Row(
                    children: [
                      Icon(Icons.emoji_emotions,color:Color(0xFF111111), size: 14,),
                      Text("Mood", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF111111)))
                    ],
                  ),
                  const SizedBox(height: 6,),
                  const SizedBox(width: 4,),
                  Text("Mood", style: TextStyle(fontFamily: "Urbanist", fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF111111))),
                  const SizedBox(height: 6,),
                  SizedBox(
                    height: 110,
                    width: size.width/2,
                    child: chartTrial())
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 170,
              width: size.width/2 -20,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFB5DEED),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Row(
                    children: [
                      Icon(Icons.emoji_emotions,color:Color(0xFF111111), size: 14,),
                      const SizedBox(width: 4,),
                      Text("Sleep Quality", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF111111)))
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Text("Ireegular", style: TextStyle(fontFamily: "Urbanist", fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF111111))),
                  const SizedBox(height: 6,),
                  SizedBox(
                    height: 110,
                    width: size.width/2,
                    child: chartTrial())
                ],
              ),
            ),
            Container(
              height: 170,
              width: size.width/2 -20,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFE9DBFF),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const Row(
                    children: [
                      Icon(Icons.emoji_emotions,color:Color(0xFF111111), size: 14,),
                      const SizedBox(width: 4,),
                      Text("Stress Level", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF111111)))
                    ],
                  ),
                  const SizedBox(height: 6,),
                  Text("Very Stressed", style: TextStyle(fontFamily: "Urbanist", fontSize: 15, fontWeight: FontWeight.w700, color: Color(0xFF111111))),
                  const SizedBox(height: 6,),
                  SizedBox(
                    height: 110,
                    width: size.width/2,
                    child: lineTrial())
                ],
              ),
            )
          ],
        )
        // SizedBox(
        //   height: 200,
        //   width: 300,
        //   child: chartTrial(),
        // )
      ],
    );
  }
  Widget chartTrial(){
    return BarChart(BarChartData(
      gridData: const FlGridData(show: false),
      borderData: FlBorderData(show: false),
      titlesData: const FlTitlesData(
        show: false
      ),
      maxY: 5,
      minY: 0,
      // add bars
      barGroups: List.generate(14, (index) => BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: Random().nextInt(5).toDouble(),
            width: 5,
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xFF111111),
            // backDrawRodData: BackgroundBarChartRodData(
            //   show: true,
            //   toY: 5,
            //   color: const Color(0xFFAFAFAF)
            // )
          )
        ]
        ))
      ));
    }

    Widget lineTrial(){
      return LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
            show: false
          ),
          maxY: 5,
          minY: 0,
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(14, (index) => FlSpot(index.toDouble(),Random().nextInt(5).toDouble())),
              isCurved: true,
              dotData: const FlDotData(
                show: false
              ),
              color: const Color(0xFF1111111),
              barWidth: 4
            )
          ]
        )
      );
    }
  }



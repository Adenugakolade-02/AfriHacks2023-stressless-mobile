import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/utils/widget/custom_textfield.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC9EBDF),
      body: SafeArea(
        bottom: false,
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
                  headerAi(),
                  const SizedBox(height: 14,),
                  Expanded(
                    child: Container(
                    padding: EdgeInsets.only(left: 12),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: -60,
                          child: Container(
                            alignment: Alignment.topRight,
                            child: SvgPicture.asset("assets/images/therapy background.svg"),
                          ),
                        ),
                        // const SizedBox(height: 26,),
                        Column(
                          children: [
                            const SizedBox(height: 26,),
                            const Row(
                              children: [
                                Expanded(child: Divider()),
                                SizedBox(width: 4,),
                                Text("Today", style: TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF4B4D4C))),
                                SizedBox(width: 4,),
                                Expanded(child: Divider()),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  width: size.width*0.73,
                                  child: const KeyboardFormField()),
                                const SizedBox(width: 9,),
                                Container(
                                  height: 48,
                                  width: 48,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF111111)
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset("assets/images/enter.svg",height: 17, width: 17,fit: BoxFit.scaleDown,),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headerAi(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("StressLess AI", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF111111)),),
        const SizedBox(height: 4,),
        Row(
          
          children: [
            Container(
              height: 5,
              width: 5,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF6991A)
              ),
            ),
            const SizedBox(width: 4,),
            const Text("Always active", style: TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF111111)),),
          ],
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/locator.dart';
import 'package:stressless/pages/onboarding/onboarding_view_model.dart';
import 'package:stressless/utils/app_routes.dart';

class AiRecommendationScreen extends StatelessWidget {
  const AiRecommendationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingViewModel model = serviceLocator<OnboardingViewModel>();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC9EBDF),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Container(
                alignment: Alignment.topRight,
                child: SvgPicture.asset("assets/images/background.svg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  topHeader(),
                  const SizedBox(height: 16,),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only( topRight: const Radius.circular(40), topLeft: const Radius.circular(40))
                      ),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(height: 8,),
                                ...model.aiRecommendation.map((e) => RecommendedBar(index: model.aiRecommendation.indexOf(e)+1, title: e["topic"], rList: e["recommendation"]))
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 40,
                            right: 3,
                            child: Container(
                              height: 56,
                              width: size.width-40,
                              child: ElevatedButton(onPressed: ()=>AppRoute.go(AppRoute.homeScreen), child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Ready to Begin"),
                                  const SizedBox(width: 8,),
                                  SvgPicture.asset("assets/images/Monotone arrow right sm.svg")
                                ],
                              )),
                            )
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget topHeader(){
    return Row(
      children: [
        GestureDetector(
          onTap: ()=>AppRoute.pop(),
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
        const Text("AI Recommendations", style: TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
      ],
    );
  }
}

class RecommendedBar extends StatefulWidget {
  final int index;
  final String title;
  final List<String> rList;
  
  const RecommendedBar({super.key, required this.index, required this.title, required this.rList});

  @override
  State<RecommendedBar> createState() => _RecommendedBarState();
}

class _RecommendedBarState extends State<RecommendedBar> {
  bool showDetails =false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(blurRadius: 16, offset: const Offset(0, 8),color: const Color(0xFF4B3425).withOpacity(0.09))],
        border: showDetails ? Border.all(color: const Color(0xFFC6FCDB)) : null
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE8E8E8).withOpacity(0.3)
                ),
                child: Center(
                  child: SvgPicture.asset("assets/images/logo.svg", height: 13, width: 26, fit: BoxFit.scaleDown,),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 18,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1000),
                      color: const Color(0xFFF6991A,).withOpacity(0.2),
                    ),
                    child: Center(child:  Text("STEP ${widget.index}", style: const TextStyle(fontFamily: "Urbanist", fontSize: 8, fontWeight: FontWeight.w700, color: Color(0xFFF6991A),),)),
                  ),
                  const SizedBox(height: 4,),
                  Text(widget.title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF111111)),)
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  setState(() {
                    showDetails = !showDetails;
                  });
                },
                child: SvgPicture.asset( showDetails? "assets/images/arrow up.svg" :"assets/images/arrow drop down.svg", height: 12, width: 12, fit: BoxFit.scaleDown,),
              )
            ],
          ),
          Visibility(
            visible: showDetails,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6,),
                const Divider(color: Color(0xFFDADADA),),
                // const SizedBox(height: 12,),
                ...widget.rList.map((e) => rWidget(e)).toList()
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget rWidget(String recommendation){
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text("\u00B7  $recommendation", style: const TextStyle(fontFamily: "Urbanist", fontSize: 10, fontWeight: FontWeight.w500, color: Color(0xFF111111)),),
    );
  }
}
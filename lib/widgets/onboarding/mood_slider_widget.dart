import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stressless/locator.dart';
import 'package:stressless/pages/onboarding/onboarding_view_model.dart';

class MoodSliderWidget extends StatefulWidget {
  const MoodSliderWidget({super.key});

  @override
  State<MoodSliderWidget> createState() => _MoodSliderWidgetState();
}

class _MoodSliderWidgetState extends State<MoodSliderWidget> {
  final OnboardingViewModel model = serviceLocator<OnboardingViewModel>();
  late PageController pageController;
  // int globalIndex = 0;
   List<dynamic> trial = [
    ["Overjoyed","assets/images/Solid mood overjoyed.svg"],
    ["Happy","assets/images/Solid mood happy_1.svg"],
    ["Neutral","assets/images/Solid mood neutral.svg"],
    ["Sad","assets/images/Solid mood sad.svg"],
    ["Depressed","assets/images/Solid mood depressed.svg"],
   ];

  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.27, initialPage: 3);
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Consumer<OnboardingViewModel>(
      builder: (_,model,__) {
        return SizedBox(
          height: size.width/2,
          width: double.infinity,
          
          child: PageView.builder(
            itemCount: 5,
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: model.selectMoodValue,
            itemBuilder: (_,index){
              return moodWidget(trial[index][0], trial[index][1], index);
            }
          ),
        );
      }
    );
  }

  Widget moodWidget(String title, svg, int index){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        model.selectedMoodValue ==index ? Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 20, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C))) : Container(),
        const SizedBox(height: 16,),
        model.selectedMoodValue==index ? SizedBox(height: 112, width: 112,child: SvgPicture.asset(svg, fit: BoxFit.cover,),): SizedBox(height: 67, width: 67,child: SvgPicture.asset(svg, fit: BoxFit.scaleDown,),)
      ],
    );
  }
}
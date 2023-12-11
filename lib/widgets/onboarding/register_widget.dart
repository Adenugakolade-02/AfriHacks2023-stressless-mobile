import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/locator.dart';
import 'package:stressless/pages/onboarding/onboarding_view_model.dart';
import 'package:stressless/utils/widget/custom_textfield.dart';

class RegisterSection extends StatefulWidget {
  const RegisterSection({super.key});

  @override
  State<RegisterSection> createState() => _RegisterSectionState();
}

class _RegisterSectionState extends State<RegisterSection> {
  final OnboardingViewModel model = serviceLocator<OnboardingViewModel>();
  @override
  void initState() {
    model.usernameController = TextEditingController();
    model.rEmailController = TextEditingController();
    model.rPasswordController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    model.usernameController.dispose();
    model.rEmailController.dispose();
    model.rPasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kTextFormField(title: "Username", prefixIcon: SvgPicture.asset("assets/images/Duotone person.svg"), controller: model.usernameController,),
        const SizedBox(height: 24,),
        kTextFormField(title: "Email Address", prefixIcon: SvgPicture.asset("assets/images/Duotone email.svg"), controller: model.rEmailController,),
        const SizedBox(height: 24,),
        kTextFormField(title: "Password", prefixIcon: SvgPicture.asset("assets/images/Monotone lock.svg"), controller: model.rPasswordController,isPassword: true,),
        SizedBox(height: size.height * 0.2,),
        ElevatedButton(onPressed: (){}, child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Register"),
            const SizedBox(width: 8,),
            SvgPicture.asset("assets/images/Monotone arrow right sm.svg")
          ],
        ))
      ],
    );
  }
}
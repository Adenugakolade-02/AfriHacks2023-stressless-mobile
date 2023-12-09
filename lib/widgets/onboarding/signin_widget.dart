import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/utils/widget/custom_textfield.dart';

class SigninSection extends StatelessWidget {
  const SigninSection({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        kTextFormField(title: "Email Address", prefixIcon: SvgPicture.asset("assets/images/Duotone email.svg"), controller: TextEditingController(),),
        const SizedBox(height: 24,),
        kTextFormField(title: "Password", prefixIcon: SvgPicture.asset("assets/images/Monotone lock.svg"), controller: TextEditingController(),isPassword: true,),
        const SizedBox(height: 8,),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: (){}, child: const Text("Forgot Password")),
        ),
        SizedBox(height: size.height * 0.25,),
        ElevatedButton(onPressed: (){}, child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sign In"),
            const SizedBox(width: 8,),
            SvgPicture.asset("assets/images/Monotone arrow right sm.svg")
          ],
        ))
      ],
    );
  }
}
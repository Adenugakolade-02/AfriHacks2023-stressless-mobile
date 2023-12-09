import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/widgets/onboarding/register_widget.dart';
import 'package:stressless/widgets/onboarding/signin_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isSign = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFC9EBDF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height*0.1,),
            SizedBox(child: SvgPicture.asset("assets/images/logo.svg")),
            const SizedBox(height: 10,),
            const Text("Sign In To StressLess", style: TextStyle(fontFamily: "Urbanist", fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)),),
            const SizedBox(height: 25,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 36,),
                        toggleAuthentication(),
                        const SizedBox(height: 55,),
                        isSign ? const SigninSection() : const RegisterSection()
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget toggleAuthentication(){
    return Container(
      height: 52,
      width: 342,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE4E4E4),
        borderRadius: BorderRadius.circular(1000)
      ),
      child: Row(
        children: [
          isSign? selectedContainer("Sign in") : GestureDetector(
            onTap: (){setState(() {
              isSign = true;
            });},
            child: const Padding(
              padding:  EdgeInsets.only(left: 25),
              child: Text("Sign In", style:  TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFFFFFFFF)),),
            ),
          ),

          const Spacer(),

          !isSign? selectedContainer("Register") : GestureDetector(
            onTap: (){setState(() {
              isSign = false;
            });},
            child: const Padding(
              padding:  EdgeInsets.only(right: 25),
              child:  Text("Register", style:  TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFFFFFFFF)),),
            ),
          ),
        ],
      ),
    );
  }
  Widget selectedContainer(String title,){
    return  Container(
      height: 44,
      width: 147,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(1000)
      ),
      child: Center(child: Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 16, fontWeight: FontWeight.w800, color: Color(0xFF4B4D4C)))),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stressless/pages/home/home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        shadowColor: const Color(0xFF4B3425).withOpacity(0.05),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: currentPageIndex,

        destinations: <Widget>[
          NavigationDestination(
          selectedIcon: selectedHomeIcon("assets/images/home home.svg", "Home"),
          icon: homeIcon("assets/images/home home.svg"),
          label: "Home"
          ),
          NavigationDestination(
          selectedIcon: selectedHomeIcon("assets/images/home chat.svg", "Chatbot"),
          icon: homeIcon("assets/images/home chat.svg"),
          label: "Chatbot"
          ),
          NavigationDestination(
          selectedIcon: selectedHomeIcon("assets/images/home therapy.svg", "Therapy"),
          icon: homeIcon("assets/images/home therapy.svg"),
          label: "Therapy"
          ),
          NavigationDestination(
          selectedIcon: selectedHomeIcon("assets/images/home profile.svg", "Profile"),
          icon: homeIcon("assets/images/home profile.svg"),
          label: "Profile"
          ),
        ],
      ),
      body: <Widget>[
        const HomeScreen(),
        Container(
          alignment: Alignment.center,
          child: const Text('Chatbot'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Therapy'),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Profile'),
        ),
      ][currentPageIndex],
    );
  }

  Widget selectedHomeIcon(String svg, String title){
    return Container(
      height: 44,
      width: 118,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svg, height: 24, width: 24, fit: BoxFit.scaleDown, color: Colors.white,),
          // const Spacer(),
          const SizedBox(width: 5,),
          Text(title, style: const TextStyle(fontFamily: "Urbanist", fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),)
        ],
      ),
    );
  }
  Widget homeIcon(String svg){
    return SvgPicture.asset(svg, height: 24, width: 24, fit: BoxFit.scaleDown,);
  }
}
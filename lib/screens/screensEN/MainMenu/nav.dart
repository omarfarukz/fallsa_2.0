import 'package:flutter/material.dart';

import '../Guideline/guideline_screen.dart';
import '../PersonalDetails/personal_details_screen.dart';
import 'menue_screen.dart';

class NavScreen extends StatefulWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  _NavScreen createState() => _NavScreen();
}

class _NavScreen extends State<NavScreen> {
  int _currrentIndex = 1;
  final pages = [
    GuidelineScreen(),
    MenuScreen(),
    PersonalDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        backgroundColor: Colors.green[400],
        currentIndex: _currrentIndex,
        onTap: (index) => setState(() => _currrentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.integration_instructions, color: Colors.black),
            label: "Instruction",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Main Menu"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: "Profile"),
        ],
      ),
    );
  }
}

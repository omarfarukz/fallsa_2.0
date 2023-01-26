import 'package:fallsa/screens/screensBM/Guideline/guideline_screen.dart';
import 'package:fallsa/screens/screensEN/PersonalDetails/personal_details_screen.dart';
import 'package:flutter/material.dart';

import 'menue_screen.dart';

class NavScreenBM extends StatefulWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  _NavScreen createState() => _NavScreen();
}

class _NavScreen extends State<NavScreenBM> {
  int _currrentIndex = 1;
  final pages = [
    GuidelineScreenBM(),
    MenuScreenBM(),
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
            label: "Arahan",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Menu Utama"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: "Profil"),
        ],
      ),
    );
  }
}

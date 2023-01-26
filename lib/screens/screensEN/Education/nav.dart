import 'package:flutter/material.dart';

import '../MainMenu/menue_screen.dart';
import 'education_video_screen_first.dart';

class NavEducationScreen extends StatefulWidget {
  //const MainScreen({ Key? key }) : super(key: key);

  @override
  _NavEducationScreen createState() => _NavEducationScreen();
}

class _NavEducationScreen extends State<NavEducationScreen> {
  int _currrentIndex = 0;
  final pages = [
    EducationVideoScreenFirst(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: pages[_currrentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lightGreen[900],
        backgroundColor: Colors.lightGreen[50],
        currentIndex: _currrentIndex,
        onTap: (index) => setState(() => _currrentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cast_for_education_sharp),
            label: 'Education',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}

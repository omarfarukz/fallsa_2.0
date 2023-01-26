import 'package:flutter/material.dart';
import '../MainMenu/body.dart';

class MenuScreenBM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      // appBar: AppBar(
      //   elevation: 0.0,
      //   leading: BackButton(color: Colors.blue[900]),
      //   backgroundColor: Colors.lightBlue[700],
      // ),
      body: BodyBM(),
    );
  }
}

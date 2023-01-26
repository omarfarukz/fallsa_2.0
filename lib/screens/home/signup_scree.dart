import 'package:fallsa/screens/home/signup/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          'FallSA SignUp',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 33,
            color: Colors.black,
          ),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.green[400],
      ),
      body: Body(),
    );
  }
}

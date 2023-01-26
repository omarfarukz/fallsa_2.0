
import 'package:fallsa/screens/screensEN/FallRiskTest/components/background.dart';
import 'package:flutter/material.dart';

import 'fallRIskVideo.dart';

class FirstQuestion extends StatefulWidget {
  @override
  _FirstQuestionState createState() => _FirstQuestionState();
}

class _FirstQuestionState extends State<FirstQuestion> {
  late int walkingAid;
  @override
  Widget build(BuildContext context) {
    // final _formKey = useMemoized(() => GlobalKey<FormState>());
    // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            // key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.25),
                Image.asset(
                  "assets/progressbar/one.png",
                  width: 160,
                ),
                SizedBox(height: size.height * 0.01),
                const Text(
                  "Are you using a walking aid?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.05),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                      child: Text("Yes".toUpperCase(),
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.fromLTRB(65, 15, 65, 15)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.green[400]!,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                        color: Colors.green[800]!,
                                      )))),
                      onPressed: () {
                        setState(() {
                          walkingAid = 2;
                        });

                        Future.delayed(Duration(milliseconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FallRiskVideo(
                                walkingAid: walkingAid,
                              ),
                            ),
                          );
                        });
                      }),
                  SizedBox(width: 10),
                  TextButton(
                      child: Text("No".toUpperCase(),
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.fromLTRB(65, 15, 65, 15)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red[400]!),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side:
                                          BorderSide(color: Colors.red[800]!)))),
                      onPressed: () {
                        setState(() {
                          walkingAid = 0;
                        });
                        Future.delayed(Duration(milliseconds: 2), () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FallRiskVideo(
                                walkingAid: walkingAid,
                              ),
                            ),
                          );
                        });
                      })
                ]),
                SizedBox(height: size.height * 0.319),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

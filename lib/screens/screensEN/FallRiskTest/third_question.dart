import 'package:fallsa/screens/screensEN/FallRiskTest/components/background.dart';
import 'package:flutter/material.dart';

import 'fourth_question.dart';

class ThirdQuestion extends StatefulWidget {
  final double firstAttemp;
  final double seceondAttemp;
  final int walkingAid;
  final int worriedOfFall;

  const ThirdQuestion(
      {Key? key,
      required this.firstAttemp,
      required this.seceondAttemp,
      required this.worriedOfFall,
      required this.walkingAid})
      : super(key: key);
  @override
  _ThirdQuestionState createState() => _ThirdQuestionState();
}

class _ThirdQuestionState extends State<ThirdQuestion> {
  late int histryOfFall;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Background(
          child: SingleChildScrollView(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 60, 0, 0),
            child: Image.asset(
              "assets/progressbar/seventy.png",
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Have you had a fall in the past 18 months?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: size.height * 0.02),
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Colors.green[800]!,
                            )))),
                onPressed: () {
                  histryOfFall = 2;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FourthQuestion(
                        walkingAid: widget.walkingAid,
                        worriedofFall: widget.worriedOfFall,
                        historyOfFall: histryOfFall,
                        fristAttamp: widget.firstAttemp,
                        secondAttamp: widget.seceondAttemp,
                      ),
                    ),
                  );
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
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red[800]!)))),
                onPressed: () {
                  histryOfFall = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FourthQuestion(
                        walkingAid: widget.walkingAid,
                        worriedofFall: widget.worriedOfFall,
                        historyOfFall: histryOfFall,
                        fristAttamp: widget.firstAttemp,
                        secondAttamp: widget.seceondAttemp,
                      ),
                    ),
                  );
                })
          ]),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(2),
            child: const Text(
              "* A fall is an event which results in a person coming to rest accidentally on the ground or floor or other lower level (WHO, 2016).",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: size.height * 0.2),
        ],
      ))),
    );
  }
}

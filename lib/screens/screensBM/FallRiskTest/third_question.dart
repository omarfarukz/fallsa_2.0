import 'package:fallsa/screens/screensBM/FallRiskTest/components/background.dart';
import 'package:flutter/material.dart';
import 'package:fallsa/screens/Login/login_screen.dart';

import 'components/No Need/third_question_body.dart';
import 'fourth_question.dart';

class ThirdQuestionBM extends StatefulWidget {
  final double firstAttemp;
  final double seceondAttemp;
  final int walkingAid;
  final int worriedOfFall;

  const ThirdQuestionBM(
      {Key? key,
      required this.firstAttemp,
      required this.seceondAttemp,
      required this.worriedOfFall,
      required this.walkingAid})
      : super(key: key);
  @override
  _ThirdQuestionState createState() => _ThirdQuestionState();
}

class _ThirdQuestionState extends State<ThirdQuestionBM> {
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
              width: 190,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "Adakah anda pernah jatuh dalam tempoh 18 bulan yang lepas?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                child: Text("YA".toUpperCase(),
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
                      builder: (context) => FourthQuestionBM(
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
                child: Text("TIDAK".toUpperCase(),
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
                      builder: (context) => FourthQuestionBM(
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
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.all(2),
            child: const Text(
              "* Jatuh adalah sebarang kejadian yang mengakibatkan perubahan posisi badan individu secara tidak sengaja ke atas lantai atau tahap yang lebih rendah, (WHO, 2016)",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
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

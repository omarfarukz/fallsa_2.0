import 'package:fallsa/screens/screensBM/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/screensBM/FallRiskTest/third_question.dart';
import 'package:flutter/material.dart';

class SecondQuestionBM extends StatefulWidget {
  final double fristAttamp;
  final double secondAttamp;
  final int walkingAid;

  const SecondQuestionBM({
    required this.fristAttamp,
    required this.secondAttamp,
    required this.walkingAid,
  });

  @override
  _SecondQuestionState createState() => _SecondQuestionState();
}

class _SecondQuestionState extends State<SecondQuestionBM> {
  late int worriedOfFall;
  @override
  Widget build(BuildContext context) {
    double firstAttemp = widget.fristAttamp;
    double secondAttemp = widget.secondAttamp;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.15),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 60, 0, 0),
                child: Image.asset(
                  "assets/progressbar/sixty.png",
                  width: 200,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              const Text(
                "Adakah anda rasa bimbang untuk jatuh?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.05),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                    child: Text("Ya".toUpperCase(),
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
                      worriedOfFall = 2;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdQuestionBM(
                            firstAttemp: widget.fristAttamp,
                            seceondAttemp: widget.secondAttamp,
                            worriedOfFall: worriedOfFall,
                            walkingAid: widget.walkingAid,
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        BorderSide(color: Colors.red[800]!)))),
                    onPressed: () {
                      worriedOfFall = 0;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdQuestionBM(
                            firstAttemp: firstAttemp,
                            seceondAttemp: secondAttemp,
                            worriedOfFall: worriedOfFall,
                            walkingAid: widget.walkingAid,
                          ),
                        ),
                      );
                    }),
              ]),
              SizedBox(height: 520),
            ],
          ),
        ),
      ),
    );
  }
}

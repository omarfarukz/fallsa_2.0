import 'package:fallsa/screens/screensEN/FallRiskTest/components/background.dart';
import 'package:flutter/material.dart';
import 'fifth_question.dart';

class FourthQuestion extends StatefulWidget {
  final double fristAttamp;
  final double secondAttamp;
  final int walkingAid;
  final int historyOfFall;
  final int worriedofFall;
  const FourthQuestion({
    required this.fristAttamp,
    required this.secondAttamp,
    required this.walkingAid,
    required this.worriedofFall,
    required this.historyOfFall,
  });
  @override
  _FourthQuestionState createState() => _FourthQuestionState();
}

class _FourthQuestionState extends State<FourthQuestion> {
  late int jointPain;
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
          SizedBox(height: size.height * 0.15),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Image.asset(
              "assets/progressbar/eighty.png",
              width: 150,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          const Text(
            "Do you have joint pain?",
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
                  jointPain = 2;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FifthQuestion(
                        walkingAid: widget.walkingAid,
                        fristAttamp: widget.fristAttamp,
                        secondAttamp: widget.secondAttamp,
                        worriedOfFall: widget.worriedofFall,
                        historyOfFall: widget.historyOfFall,
                        jointPain: jointPain,
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
                  jointPain = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FifthQuestion(
                        walkingAid: widget.walkingAid,
                        fristAttamp: widget.fristAttamp,
                        secondAttamp: widget.secondAttamp,
                        worriedOfFall: widget.worriedofFall,
                        historyOfFall: widget.historyOfFall,
                        jointPain: jointPain,
                      ),
                    ),
                  );
                })
          ]),
          SizedBox(height: size.height * 0.4),
        ],
      ))),
    );
  }
}

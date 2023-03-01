import 'package:fallsa/screens/screensEN/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/screensEN/FallRiskTest/report.dart';
import 'package:flutter/material.dart';

class FifthQuestion extends StatefulWidget {
  final int walkingAid;
  final double fristAttamp;
  final double secondAttamp;
  final int worriedOfFall;
  final int historyOfFall;
  final int jointPain;
  const FifthQuestion({
    required this.walkingAid,
    required this.fristAttamp,
    required this.secondAttamp,
    required this.worriedOfFall,
    required this.historyOfFall,
    required this.jointPain,
  });

  @override
  _FifthQuestionState createState() => _FifthQuestionState();
}

class _FifthQuestionState extends State<FifthQuestion> {
  late int glaucoma;
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
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Image.asset(
              "assets/progressbar/ninety.png",
              width: 150,
            ),
          ),
          SizedBox(height: size.height * 0.01),
          const Text(
            "Do you have a cataract or glaucoma?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
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
                  glaucoma = 2;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Report(
                        fristAttamp: widget.fristAttamp,
                        secondAttamp: widget.secondAttamp,
                        walkingAid: widget.walkingAid,
                        historyOfFall: widget.historyOfFall,
                        jointPain: widget.jointPain,
                        glaucoma: glaucoma,
                        worriedOfFall: widget.worriedOfFall,
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
                  glaucoma = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Report(
                        fristAttamp: widget.fristAttamp,
                        secondAttamp: widget.secondAttamp,
                        walkingAid: widget.walkingAid,
                        worriedOfFall: widget.worriedOfFall,
                        historyOfFall: widget.historyOfFall,
                        jointPain: widget.jointPain,
                        glaucoma: glaucoma,
                      ),
                    ),
                  );
                })
          ]),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "* Cataract is clouding of the lens in the eye that affects vision (National Eye Institute, 2015).",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "* Glaucoma is a group of diseases that damage eye's optic nerve and can result in vision loss and blindess (National Eye Institute, 2016).",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
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

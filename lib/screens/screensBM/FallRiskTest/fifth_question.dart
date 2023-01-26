import 'package:fallsa/screens/screensBM/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/screensBM/FallRiskTest/report.dart';
import 'package:flutter/material.dart';

class FifthQuestionBM extends StatefulWidget {
  final int walkingAid;
  final double fristAttamp;
  final double secondAttamp;
  final int worriedOfFall;
  final int historyOfFall;
  final int jointPain;
  const FifthQuestionBM({
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

class _FifthQuestionState extends State<FifthQuestionBM> {
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
            "Adakah anda mempunyai katarak atau glaukoma?",
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
                  glaucoma = 2;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportBM(
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
                  glaucoma = 0;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReportBM(
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
              "* Katarak adalah kekaburan kanta dalam mata yang menjejaskan penglihatan (National Eye Institute, 2015).",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "* Glaukoma adalah sekumpulan penyakit yang merosakkan saraf optik mata dan boleh menyebabkan kehilangan penglihatan dan buta (National Eye Institute, 2016).",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
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

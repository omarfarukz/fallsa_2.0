import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/screensBM/FallRiskTest/second_question.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screensEN/FallRiskTest/components/rounded_button_timer.dart';

class ElapsedTime {
  final int hundreds;
  final int seconds;
  final int minutes;

  ElapsedTime({
    required this.hundreds,
    required this.seconds,
    required this.minutes,
  });
}

class Dependencies {
  final List<ValueChanged<ElapsedTime>> timerListeners =
      <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(
      fontSize: 50.0, fontFamily: "Bebas Neue", color: Colors.black);
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 30;
}

class TestResultBM extends StatefulWidget {
  final double fristAttamp;
  final double secondAttamp;
  final int walkingAid;
  TestResultBM({
    required this.fristAttamp,
    required this.secondAttamp,
    required this.walkingAid,
  });

  TimerPageState createState() => new TimerPageState();
}

class TimerPageState extends State<TestResultBM> {
  String gender = '';
  int currentAge = 0;
  String dob = "";
  String uid = '';
  int finalScore = 0;
  String riskStatus = "";
  final Dependencies dependencies = new Dependencies();

  void leftButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        print("${dependencies.stopwatch.elapsedMilliseconds}");
      } else {
        dependencies.stopwatch.reset();
      }
    });
  }

  void rightButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        dependencies.stopwatch.stop();
      } else {
        dependencies.stopwatch.start();
      }
    });
  }

  Widget floatingActionButtonRound(String text, VoidCallback callback) {
    TextStyle roundTextStyle = const TextStyle(
        fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold);
    dependencies.stopwatch.isRunning ? text = 'stop' : text = 'start';
    return new IconButton(
      // child: new Text(text, style: roundTextStyle),
      icon: Image.asset("assets/images/" + text + ".png"),
      iconSize: 110,
      onPressed: callback,
    );
  }

  Widget floatingActionButtonFlat(String text, VoidCallback callback) {
    dependencies.stopwatch.isRunning ? text = 'Reset' : text = 'Reset';
    TextStyle roundTextStyle = const TextStyle(
        fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold);
    return new ElevatedButton(
      child: new Text(text, style: roundTextStyle),
      onPressed: callback,
      style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(150),
          ),
          primary: Colors.red,
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  Future getUID() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainUID = sharedPreferences.getString("uid");
    setState(() {
      uid = obtainUID!;
      print("Here is the UID : $uid");
    });
  }

  Future readGender() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('userDetails')
        .doc(user!.uid); //reading the current user uid
    print(documentReference);
    await documentReference.get().then((value) {
      final data = value;

      setState(() {
        gender = data['gander'];
        print("The Gender is :" + gender);
        dob = data['dob'];
        print("The DOB is :" + dob.toString());
        String birthyear1 = '${dob[0]}';
        String birthyear2 = '${dob[1]}';
        String birthyear = '19' + birthyear1 + birthyear2;
        int i = int.parse(birthyear);

        final DateTime now = DateTime.now();
        final DateFormat formatter = DateFormat('yyyy');
        final String formatted = formatter.format(now);
        int currentYear = int.parse(formatted);
        currentAge = currentYear - i;

        print(currentAge);
        print(i);
      });
    });
  }

  @override
  void initState() {
    getUID();
    readGender();
    // uploadData();

    CollectionReference fallRisk =
        FirebaseFirestore.instance.collection('fallRisk');
    super.initState();
  }

  // uploadData() async {
  //   final SharedPreferences sharedPreferences =
  //   await SharedPreferences.getInstance();
  //   CollectionReference fallRisk =
  //   FirebaseFirestore.instance.collection('fallRisk');
  //   setState(() {
  //     final ic = sharedPreferences.getString("ic");
  //     final name = sharedPreferences.getString("name");
  //
  //     Future.delayed(Duration(seconds: 2), () {
  //       fallRisk.doc().set({
  //         'dUid': "Not assign yet",
  //         'dateTime': DateTime.now(),
  //         'ic': ic.toString(),
  //         'name': name.toString(),
  //         'uid': uid.toString(),
  //         'score': finalScore,
  //         'risk': riskStatus.toString(),
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double fristAttamp = widget.fristAttamp;
    double secondAttamp = widget.secondAttamp;
    double avarage = (fristAttamp + secondAttamp) / 2;
    String risk = "";

    if (avarage >= 6) {
      risk = "Risk";
    } else {
      risk = "Low Risk";
    }
    setState(() {
      finalScore = avarage.toInt();
      riskStatus = risk;
    });
    late double x_axis;
    if (currentAge < 60) {
      x_axis = 320;
    } else if (currentAge >= 60 && currentAge <= 64) {
      x_axis = 290;
    } else if (currentAge >= 65 && currentAge <= 69) {
      x_axis = 225;
    } else if (currentAge >= 70 && currentAge <= 74) {
      x_axis = 160;
    } else if (currentAge >= 75 && currentAge <= 79) {
      x_axis = 95;
    } else if (currentAge >= 80) {
      x_axis = 30;
    }
    late double y_axis;
    String dotColor = "green";
    if (avarage <= 0) {
      y_axis = 30;
    } else if (avarage > 0 && avarage <= 2) {
      y_axis = 44;
    } else if (avarage > 2 && avarage <= 4) {
      y_axis = 64;
    } else if (avarage > 4 && avarage <= 6) {
      y_axis = 84;
    } else if (avarage > 6 && avarage <= 8) {
      y_axis = 107;
    } else if (avarage > 8 && avarage <= 10) {
      y_axis = 129;
    } else if (avarage > 10 && avarage <= 12) {
      y_axis = 150;
    } else if (avarage > 12 && avarage <= 14) {
      y_axis = 172;
    } else if (avarage > 14 && avarage <= 16) {
      y_axis = 192;
    } else if (avarage > 16) {
      y_axis = 202;
    }
    late String graph;
    int gend = 0;
    if (gender == 'Male') {
      setState(() {
        graph = 'lelaki';
        gend = 0;
      });
    } else if (gender == 'Female') {
      setState(() {
        graph = 'perempuan';
        gend = 1;
      });
    }
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Laporan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset(
                    "assets/progressbar/fifty.png",
                    width: 130,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Skor TUG: ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(120, 20, 120, 0),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 35.0, right: 35.0),
                  labelText: "$avarage",
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 10.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(7.0),
              // child: Text(
              //   '*Caution! You have a Falls Risk. Please consult your physiotherapist as soon as possible for further assessment and management.',
              //   style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.black,
              //   ),
              //   textAlign: TextAlign.justify,
              // ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Keputusan ujian',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Center(
                  child: Text(
                    ' Timed Up and Go anda',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                        fontStyle: FontStyle.italic),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                'berbanding dengan norma populasi.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            SizedBox(height: 15),

            Container(
                constraints: new BoxConstraints.expand(
                  height: 250.0,
                ),
                padding: new EdgeInsets.only(left: 10, bottom: 10, right: 10),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image:
                        new AssetImage('assets/images/sample_graph$graph.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: new Stack(
                  children: <Widget>[
                    new Positioned(
                      right: x_axis,
                      bottom: y_axis,
                      child: new Icon(
                        Icons.circle,
                        size: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 40),
            RoundedButtonTimer(
              text: "Seterusnya",
              press: () {
                double secondAttamp =
                    dependencies.stopwatch.elapsed.inSeconds.toDouble();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SecondQuestionBM(
                        fristAttamp: widget.fristAttamp,
                        secondAttamp: secondAttamp,
                        walkingAid: widget.walkingAid,
                      );
                    },
                  ),
                );
              },
            ),

            // Image.asset(
            //   "assets/images/sample_graph$graph.png",
            // ),
          ],
        ),
      ),
    );
  }
}

class TimerText extends StatefulWidget {
  TimerText({required this.dependencies});
  final Dependencies dependencies;

  TimerTextState createState() =>
      new TimerTextState(dependencies: dependencies);
}

class TimerTextState extends State<TimerText> {
  TimerTextState({required this.dependencies});
  final Dependencies dependencies;
  late Timer timer;
  late int milliseconds;

  @override
  void dispose() {
    timer.cancel();
    timer == null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new RepaintBoundary(
          child: new SizedBox(
            height: 72.0,
            child: new MinutesAndSeconds(dependencies: dependencies),
          ),
        ),
        new RepaintBoundary(
          child: new SizedBox(
            height: 72.0,
            child: new Hundreds(dependencies: dependencies),
          ),
        ),
      ],
    );
  }
}

class MinutesAndSeconds extends StatefulWidget {
  MinutesAndSeconds({required this.dependencies});
  final Dependencies dependencies;

  MinutesAndSecondsState createState() =>
      new MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({required this.dependencies});
  final Dependencies dependencies;

  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.minutes != minutes || elapsed.seconds != seconds) {
      setState(() {
        minutes = elapsed.minutes;
        seconds = elapsed.seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return new Text('$minutesStr:$secondsStr.', style: dependencies.textStyle);
  }
}

class Hundreds extends StatefulWidget {
  Hundreds({required this.dependencies});
  final Dependencies dependencies;

  HundredsState createState() => new HundredsState(dependencies: dependencies);
}

class HundredsState extends State<Hundreds> {
  HundredsState({required this.dependencies});
  final Dependencies dependencies;

  int hundreds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.hundreds != hundreds) {
      setState(() {
        hundreds = elapsed.hundreds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    return new Text(hundredsStr, style: dependencies.textStyle);
  }
}

import 'dart:async';
import 'package:fallsa/screens/screensEN/StrengthTest/report_strength_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MainMenu/nav.dart';

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

class ReportST extends StatefulWidget {
  final score;

  ReportST({this.score});

  ReportState createState() => new ReportState();
}

class ReportState extends State<ReportST> {
  int _selectedIndex = 0;
  String gender = '';
  int currentAge = 0;
  String uid = '';
  String name = '';
  String ic = '';
  String dob = "";
  int finalScore = 0;
  String dUid = '';

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];
  void _onItemTapped(int index) {
    if (_selectedIndex == 0) {
      setState(() {
        _selectedIndex = index;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => NavScreen(),
        ),
      );
    }
  }

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
    var obtainName = sharedPreferences.getString("name");
    var obtainIc = sharedPreferences.getString("ic");

    setState(() {
      uid = obtainUID!;
      name = obtainName!;
      ic = obtainIc!;

      print("Here is the UID : $uid");
    });
  }

  readGender() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('userDetails')
          .doc(user!.uid); //"a6Zto5xnPcP5WE6yLHzcRq4i9Qn1"
      print(documentReference);
      await documentReference.get().then((value) {
        final data = value;

        setState(() {
          print("The Gender is : ${data['gander']}");
          gender = data['gander'];
        });
      });
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Wrong $error")));
    }
  }

//need modify
  readAge() async {
    try {
      User? user = await FirebaseAuth.instance.currentUser;
      DocumentReference documentReference = await FirebaseFirestore.instance
          .collection('userDetails')
          .doc(user!.uid);
      print(documentReference);
      documentReference.get().then((value) {
        final data = value;

        setState(() {
          print("Your Update DOB:${data['dob']}");
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

          print("CurrentAge" + currentAge.toString());
          print(i);
        });
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Something Wrong with age: $error")));
    }
  }

  saveData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    CollectionReference fallRisk =
        FirebaseFirestore.instance.collection('strength');
    setState(() {
      final ic = sharedPreferences.getString("ic");
      final name = sharedPreferences.getString("name");

      Future.delayed(Duration(seconds: 2), () {
        fallRisk.doc().set({
          'dUid': dUid,
          'dateTime': DateTime.now(),
          'ic': ic.toString(),
          'name': name.toString(),
          'uid': uid.toString(),
          'score': finalScore,
        });
      });
    });
  }

  readdUid() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('userDetails')
          .doc(user!.uid); //"a6Zto5xnPcP5WE6yLHzcRq4i9Qn1"
      print(documentReference);
      await documentReference.get().then((value) {
        final data = value;

        setState(() {
          print("The Doctor id is : ${data['dUid']}");
          dUid = data['dUid'];
        });
      });
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Wrong $error")));
    }
  }

  @override
  void initState() {
    readdUid();
    readAge();
    readGender();
    getUID();

    Future.delayed(Duration(seconds: 1), () {
      saveData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late String graph;

    if (gender == "Male") {
      setState(() {
        graph = 'male';
      });
    } else {
      setState(() {
        graph = 'female';
      });
    }

    // call the age from db
    // declare x_axis based on age

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
    // declare y_axis based on score
    // navigate score from countdown page

    String hold = widget.score;
    double score = double.parse(hold);
    print(score);
    setState(() {
      finalScore = score.toInt();
    });

    late double y_axis;
    if (score <= 0) {
      y_axis = 30;
    } else if (score == 1) {
      y_axis = 37;
    } else if (score == 2) {
      y_axis = 47;
    } else if (score == 3) {
      y_axis = 62;
    } else if (score == 4) {
      y_axis = 72;
    } else if (score == 5) {
      y_axis = 87;
    } else if (score == 6) {
      y_axis = 100;
    } else if (score == 7) {
      y_axis = 112;
    } else if (score == 8) {
      y_axis = 125;
    } else if (score == 9) {
      y_axis = 137;
    } else if (score == 10) {
      y_axis = 150;
    } else if (score == 11) {
      y_axis = 162;
    } else if (score == 12) {
      y_axis = 175;
    } else if (score == 13) {
      y_axis = 187;
    } else if (score == 14) {
      y_axis = 200;
    } else if (score > 14) {
      y_axis = 210;
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[400],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.black), label: "Report"),
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Main Menu"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
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
                    'Report',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.black,
                    ),
                  ),
                  Image.asset(
                    "assets/progressbar/hundred.png",
                    width: 130,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Muscle Strength test score: ',
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
                  labelText: "$score",
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
              padding: const EdgeInsets.fromLTRB(10, 20, 0, 10),
              child: Center(
                child: Text(
                  'Your personal Sit to Stand test result compared to population norms',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
                constraints: new BoxConstraints.expand(
                  height: 250.0,
                ),
                padding: new EdgeInsets.only(left: 10, bottom: 10, right: 10),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new AssetImage(
                        'assets/images/strength_graph$graph.png'),
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
                      ),
                    ),
                  ],
                )),
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
  void initState() {
    timer = new Timer.periodic(
        new Duration(milliseconds: dependencies.timerMillisecondsRefreshRate),
        callback);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    timer = null!;
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

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/screensBM/MainMenu/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

class ReportBM extends StatefulWidget {
  final url1 =
      "https://www.youtube.com/watch?v=iNYj1HqmuxA&ab_channel=AskDoctorJo";
  final url2 =
      "https://www.youtube.com/watch?v=DrbNmDw7G0Y&ab_channel=HumanGood";

  final int walkingAid;
  final double fristAttamp;
  final double secondAttamp;
  final int worriedOfFall;
  final int historyOfFall;
  final int jointPain;
  final int glaucoma;

  const ReportBM({
    required this.walkingAid,
    required this.fristAttamp,
    required this.secondAttamp,
    required this.worriedOfFall,
    required this.historyOfFall,
    required this.jointPain,
    required this.glaucoma,
  });

  ReportState createState() => new ReportState();
}

class ReportState extends State<ReportBM> {
  User? user = FirebaseAuth.instance.currentUser;
  String gender = '';
  int currentAge = 0;
  String dob = "";
  int _selectedIndex = 0;
  String uid = '';
  int finalScore = 0;
  String riskStatus = "";
  String dUid = '';
  late double tugResult;
  late YoutubePlayerController _controller1;
  late YoutubePlayerController _controller2;
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
          builder: (context) => NavScreenBM(),
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
        print("The Gender is : $data['gander']");
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

  readAge() async {
    // User user = await FirebaseAuth.instance.currentUser;
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('userDetails').doc(user!.uid);
    print(documentReference);
    await documentReference.get().then((value) {
      final data = value;

      setState(() {
        // print(data['age']);
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

  void runYoutubePlayer1() {
    _controller1 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url1)!,
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        ));
  }

  void runYoutubePlayer2() {
    _controller2 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url2)!,
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        ));
  }

  @override
  void initState() {
    getUID();
    readAge();
    readGender();

    runYoutubePlayer1();
    runYoutubePlayer2();
    Future.delayed(Duration(seconds: 1), () {
      uploadData();
    });

    CollectionReference fallRisk =
        FirebaseFirestore.instance.collection('fallRisk');
    super.initState();
  }

  uploadData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    CollectionReference fallRisk =
        FirebaseFirestore.instance.collection('fallRisk');
    setState(() {
      final ic = sharedPreferences.getString("ic");
      final name = sharedPreferences.getString("name");

      Future.delayed(Duration(seconds: 2), () {
        fallRisk.doc().set({
          'dUid': "Not assign yet",
          'dateTime': DateTime.now(),
          'ic': ic.toString(),
          'name': name.toString(),
          'uid': uid.toString(),
          'score': finalScore,
          'tug': tugResult,
          'risk': riskStatus.toString(),
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int walkingAid = widget.walkingAid;
    int walkingAidNullCheck;
    if (walkingAid == null || walkingAid == 0) {
      walkingAidNullCheck = 0;
    } else {
      walkingAidNullCheck = 2;
    }
    double fristAttamp = widget.fristAttamp;
    double secondAttamp = widget.secondAttamp;
    int worriedOfFall = widget.worriedOfFall;
    int worriedOfFallNullCheck;
    if (worriedOfFall == null || worriedOfFall == 0) {
      worriedOfFallNullCheck = 0;
    } else {
      worriedOfFallNullCheck = 2;
    }
    int historyOfFall = widget.historyOfFall;
    int historyOfFallNullCheck;
    if (historyOfFall == null || historyOfFall == 0) {
      historyOfFallNullCheck = 0;
    } else {
      historyOfFallNullCheck = 2;
    }
    int jointPain = widget.jointPain;
    int jointPainNullCheck;
    if (jointPain == null || jointPain == 0) {
      jointPainNullCheck = 0;
    } else {
      jointPainNullCheck = 2;
    }
    int glaucoma = widget.glaucoma;
    int glaucomaNullCheck;
    if (glaucoma == null || glaucoma == 0) {
      glaucomaNullCheck = 0;
    } else {
      glaucomaNullCheck = 2;
    }
    // call the gender from db
    // int gender = await readGender(id);
    // setting the graph based on the gender
    String graph;
    late int gend;
    if (gender == 'Male') {
      setState(() {
        graph = 'male';
        gend = 0;
      });
    } else {
      setState(() {
        graph = 'female';
        gend = 1;
      });
    }
    double average = (fristAttamp + secondAttamp) / 2;
    tugResult = average;
    double tug;
    if (average >= 11.175) {
      tug = 1;
    } else {
      tug = 0;
    }

    double score = (tug * 1) +
        (worriedOfFallNullCheck * 2) +
        (gend * 2) +
        (historyOfFallNullCheck * 2) +
        (jointPainNullCheck * 2) +
        (glaucomaNullCheck * 2);
    String risk = "";
    bool showExercise = true;

    if (score >= 6) {
      risk = "berisiko";
      setState(() {
        showExercise = false;
      });
    } else {
      risk = "risiko";
    }
    setState(() {
      finalScore = score.toInt();
      riskStatus = risk;
    });

    print(
      'Walking Aid: ' + walkingAidNullCheck.toString(),
    );
    print(
      'Frist Attamp: ' + fristAttamp.toString(),
    );
    print(
      'Second Attamp: ' + secondAttamp.toString(),
    );
    print(
      'Average: ' + average.toString(),
    );
    print(
      'TUG: ' + tug.toString(),
    );
    print(
      'WorriedOfFall: ' + worriedOfFallNullCheck.toString(),
    );
    print(
      'history of Fall: ' + historyOfFallNullCheck.toString(),
    );
    print(
      'Joint Pain: ' + jointPainNullCheck.toString(),
    );
    print(
      'Glaucoma: ' + glaucomaNullCheck.toString(),
    );
    print(
      'Score: ' + score.toString(),
    );
    print(
      'gender: ' + gend.toString(),
    );

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[400],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Laporan"),
          BottomNavigationBarItem(
              icon: Icon(Icons.business, color: Colors.black),
              label: "Menu utama"),
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
              child: Column(
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
                    "assets/progressbar/hundred.png",
                    width: 130,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Skor Risiko Jatuh: ',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(140, 20, 120, 0),
              child: TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 20.0, right: 20.0),
                  labelText: "$score",
                  labelStyle: TextStyle(
                    color: Colors.red,
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
                child: showExercise
                    ? Text(
                        'Anda mempunyai $risk jatuh yang rendah.',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        '* Awas! Anda $risk untuk jatuh.',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      )),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                'Sila rujuk kepada ahli fisioterapi/doktor anda secepat mungkin untuk penilaian dan pengurusan yang lebih lanjut.',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10),
            Center(
                child: showExercise
                    ? Text(
                        'Anda boleh menonton video latihan senaman berikut.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.red,
                        ),
                        textAlign: TextAlign.center,
                      )),
            SizedBox(height: 10),
            Container(
              child: showExercise
                  ? Center(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          String url1 =
                              "https://www.youtube.com/watch?v=iNYj1HqmuxA&ab_channel=AskDoctorJo";
                          await launch(url1);
                        },
                        icon: Icon(Icons.skip_next, color: Colors.black),
                        label: Text(
                          "Tonton Video Pertama",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          primary: Colors.green[400],
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    )
                  : Text(
                      "",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(height: 22),
            Container(
              child: showExercise
                  ? Center(
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          String url2 =
                              "https://www.youtube.com/watch?v=DrbNmDw7G0Y&ab_channel=HumanGood";
                          await launch(url2);
                        },
                        icon: Icon(Icons.skip_next, color: Colors.black),
                        label: Text(
                          "Tonton Video Kedua",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          primary: Colors.green[400],
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    )
                  : Text(
                      "",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.all(7.0),
                child: showExercise
                    ? Text(
                        'Butang tonton video tersebut akan dipautkan ke aplikasi Youtube dan Web Browser.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Text(
                        '',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.justify,
                      )),
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

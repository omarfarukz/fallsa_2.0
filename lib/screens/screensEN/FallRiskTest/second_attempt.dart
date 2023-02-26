import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:fallsa/screens/screensEN/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/screensEN/FallRiskTest/test_result.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/rounded_button_timer.dart';

class SecondAttempt extends StatefulWidget {
  final double firstAttamp;
  final int walkingAid;
  const SecondAttempt(
      {Key? key, required this.firstAttamp, required this.walkingAid})
      : super(key: key);
  @override
  _SecondAttemptState createState() => _SecondAttemptState();
}

class _SecondAttemptState extends State<SecondAttempt> {
  @override
  void initState() {
    super.initState();
  }

  Stopwatch watch = Stopwatch();
  late Timer timer;
  bool startStop = true;
  bool donetest = false;

  String elapsedTime = '';

  final player = AudioPlayer();
  bool audioIsOn = false;

  void _playFile() {
    setState(() {
      audioIsOn = true;

      player.play(AssetSource('audio/my_audio.mp3'));
    });
  }

  updateTime(Timer timer) {
    if (watch.isRunning) {
      setState(() {
        print("startstop Inside=$startStop");
        elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds);
      });
    }
  }

  Widget floatingActionButtonRound(String text, VoidCallback callback) {
    // TextStyle roundTextStyle = const TextStyle(
    //     fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold);
    watch.isRunning ? text = 'stop' : text = 'start';
    return new IconButton(
      icon: Image.asset("assets/images/" + text + ".png"),
      iconSize: 140,
      onPressed: () {
        _playFile();
        startOrStop();
      },
    );
  }

  Widget floatingActionButtonFlat(String text, VoidCallback callback) {
    watch.isRunning ? text = 'Running' : text = 'Reset';
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
          padding: EdgeInsets.fromLTRB(65, 15, 65, 15),
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('The gender inside widget: $gender');
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Image.asset(
                "assets/progressbar/ten.png",
                width: 140,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text(
                  'Test',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
                child: Text(
              'Second attempt',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 20),
            Text(elapsedTime, style: TextStyle(fontSize: 50.0)),
            SizedBox(height: 20.0),
            floatingActionButtonRound(
                watch.isRunning
                    ? "assets/images/stop.png"
                    : "assets/images/start.png",
                startOrStop),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.center,
                    child: donetest
                        ? RoundedButtonTimer(
                            text: "Save",
                            press: () {
                              double secondAttamp =
                                  watch.elapsed.inSeconds.toDouble();
                              print(secondAttamp);

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TestResult(
                                      fristAttamp: widget.firstAttamp,
                                      secondAttamp: secondAttamp,
                                      walkingAid: widget.walkingAid,
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        : Column()),
                SizedBox(width: 10),
                floatingActionButtonFlat(
                    watch.isRunning ? "Running" : "RESET", leftButtonPressed),
              ],
            )
          ],
        ),
      ),
    );
  }

  leftButtonPressed() {
    setState(() {
      if (watch.isRunning) {
      } else {
        watch.reset();
        donetest = false;
        setTime();
      }
    });
  }

  startOrStop() {
    if (startStop) {
      startWatch();
    } else {
      stopWatch();
    }
  }

  startWatch() {
    setState(() {
      startStop = false;
      donetest = false;
      watch.start();
      timer = Timer.periodic(Duration(milliseconds: 100), updateTime);
    });
  }

  stopWatch() {
    setState(() {
      startStop = true;
      donetest = true;
      watch.stop();
      setTime();
    });
  }

  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
      elapsedTime = transformMilliSeconds(timeSoFar);
    });
  }

  transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    // int hours = (minutes / 60).truncate();

    // String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr";
  }
}

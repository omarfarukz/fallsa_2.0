import 'dart:async';
import 'package:fallsa/screens/screensBM/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/screensBM/FallRiskTest/components/rounded_button_timer.dart';
import 'package:fallsa/screens/screensBM/FallRiskTest/test_result.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SecondAttemptBM extends StatefulWidget {
  final double firstAttamp;
  final int walkingAid;
  const SecondAttemptBM(
      {Key? key, required this.firstAttamp, required this.walkingAid})
      : super(key: key);
  @override
  _SecondAttemptBMState createState() => _SecondAttemptBMState();
}

class _SecondAttemptBMState extends State<SecondAttemptBM> {
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
    TextStyle roundTextStyle = const TextStyle(
        fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold);
    watch.isRunning ? text = 'tamat' : text = 'mulakan';
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
    watch.isRunning ? text = 'Berlari' : text = 'Tetapkan Semula';
    TextStyle roundTextStyle = const TextStyle(
        fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold);
    return new ElevatedButton(
      child: new Text(text, style: roundTextStyle),
      onPressed: callback,
      style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(150),
          ),
          backgroundColor: Colors.red,
          padding: EdgeInsets.fromLTRB(12, 15, 12, 15),
          textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  'Ujian',
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
              'Percubaan kedua',
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
                            text: "Simpan",
                            press: () {
                              double secondAttamp =
                                  watch.elapsed.inSeconds.toDouble();

                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                print(secondAttamp);
                              });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TestResultBM(
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
                    watch.isRunning ? "Berlari" : "Semula", leftButtonPressed),
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

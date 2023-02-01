import 'package:fallsa/screens/screensBM/FallRiskTest/components/background.dart';
import 'package:fallsa/screens/screensBM/FallRiskTest/components/rounded_button_timer.dart';
import 'package:fallsa/screens/screensBM/FallRiskTest/second_attempt.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

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

class FirstAttemptBM extends StatefulWidget {
  final int walkingAid;

  const FirstAttemptBM({Key? key, required this.walkingAid}) : super(key: key);

  TimerPageState createState() => new TimerPageState();
}

class TimerPageState extends State<FirstAttemptBM> {
  final Dependencies dependencies = new Dependencies();

  late AudioCache _audioCache;
  late AudioPlayer playerAudio;
  bool audioIsOn = false;
  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: "audio/",
      // fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }

  void _playFile() async {
    // playerAudio = await _audioCache.play('my_audio.mp3'); // assign player here

    setState(() {
      audioIsOn = true;
    });
  }

  void _stopFile() {
    playerAudio.stop();
    setState(() {
      audioIsOn = false;
    });
    // stop the file like this
  }

  bool donetest = true;

  void leftButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        print("${dependencies.stopwatch.elapsedMilliseconds}");
      } else {
        dependencies.stopwatch.reset();
        donetest = true;
      }
    });
  }

  void rightButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        dependencies.stopwatch.stop();
        donetest = false;
      } else {
        dependencies.stopwatch.start();
      }
    });
  }

  Widget floatingActionButtonRound(String text, VoidCallback callback) {
    TextStyle roundTextStyle = const TextStyle(
        fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.bold);
    dependencies.stopwatch.isRunning ? text = 'tamat' : text = 'mulakan';
    return new IconButton(
      // child: new Text(text, style: roundTextStyle),
      icon: Image.asset("assets/images/" + text + ".png"),
      iconSize: 130,
      onPressed: () {
        _playFile();
        callback();
      },
    );
  }

  Widget floatingActionButtonFlat(String text, VoidCallback callback) {
    dependencies.stopwatch.isRunning
        ? text = 'Berlari'
        : text = 'Tetapkan Semula';
    TextStyle roundTextStyle = const TextStyle(
        fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold);
    return new ElevatedButton(
      child: new Text(text, style: roundTextStyle),
      onPressed: callback,
      style: ElevatedButton.styleFrom(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(150),
          ),
          backgroundColor: Colors.red,
          padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
              'Percubaan pertama',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 20),
            new TimerText(dependencies: dependencies),
            SizedBox(height: 20),
            // floatingActionButton(dependencies.stopwatch.isRunning ? "LAP" : "RESET", leftButtonPressed),
            floatingActionButtonRound(
                dependencies.stopwatch.isRunning
                    ? "assets/images/stop.png"
                    : "assets/images/start.png",
                rightButtonPressed),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: donetest
                      ? Column()
                      : RoundedButtonTimer(
                          text: "Simpan",
                          press: () {
                            double firstAttamp = dependencies
                                .stopwatch.elapsed.inSeconds
                                .toDouble();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SecondAttemptBM(
                                    firstAttamp: firstAttamp,
                                    walkingAid: widget.walkingAid,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
                SizedBox(width: 10),
                floatingActionButtonFlat(
                    dependencies.stopwatch.isRunning ? "Berlari" : "Semula",
                    leftButtonPressed),
              ],
            ),
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
    timer == 0;
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

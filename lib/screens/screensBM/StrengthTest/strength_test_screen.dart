import 'dart:math' as math;
import 'package:fallsa/screens/components/text_field_container.dart';
import 'package:fallsa/screens/screensBM/StrengthTest/report_strength_test.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:audioplayers/audioplayers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CountDownTimerBM(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.red,
      ),
    );
  }
}

class CountDownTimerBM extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimerBM>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AudioCache _audioCache;
  String get timerString {
    Duration duration = controller.duration! * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  TextEditingController score = TextEditingController();
  // TextEditingController get score => null;
  bool donetest = false;

  final player = AudioCache();

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
      prefix: "audio/",
      // fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightGreen[50],
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(1, 550, 1, 1),
                    child: Container(
                      child: donetest
                          ? Column(
                              children: [
                                Container(
                                  child: Container(
                                    child: controller.isAnimating
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Sila mula kira bilangan duduk dan berdiri.",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )

                                        //  STRoundedInputField(
                                        //   score,
                                        //   hintText: "Number of sit and stand",
                                        //   inputType: STInputFieldType.score,
                                        // ),
                                        : TextFieldContainer(
                                            child: TextFormField(
                                              enabled: true,
                                              controller: score,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: new InputDecoration(
                                                hintText:
                                                    "Masukkan bilangan duduk dan berdiri",
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(height: 50),
                                Container(
                                  child: controller.isAnimating
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        )
                                      : ElevatedButton(
                                          onPressed: () {
                                            // print(score.text);
                                            if (score.text.isNotEmpty) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return ReportSTBM(
                                                        score: score.text);
                                                  },
                                                ),
                                              );
                                            } else {
                                              var snackBar = const SnackBar(
                                                  content: Text(
                                                      "Sila berikan data duduk untuk berdiri"));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(snackBar);
                                            }
                                          },
                                          child: Text(
                                            "Hantar",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              shape: new RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20.0),
                                              ),
                                              primary: Colors.green[400],
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30, vertical: 10),
                                              textStyle: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                ),
                              ],
                            )
                          : Text(
                              'Tekan "Mula" dan mula mengira bilangan duduk dan berdiri (berdiri lengkap) pada bunyi bip.',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                              textAlign: TextAlign.center,
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(8, 100, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.topCenter,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: CustomPaint(
                                    painter: CustomTimerPainter(
                                  animation: controller,
                                  backgroundColor: Colors.white,
                                  color: themeData.indicatorColor,
                                )),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      timerString,
                                      style: TextStyle(
                                          fontSize: 80.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    AnimatedBuilder(
                                        animation: controller,
                                        builder: (context, child) {
                                          return FloatingActionButton.extended(
                                            onPressed: () {
                                              // _audioCache.play('my_audio.mp3');
                                              donetest = true;
                                              // if (controller.isAnimating)
                                              //   // controller.stop();
                                              // else {
                                              Future.delayed(
                                                  Duration(milliseconds: 1500),
                                                  () {
                                                controller.reverse(
                                                    from:
                                                        controller.value == 0.0
                                                            ? 1.0
                                                            : controller.value);

                                                print(
                                                    " This line is execute after 1 seconds");
                                              });

                                              // }
                                            },
                                            backgroundColor: Colors.green[400],
                                            icon: Icon(
                                              controller.isAnimating
                                                  ? Icons.access_time_outlined
                                                  : Icons.play_arrow,
                                              color: Colors.black,
                                              size: 50.0,
                                            ),
                                            label: Text(
                                              controller.isAnimating
                                                  ? "Bermula"
                                                  : "Mula",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30),
                                            ),
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    required this.animation,
    required this.backgroundColor,
    required this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 20.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = Colors.green[300]!;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}

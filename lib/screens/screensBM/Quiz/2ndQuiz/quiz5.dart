import 'package:fallsa/screens/screensBM/Quiz/2ndQuiz/quiz6.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';

class Quiz5ScreenBM2 extends StatefulWidget {
  final correctAnswer;
  // final int wrongAnswer;
  final quiz1Score;
  const Quiz5ScreenBM2({Key? key, this.quiz1Score, this.correctAnswer})
      : super(key: key);

  @override
  _Quiz5ScreenState createState() => _Quiz5ScreenState();
}

class _Quiz5ScreenState extends State<Quiz5ScreenBM2> {
  @override
  Widget build(BuildContext context) {
    var correctAnswer = widget.correctAnswer;
    // var wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    screen6() {
      if (_isSelected == false) {
        correctAnswer++;
      }
      print(correctAnswer);
      // print(wrongAnswer);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz6ScreenBM2(
              correctAnswer: correctAnswer,
              quiz1Score: widget.quiz1Score,
              // wrongAnswer: wrongAnswer,
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        // margin: EdgeInsets.all(120),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                "assets/images/green_top.png",
                width: 200,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 240,
              child: Image.asset(
                "assets/images/green_bottom.png",
                width: 180,
              ),
            ),
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Column(
                      children: [
                        Text(
                          "Kuiz 5",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                            // fontFamily: 'Raleway',
                            color: Colors.black,
                          ),
                        ),
                        Divider(
                          height: 20,
                          thickness: 5,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Apa yang anda lakukan sekiranya anda merasa pening ketika berdiri pada waktu pagi?",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            QuizButtton(
                              text:
                                  'Tetap rehat di atas katil. Tidak perlu bangun.',
                              function: () {
                                _isSelected = true;
                                screen6();
                              },
                            ),
                            QuizButtton(
                              text:
                                  'Duduk di atas katil selama beberapa minit sebelum berdiri. Berdiri sebentar sebelum berjalan.',
                              function: () {
                                screen6();
                              },
                            ),
                            QuizButtton(
                              text: 'Ianya adalah biasa, jangan buat apa-apa.',
                              function: () {
                                _isSelected = true;
                                screen6();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

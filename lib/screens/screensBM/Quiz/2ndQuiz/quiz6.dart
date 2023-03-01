import 'package:fallsa/screens/screensBM/Quiz/2ndQuiz/quiz7.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';

class Quiz6ScreenBM2 extends StatefulWidget {
  final correctAnswer;
  final quiz1Score;

  const Quiz6ScreenBM2({Key? key, this.quiz1Score, this.correctAnswer})
      : super(key: key);

  @override
  _Quiz6ScreenState createState() => _Quiz6ScreenState();
}

class _Quiz6ScreenState extends State<Quiz6ScreenBM2> {
  @override
  Widget build(BuildContext context) {
    var correctAnswer = widget.correctAnswer;

    bool _isSelected = false;

    String answer6;

    screen7() {
      if (_isSelected == false) {
        correctAnswer++;
      }
      print(correctAnswer);
      // print(wrongAnswer);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz7ScreenBM2(
              quiz1Score: widget.quiz1Score,
              correctAnswer: correctAnswer,
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
                          "Kuiz 6",
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
                            "Antara tindakan berikut, yang manakah dapat membantu anda menurunkan risiko jatuh di bilik mandi?",
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
                              text: 'Pasang palang pemegang di bilik mandi.',
                              function: () {
                                answer6 = 'Install grab bars in the bathroom';
                                screen7();
                              },
                            ),
                            QuizButtton(
                              text: 'Pindah ke rumah baru.',
                              function: () {
                                answer6 = 'Move to a new house';
                                _isSelected = true;
                                screen7();
                              },
                            ),
                            QuizButtton(
                              text: 'Gunakan alas kaki.',
                              function: () {
                                answer6 = 'Use a doormat';
                                _isSelected = true;
                                screen7();
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

import 'package:fallsa/screens/screensBM/Quiz/2ndQuiz/quiz3.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz2ScreenBM2 extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);
  // final String answer1;
  final int correctAnswer;
  final quiz1Score;

  const Quiz2ScreenBM2({Key? key, required this.correctAnswer, this.quiz1Score})
      : super(key: key);

  @override
  _Quiz2ScreenState createState() => _Quiz2ScreenState();
}

class _Quiz2ScreenState extends State<Quiz2ScreenBM2> {
  @override
  Widget build(BuildContext context) {
    User user;
    String answer2;

    int correctAnswer = widget.correctAnswer;
    // int wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    screen3() {
      if (_isSelected == false) {
        correctAnswer = correctAnswer + 1;
      }
      print(correctAnswer);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz3ScreenBM2(
              correctAnswer: correctAnswer,
              quiz1Score: widget.quiz1Score,
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
                          "Kuiz 2",
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
                            "Sekiranya warga emas pernah jatuh sekali, kemungkinan untuk jatuh lagi berganda.",
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
                              text: 'Betul',
                              function: () {
                                answer2 = 'True';
                                screen3();
                              },
                            ),
                            QuizButtton(
                              text: 'Salah',
                              function: () {
                                answer2 = 'False';
                                _isSelected = true;
                                screen3();
                              },
                            ),
                            QuizButtton(
                              text: 'Tidak tahu',
                              function: () {
                                answer2 = 'Don\'t Know';
                                _isSelected = true;
                                screen3();
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

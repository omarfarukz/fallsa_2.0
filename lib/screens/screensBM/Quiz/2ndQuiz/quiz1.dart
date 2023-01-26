import 'package:fallsa/screens/screensBM/Quiz/2ndQuiz/quiz2.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Quiz1ScreenBM2 extends StatefulWidget {
  final quiz1Score;

  const Quiz1ScreenBM2({Key? key, this.quiz1Score}) : super(key: key);
  //const Quiz({Key? key}) : super(key: key);

  @override
  _Quiz1ScreenState createState() => _Quiz1ScreenState();
}

class _Quiz1ScreenState extends State<Quiz1ScreenBM2> {
  late User user;

  late String answer1;
  late String condition;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int count = 0;
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    screen2() {
      if (!_isSelected == true) {
        correctAnswer = correctAnswer + 1;
      }
      print(correctAnswer);
      // print(wrongAnswer);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz2ScreenBM2(
              // answer1,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kuiz 1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                            //fontFamily: 'Raleway',
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
                            "Kejadian jatuh adalah sebahagian proses penuaan yang normal dan tidak dapat dicegah.",
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
                                answer1 = 'True';
                                _isSelected = true;
                                screen2();
                              },
                            ),
                            QuizButtton(
                              text: 'Salah',
                              function: () {
                                answer1 = 'False';
                                screen2();
                              },
                            ),
                            QuizButtton(
                              text: 'Tidak tahu',
                              function: () {
                                answer1 = 'Don\'t Know';
                                _isSelected = true;
                                screen2();
                              },
                            ),
                            SizedBox(
                              height: 20,
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

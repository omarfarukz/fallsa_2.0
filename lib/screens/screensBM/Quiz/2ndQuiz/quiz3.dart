import 'package:fallsa/screens/screensBM/Quiz/2ndQuiz/quiz4.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz3ScreenBM2 extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);
  // final String answer1;
  // final int wrongAnswer;
  final int correctAnswer;
  final quiz1Score;

  const Quiz3ScreenBM2({
    // this.answer1,
    // this.answer2,
    // this.wrongAnswer,
    this.quiz1Score,
    required this.correctAnswer,
  });

  @override
  _Quiz3ScreenState createState() => _Quiz3ScreenState();
}

class _Quiz3ScreenState extends State<Quiz3ScreenBM2> {
  @override
  Widget build(BuildContext context) {
    User user;
    String answer3;
    int correctAnswer = widget.correctAnswer;
    // int wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    screen4() {
      if (_isSelected == false) {
        correctAnswer++;
      }
      print(correctAnswer);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz4ScreenBM2(
              // answer1: widget.answer1,
              // answer2: widget.answer2,
              // answer3: answer3,
              // wrongAnswer: wrongAnswer,
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
                          "Kuiz 3",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
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
                            "Antara berikut yang manakah merupakan faktor risiko jatuh pada warga emas?",
                            style: TextStyle(
                              fontSize: 22,
                              //fontFamily: 'Raleway',
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
                              text: 'Masalah penglihatan',
                              function: () {
                                answer3 = 'Visual impairment';
                                screen4();
                              },
                            ),
                            QuizButtton(
                              text: 'Selera makan berkurangan',
                              function: () {
                                answer3 = 'Decreased appetite';
                                _isSelected = true;
                                screen4();
                              },
                            ),
                            QuizButtton(
                              text: 'Penjagaan gigi yang kurang baik',
                              function: () {
                                answer3 = 'Poor dental care';
                                _isSelected = true;
                                screen4();
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

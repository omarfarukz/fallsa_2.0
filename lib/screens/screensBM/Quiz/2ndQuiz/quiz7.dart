import 'package:fallsa/screens/screensBM/Quiz/2ndQuiz/quiz8.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';

class Quiz7ScreenBM2 extends StatefulWidget {
  final correctAnswer;
  final quiz1Score;

  const Quiz7ScreenBM2({Key? key, this.quiz1Score, this.correctAnswer})
      : super(key: key);

  @override
  _Quiz7ScreenState createState() => _Quiz7ScreenState();
}

class _Quiz7ScreenState extends State<Quiz7ScreenBM2> {
  @override
  Widget build(BuildContext context) {
    var correctAnswer = widget.correctAnswer;
    String answer7;

    bool _isSelected = false;

    screen8() {
      if (_isSelected == false) {
        correctAnswer++;
      }
      print(correctAnswer);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz8ScreenBM2(
              correctAnswer: correctAnswer,
              quiz1Score: widget.quiz1Score,
            );
          },
        ),
      );
    }

    return Container(
      child: Scaffold(
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
                            "Kuiz 7",
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
                              "Untuk mengelakkan jatuh ketika berjalan dan mengelak kekusutan barangan di rumah, anda harus",
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
                                text: 'Pusing ke tepi',
                                function: () {
                                  answer7 = 'Turn sideways';
                                  _isSelected = true;
                                  screen8();
                                },
                              ),
                              QuizButtton(
                                text: 'Melompat melintasinya',
                                function: () {
                                  answer7 = 'Hop across it';
                                  _isSelected = true;
                                  screen8();
                                },
                              ),
                              QuizButtton(
                                text:
                                    'Mengeluarkan kekusutan barangan secara kekal',
                                function: () {
                                  answer7 = 'Remove clutter permanently';
                                  screen8();
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
      ),
    );
  }
}

import 'package:fallsa/screens/screensEN/Quiz/2ndQuiz/quiz7.dart';
import 'package:flutter/material.dart';

import '../components/quizbutton.dart';

class Quiz6Screen extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final answer3;
  // final answer4;
  // final answer5;
  final correctAnswer;
  final quiz1Score;
  // final wrongAnswer;

  const Quiz6Screen(
      {Key? key,
      // this.answer1,
      // this.answer2,
      // this.answer3,
      // this.answer4,
      // this.answer5,
      // this.wrongAnswer,
      this.quiz1Score,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz6ScreenState createState() => _Quiz6ScreenState();
}

class _Quiz6ScreenState extends State<Quiz6Screen> {
  @override
  Widget build(BuildContext context) {
    var correctAnswer = widget.correctAnswer;
    // var wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

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
            return Quiz7Screen(
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
                          "Quiz 6",
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
                            "Which of the following simple action can help you lower risk of falling in the bathroom?",
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
                              text: 'Install grab bars in the bathroom',
                              function: () {
                                screen7();
                              },
                            ),
                            QuizButtton(
                              text: 'Move to a new house',
                              function: () {
                                _isSelected = true;
                                screen7();
                              },
                            ),
                            QuizButtton(
                              text: 'Use a doormat',
                              function: () {
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

import 'package:fallsa/screens/screensEN/Quiz/1stQuiz/quiz5.dart';
import 'package:flutter/material.dart';

import '../components/quizbutton.dart';
import 'dialogButton.dart';

class Quiz4Screen extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final int wrongAnswer;
  final correctAnswer;

  const Quiz4Screen(
      {Key? key,
      // this.answer1,
      // this.answer2,
      // this.wrongAnswer,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz4ScreenState createState() => _Quiz4ScreenState();
}

class _Quiz4ScreenState extends State<Quiz4Screen> {
  @override
  Widget build(BuildContext context) {
    late String answer4;
    var correctAnswer = widget.correctAnswer;
    // var wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    @override
    _showdialog() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Wrong Answer! The Correct Answer is:',
            style: new TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Text(
            '"Yes"',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              // textColor: Colors.black,
              // color: Colors.green[400],
              // minWidth: 300,
              style: TextButton.styleFrom(
                backgroundColor: Colors.green[400],
                foregroundColor: Colors.black,
              ),

              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Answer Again',
                style: new TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    }

    screen5() {
      if (answer4 == 'Yes') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        print(correctAnswer);
        // print(wrongAnswer);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz5Screen(
                // answer1: widget.answer1,
                // answer2: widget.answer2,
                // answer3: widget.answer3,
                // answer4: answer4,
                // wrongAnswer: wrongAnswer,
                correctAnswer: correctAnswer,
              );
            },
          ),
        );
      } else if (answer4 == 'No') {
        _showdialog();
        // if (_2isSelected == false) {
        //   wrongAnswer++;
        // }
      } else if (answer4 == 'Don\'t Know') {
        _showdialog();
        // if (_1isSelected == false) {
        //   wrongAnswer++;
        // }
      }
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
                          "Quiz 4",
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
                            "Can the use of appropriate walking aids decrease the risk for falls in older persons?",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
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
                              text: 'Yes',
                              function: () {
                                answer4 = 'Yes';
                                screen5();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'No',
                              function: () {
                                answer4 = 'No';
                                _isSelected = true;
                                screen5();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Don\'t Know',
                              function: () {
                                answer4 = 'Don\'t Know';
                                _isSelected = true;
                                screen5();
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

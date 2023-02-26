import 'package:fallsa/screens/screensEN/Quiz/1stQuiz/quiz6.dart';
import 'package:flutter/material.dart';

import '../components/quizbutton.dart';

class Quiz5Screen extends StatefulWidget {
  final correctAnswer;

  const Quiz5Screen({Key? key, this.correctAnswer}) : super(key: key);

  @override
  _Quiz5ScreenState createState() => _Quiz5ScreenState();
}

class _Quiz5ScreenState extends State<Quiz5Screen> {
  @override
  Widget build(BuildContext context) {
    var correctAnswer = widget.correctAnswer;
    // var wrongAnswer = widget.wrongAnswer;
    bool _isSelected = false;

    late String answer5;
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
            '"Sit up in the bed for a few minutes before standing up. Stand up for a minute before walking."',
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
              child: Center(
                child: Text(
                  'Answer Again',
                  style: new TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    screen6() {
      if (answer5 ==
          'Sit up in the bed for a few minutes before standing up. Stand up for a minute before walking') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        print(correctAnswer);
        // print(wrongAnswer);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz6Screen(
                // answer1: widget.answer1,
                // answer2: widget.answer2,
                // answer3: widget.answer3,
                // answer4: answer4,
                correctAnswer: correctAnswer,
                // wrongAnswer: wrongAnswer,
              );
            },
          ),
        );
      } else if (answer5 == 'Stay in bed.There is no need to get up') {
        _showdialog();
      } else if (answer5 == 'It is common, do nothing about it') {
        _showdialog();
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
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        Text(
                          "Quiz 5",
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
                            "What do you do if you feel dizzy when standing up in the morning?",
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
                              text: 'Stay in bed.There is no need to get up',
                              function: () {
                                answer5 =
                                    'Stay in bed.There is no need to get up';
                                _isSelected = true;
                                screen6();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text:
                                  'Sit up in the bed for a few minutes before standing up. Stand up for a minute before walking',
                              function: () {
                                answer5 =
                                    'Sit up in the bed for a few minutes before standing up. Stand up for a minute before walking';
                                screen6();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'It is common, do nothing about it',
                              function: () {
                                answer5 = 'It is common, do nothing about it';
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

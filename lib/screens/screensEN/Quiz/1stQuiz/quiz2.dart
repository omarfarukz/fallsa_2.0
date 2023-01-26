import 'package:fallsa/screens/screensEN/Quiz/1stQuiz/quiz3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/quizbutton.dart';

class Quiz2Screen extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);
  // final String answer1;
  final int correctAnswer;

  const Quiz2Screen(
    // this.answer1,
    this.correctAnswer,
  );

  @override
  _Quiz2ScreenState createState() => _Quiz2ScreenState();
}

class _Quiz2ScreenState extends State<Quiz2Screen> {
  @override
  Widget build(BuildContext context) {
    late String answer2;

    int correctAnswer = widget.correctAnswer;
    // int wrongAnswer = widget.wrongAnswer;
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
            '"True"',
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

    screen3() {
      if (answer2 == 'True') {
        if (_isSelected == false) {
          correctAnswer = correctAnswer + 1;
        }
        print(correctAnswer);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz3Screen(
                correctAnswer: correctAnswer,
              );
            },
          ),
        );
      } else if (answer2 == 'False' || answer2 == 'Don\'t Know') {
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
                    margin: EdgeInsets.only(top: 120),
                    child: Column(
                      children: [
                        Text(
                          "Quiz 2",
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
                            "If an older person falls once, his or her chance of falling again doubles?",
                            style: TextStyle(
                              fontSize: 24,
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
                              text: 'True',
                              function: () {
                                answer2 = 'True';
                                screen3();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'False',
                              function: () {
                                answer2 = 'False';
                                _isSelected = true;
                                screen3();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Don\'t Know',
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

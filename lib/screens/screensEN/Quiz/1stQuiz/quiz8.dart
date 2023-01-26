import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/screensEN/Quiz/1stQuiz/dialogButton.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../2ndQuiz/education_video_screen_second.dart';
import '../components/quizbutton.dart';

class Quiz8Screen extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final answer3;
  // final answer4;
  // final answer5;
  // final answer6;
  // final answer7;
  // final int wrongAnswer;
  final int correctAnswer;

  const Quiz8Screen({
    Key? key,
    // this.answer1,
    // this.answer2,
    // this.answer3,
    // this.answer4,
    // this.answer5,
    // this.answer6,
    // this.answer7,
    // this.wrongAnswer,
    required this.correctAnswer,
  }) : super(key: key);

  @override
  _Quiz8ScreenState createState() => _Quiz8ScreenState();
}

class _Quiz8ScreenState extends State<Quiz8Screen> {
  String uid = '';
  @override
  void initState() {
    super.initState();
    getUID();
  }

  Future getUID() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainUID = sharedPreferences.getString("uid");
    setState(() {
      uid = obtainUID!;
      print("Here is the UID : $uid");
    });
  }

  @override
  Widget build(BuildContext context) {
    // user = FirebaseAuth.instance.currentUser;
    late String answer8;

    int correctAnswer = widget.correctAnswer;
    int wrongAnswer = 0;
    bool _isSelected = false;

    DateTime datetime = DateTime.now();

    CollectionReference quiz1 = FirebaseFirestore.instance.collection('quiz1');
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
            '"Exercising regularly. "',
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

    _showResult() {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Total Pre-quiz Score:',
            style: new TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Text(
            '$correctAnswer',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              // color: Colors.green[400],
              onPressed: () {
                // quiz1
                //     .doc()
                //     .set({
                //       'prequiz': 'prequiz',
                //       'uid': uid,
                //       'correct': correctAnswer,
                //       'wrong': wrongAnswer,
                //     })
                //     .then((value) => print("User Data added"))
                //     .catchError((onError) => print('Failed to add. $onError'));

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EducationVideoScreenSecond(
                          quiz1Score: correctAnswer);
                    },
                  ),
                );
                // Navigator.pop(context);
              },
              child: DialogButton('Attend Post Quiz'),
            )
          ],
        ),
      );
    }

    education() {
      if (answer8 == 'Exercising regularly') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        wrongAnswer = 8 - correctAnswer;
        _showResult();
      } else if (answer8 == 'Staying at home') {
        _showdialog();
      } else if (answer8 == 'Avoiding movements and physical activity') {
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
                          "Quiz 8",
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
                            "What can help prevent falls in older persons?",
                            style: TextStyle(
                              fontSize: 26,
                              //fontFamily: 'Raleway',
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
                              text: 'Staying at home',
                              function: () {
                                answer8 = 'Staying at home';
                                _isSelected = true;
                                education();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Exercising regularly',
                              function: () {
                                answer8 = 'Exercising regularly';
                                education();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Avoiding movements and physical activity',
                              function: () {
                                answer8 =
                                    'Avoiding movements and physical activity';
                                _isSelected = true;
                                education();
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

import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/quiz5.dart';
import 'package:fallsa/screens/screensEN/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';

class Quiz4ScreenBM extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final int wrongAnswer;
  final correctAnswer;

  const Quiz4ScreenBM(
      {Key? key,
      // this.answer1,
      // this.answer2,
      // this.wrongAnswer,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz4ScreenState createState() => _Quiz4ScreenState();
}

class _Quiz4ScreenState extends State<Quiz4ScreenBM> {
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
            'Jawapan salah! Jawapan yang betul ialah:',
            style: new TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Text(
            '"Ya"',
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
                'Jawab Lagi',
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
              return Quiz5ScreenBM(
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
                          "Kuiz 4",
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
                            "Bolehkah penggunaan alat bantu berjalan yang sesuai dapat mengurangkan risiko jatuh dalam kalangan warga emas?",
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
                              text: 'Ya',
                              function: () {
                                answer4 = 'Yes';
                                screen5();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Tidak',
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
                              text: 'Tidak tahu',
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

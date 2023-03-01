import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/quiz4.dart';
import 'package:fallsa/screens/screensEN/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';

class Quiz3ScreenBM extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);
  // final String answer1;
  // final int wrongAnswer;
  final int correctAnswer;

  const Quiz3ScreenBM({
    // this.answer1,
    // this.answer2,
    // this.wrongAnswer,
    required this.correctAnswer,
  });

  @override
  _Quiz3ScreenState createState() => _Quiz3ScreenState();
}

class _Quiz3ScreenState extends State<Quiz3ScreenBM> {
  @override
  Widget build(BuildContext context) {
    late String answer3;
    int correctAnswer = widget.correctAnswer;
    // int wrongAnswer = widget.wrongAnswer;
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
            '"Masalah penglihatan"',
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
                  'Jawab Lagi',
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

    screen4() {
      if (answer3 == 'Visual impairment') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        print(correctAnswer);
        // print(wrongAnswer);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz4ScreenBM(
                // answer1: widget.answer1,
                // answer2: widget.answer2,
                // answer3: answer3,
                // wrongAnswer: wrongAnswer,
                correctAnswer: correctAnswer,
              );
            },
          ),
        );
      } else if (answer3 == 'Decreased appetite') {
        _showdialog();
        // if (_2isSelected == false) {
        //   // wrongAnswer++;
        // }
      } else if (answer3 == 'Poor dental care') {
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
                              fontSize: 24,
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
                              text: 'Masalah penglihatan',
                              function: () {
                                answer3 = 'Visual impairment';
                                screen4();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Selera makan berkurangan',
                              function: () {
                                answer3 = 'Decreased appetite';
                                _isSelected = true;
                                screen4();
                              },
                            ),
                            SizedBox(
                              height: 10,
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

import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/quiz8.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';

class Quiz7ScreenBM extends StatefulWidget {
  final correctAnswer;

  const Quiz7ScreenBM({Key? key, this.correctAnswer}) : super(key: key);

  @override
  _Quiz7ScreenState createState() => _Quiz7ScreenState();
}

class _Quiz7ScreenState extends State<Quiz7ScreenBM> {
  @override
  Widget build(BuildContext context) {
    var correctAnswer = widget.correctAnswer;
    // int wrongAnswer = widget.wongAnswer;
    late String answer7;

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
            '"Mengeluarkan kekusutan barangan secara kekal"',
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

    screen8() {
      if (answer7 == 'Remove clutter permanently') {
        if (_isSelected == false) {
          correctAnswer++;
        }
        print(correctAnswer);
        // print(wrongAnswer);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Quiz8ScreenBM(
                // answer1: widget.answer1,
                // answer2: widget.answer2,
                // answer3: widget.answer3,
                // answer4: widget.answer4,
                // answer5: widget.answer5,
                // answer6: widget.answer6,
                // answer7: answer7,
                // wrongAnswer: wrongAnswer,
                correctAnswer: correctAnswer,
              );
            },
          ),
        );
      } else if (answer7 == 'Turn sideways') {
        _showdialog();
        // if (_2isSelected == false) {
        //   wrongAnswer++;
        // }
      } else if (answer7 == 'Hop across it') {
        _showdialog();
        // if (_1isSelected == false) {
        //   wrongAnswer++;
        // }
      }
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
                                text: 'Pusing ke tepi',
                                function: () {
                                  answer7 = 'Turn sideways';
                                  _isSelected = true;
                                  screen8();
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              QuizButtton(
                                text: 'Melompat melintasinya',
                                function: () {
                                  answer7 = 'Hop across it';
                                  _isSelected = true;
                                  screen8();
                                },
                              ),
                              SizedBox(
                                height: 10,
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

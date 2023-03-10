import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/quiz6.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';

class Quiz5ScreenBM extends StatefulWidget {
  // final answer1;
  // final answer2;
  // final answer3;
  // final answer4;
  final correctAnswer;
  // final int wrongAnswer;

  const Quiz5ScreenBM(
      {Key? key,
      // this.answer1,
      // this.answer2,
      // this.answer3,
      // this.answer4,
      // this.wrongAnswer,
      this.correctAnswer})
      : super(key: key);

  @override
  _Quiz5ScreenState createState() => _Quiz5ScreenState();
}

class _Quiz5ScreenState extends State<Quiz5ScreenBM> {
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
            'Jawapan salah! Jawapan yang betul ialah:',
            style: new TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          content: Text(
            '"Duduk di atas katil selama beberapa minit sebelum berdiri. Berdiri sebentar sebelum berjalan."',
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
              return Quiz6ScreenBM(
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
      } else if (answer5 == 'Its common, do nothing about it') {
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
                          "Kuiz 5",
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
                            "Apa yang anda lakukan sekiranya anda merasa pening ketika berdiri pada waktu pagi?",
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
                              text:
                                  'Tetap rehat di atas katil. Tidak perlu bangun.',
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
                                  'Duduk di atas katil selama beberapa minit sebelum berdiri. Berdiri sebentar sebelum berjalan.',
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
                              text: 'Ianya adalah biasa, jangan buat apa-apa.',
                              function: () {
                                answer5 = 'Its common, do nothing about it';
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

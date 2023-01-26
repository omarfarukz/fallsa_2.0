import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../MainMenu/nav.dart';
import '../1stQuiz/dialogButton.dart';
import '../1stQuiz/dialogTextWidget.dart';
import '../components/quizbutton.dart';

class Quiz8Screen extends StatefulWidget {
  final quiz1Score;
  final correctAnswer;

  const Quiz8Screen({Key? key, this.quiz1Score, this.correctAnswer})
      : super(key: key);

  @override
  _Quiz8ScreenState createState() => _Quiz8ScreenState();
}

class _Quiz8ScreenState extends State<Quiz8Screen> {
  String name = '';
  String ic = '';
  String dUid = '';
  late String uid;
  @override
  void initState() {
    getUID();
    readdUid();
    super.initState();
  }

  Future getUID() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainUID = sharedPreferences.getString("uid");
    var obtainName = sharedPreferences.getString("name");
    var obtainIc = sharedPreferences.getString("ic");
    setState(() {
      uid = obtainUID!;
      name = obtainName!;
      ic = obtainIc!;

      print("Here is the UID : $uid");
    });
  }

  readdUid() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection('userDetails')
          .doc(user!.uid); //"a6Zto5xnPcP5WE6yLHzcRq4i9Qn1"
      print(documentReference);
      await documentReference.get().then((value) {
        final data = value;

        setState(() {
          print("The Doctor id is : ${data['dUid']}");
          dUid = data['dUid'];
        });
      });
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Something Wrong $error")));
    }
  }

  @override
  Widget build(BuildContext context) {
    // User user;
    bool _isSelected = false;
    int correctAnswer = widget.correctAnswer;
    int quiz1Score = widget.quiz1Score;
    DateTime dateTime = DateTime.now();

    int wrongAnswer = 0;

    String answer8;
    CollectionReference quiz2 = FirebaseFirestore.instance.collection('quiz');
    _showdialog() {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
          title: DialogText('Total pre quiz score is: $quiz1Score'),
          content: DialogText('Total post quiz score is: $correctAnswer'),
          actions: [
            TextButton(
                // color: Colors.green[300],
                onPressed: () {
                  quiz2
                      .doc()
                      .set({
                        'uid': uid,
                        'postCorrect': correctAnswer.toString(),
                        'preCorrect': quiz1Score.toString(),
                        'name': name,
                        'ic': ic.toString(),
                        'dateTime': dateTime,
                        'dUid': dUid,
                      })
                      .then((value) => print("User Data added"))
                      .catchError(
                          (onError) => print('Failed to add. $onError'));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NavScreen();
                      },
                    ),
                  );
                },
                child: DialogButton('Go to Main Screen')),
          ],
        ),
      );
    }

    navScreen() {
      if (_isSelected == false) {
        correctAnswer++;
      }
      wrongAnswer = 8 - correctAnswer;
      _showdialog();
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
                              fontSize: 22,
                              //fontFamily: 'Raleway',
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
                              text: 'Staying at home',
                              function: () {
                                answer8 = 'Staying at home';
                                _isSelected = true;
                                navScreen();
                              },
                            ),
                            QuizButtton(
                              text: 'Exercising regularly',
                              function: () {
                                answer8 = 'Exercising regularly';
                                navScreen();
                              },
                            ),
                            QuizButtton(
                              text: 'Avoiding movements and physical activity',
                              function: () {
                                answer8 =
                                    'Avoiding movements and physical activity';
                                _isSelected = true;
                                navScreen();
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

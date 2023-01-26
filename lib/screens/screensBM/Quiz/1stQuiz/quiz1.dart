import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/quiz2.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Quiz1ScreenBM extends StatefulWidget {
  //const Quiz({Key? key}) : super(key: key);

  @override
  _Quiz1ScreenState createState() => _Quiz1ScreenState();
}

class _Quiz1ScreenState extends State<Quiz1ScreenBM> {
  late User user;

  late String answer1;
  late String condition;
  int correctAnswer = 0;
  int wrongAnswer = 0;
  int count = 0;
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('userDetails').snapshots();

  @override
  _showdialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Jawapan salah! Jawapan yang betul ialah: ',
          style: new TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: Text(
          '"Salah"',
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

  bool _isSelected = false;
  screen2() {
    if (answer1 == 'False') {
      if (!_isSelected == true) {
        correctAnswer = correctAnswer + 1;
      }
      print(correctAnswer);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Quiz2ScreenBM(
              correctAnswer,
            );
          },
        ),
      );
    } else if (answer1 == 'True' || answer1 == 'Don\'t Know') {
      _showdialog();
    }
  }

  Widget build(BuildContext context) {
    user = FirebaseAuth.instance.currentUser!;
    CollectionReference data =
        FirebaseFirestore.instance.collection('userDetails');
    DocumentReference docReference = data.doc("a6Zto5xnPcP5WE6yLHzcRq4i9Qn1");

    getData() {
      FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc["name"]);
          String updatedData = doc["gander"];
          print(updatedData);
        });
      });
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Kuiz 1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 70,
                            //fontFamily: 'Raleway',
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
                            "Kejadian jatuh adalah sebahagian proses penuaan yang normal dan tidak dapat dicegah?",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
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
                              text: 'Betul',
                              function: () {
                                answer1 = 'True';
                                _isSelected = true;
                                screen2();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Salah',
                              function: () {
                                answer1 = 'False';
                                condition = 'true';
                                screen2();
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            QuizButtton(
                              text: 'Tidak tahu',
                              function: () {
                                answer1 = 'Don\'t Know';
                                _isSelected = true;
                                screen2();
                              },
                            ),
                            SizedBox(
                              height: 20,
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

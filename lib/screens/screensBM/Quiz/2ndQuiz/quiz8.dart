import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/screensBM/MainMenu/nav.dart';
import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/dialogButton.dart';
import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/dialogTextWidget.dart';
import 'package:fallsa/screens/screensBM/Quiz/components/quizbutton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quiz8ScreenBM2 extends StatefulWidget {
  final quiz1Score;
  final correctAnswer;

  const Quiz8ScreenBM2({Key? key, this.quiz1Score, this.correctAnswer})
      : super(key: key);

  @override
  _Quiz8ScreenState createState() => _Quiz8ScreenState();
}

class _Quiz8ScreenState extends State<Quiz8ScreenBM2> {
  String name = '';
  String ic = '';
  late String uid;
  String dUid = '';
  @override
  void initState() {
    readdUid();
    getUID();
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
          title: DialogText('Jumlah skor pra kuiz ialah: $quiz1Score'),
          content: DialogText('Jumlah skor post kuiz ialah: $correctAnswer'),
          actions: [
            TextButton(
                // color: Colors.green[300],
                style: TextButton.styleFrom(backgroundColor: Colors.green[300]),
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
                        'dUid': "Not assign yet",
                      })
                      .then((value) => print("User Data added"))
                      .catchError(
                          (onError) => print('Failed to add. $onError'));

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NavScreenBM();
                      },
                    ),
                  );
                },
                child: DialogButton('Pergi ke skrin utama')),
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
                          "Kuiz 8",
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
                            "Apakah yang dapat membantu pencegahan jatuh dalam kalangan warga emas?",
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
                              text: 'Tinggal di rumah.',
                              function: () {
                                answer8 = 'Staying at home';
                                _isSelected = true;
                                navScreen();
                              },
                            ),
                            QuizButtton(
                              text: 'Bersenam secara berkala.',
                              function: () {
                                answer8 = 'Exercising regularly';
                                navScreen();
                              },
                            ),
                            QuizButtton(
                              text:
                                  'Mengelakkan pergerakan dan aktiviti fizikal.',
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

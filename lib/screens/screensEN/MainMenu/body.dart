import 'package:fallsa/screens/screensEN/FallRiskTest/first_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../screensBM/MainMenu/nav.dart';
import '../Education/education_video_screen_first.dart';
import '../PastResult/past_result.dart';
import '../StrengthTest/strength_test_video_introduction.dart';
import 'background.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController language = useTextEditingController();
    //final List<String> languages = ["Bhasa Melayu", "English"];
    final Size size = MediaQuery.of(context).size;
    final double iconHeight = 150;
    final double iconWeidth = 170;

    return Background(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "EN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              style:
                              TextStyle(fontSize: 25);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavScreenBM()));
                            },
                            child: Text(
                              "/  BM",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  color: Colors.green[800]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  "assets/images/menu_yellow_jacket.png",
                  height: size.height * 0.25,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Main Menu",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.green[900]),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  indent: 40,
                  endIndent: 40,
                  height: 10,
                  thickness: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: ,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PastResultScreen()));
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      height: 155,
                                      width: 175,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.green[300]),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.history,
                                            color: Colors.black,
                                            size: 120.0,
                                          ),
                                          Text(
                                            "Previous Results",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FirstQuestion(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      height: 155,
                                      width: 175,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.green[300]),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/icons/gg-removebg-preview.png",
                                            width: 130,
                                          ),
                                          Text(
                                            "Fall Risk",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // crossAxisAlignment: ,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          StrengthTestIntroduction(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      height: 155,
                                      width: 175,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.green[300]),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/icons/logo_exercise.png",
                                            width: 100,
                                          ),
                                          Text(
                                            "Muscle",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                          Text(
                                            "Strength Test",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EducationVideoScreenFirst(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      height: 155,
                                      width: 175,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.green[300]),
                                      child: Column(
                                        children: [
                                          Icon(
                                            Icons.menu_book_outlined,
                                            color: Colors.black,
                                            size: 120.0,
                                          ),
                                          Text(
                                            "Education",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

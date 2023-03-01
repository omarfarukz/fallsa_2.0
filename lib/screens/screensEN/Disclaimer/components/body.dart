import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../screensBM/Disclaimer/disclaimer_screen.dart';
import '../../Guideline/guideline_screen.dart';
import 'background.dart';

class Body extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundDisclaimer(
      child: ListView(
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
                        TextStyle(fontSize: 25);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DisclaimerScreenBM()));
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
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Disclaimer",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
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
                  Container(
                    // width: MediaQuery.of(context).size.width.w,
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: [
                          Text(
                            "FallSA (Falls Screening Application) offers seniors a self-examination tool to inform fall risk-based studies conducted in Malaysia. This app has the potential to create awareness among seniors about the importance of early falls screening so as to assist in the process of early treatment and prevention. The data in this mobile application will be handled as medical records as set forth in Data Protection Disclaimer and Laws of Malaysia Act 709; Personal Data Protection Act 2010. The mobile app only informs the risk of a fall and does not make a diagnosis or suggest dose changes of current medicine. Data in this app will be used for the research purposes.",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return GuidelineScreen();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.check_box_outlined,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Agree and Continue",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.green[400],
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

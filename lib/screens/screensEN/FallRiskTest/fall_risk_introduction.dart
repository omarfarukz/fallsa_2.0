import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../MainMenu/nav.dart';
import 'first_attempt.dart';

class FallRiskIntroduction extends StatefulWidget {
  final int walkingAid;
  final url = "https://youtu.be/WQn3m1BSStM";
  const FallRiskIntroduction({
    required this.walkingAid,
  });
  @override
  _FallRiskIntroductionState createState() => _FallRiskIntroductionState();
}

class _FallRiskIntroductionState extends State<FallRiskIntroduction> {
  late YoutubePlayerController _controller;

  final player = AudioPlayer();
  bool audioIsOn = false;

  void _playFile() {
    setState(() {
      audioIsOn = true;

      player.play(AssetSource('audio/tugen.mp3'));
    });
  }

  void _stopFile() {
    setState(() {
      audioIsOn = false;
    });
    player.stop();
    // stop the file like this
    super.initState();
  }

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];
  void _onItemTapped(int index) {
    _stopFile();
    if (_selectedIndex == 1) {
      setState(() {
        _selectedIndex = index;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var text1 = "• The timed up and go tests functional mobility.";
    var text2 =
        "• To administer this test you need a standard chair, a tape measure to mark 3 meters from the chair to the turning point, a tape and a bottle to mark the end of the 3 meter point.";
    var text3 = "• You need your FallSA timer. Use your regular footwear.";
    var text4 = "• Use your regular footwear.";
    var text5 = "• Use your walking aid if already using one.";
    var text6 =
        "• Place the back of the chair against a wall so that it cannot slide backwards.";
    var text7 = "• Measure 3 meters from the front of the chair.";
    var text8 =
        "• Mark the 3 meters spot with a tape and place a bottle on the tape.";
    var text9 = "• Sit on the chair comfortably.";
    var text10 =
        "• Sit on the chair comfortably. Keep your feet flat on the floor and sit upright.";
    var text11 = "• Hold your mobile phone in your non dominant hand.";
    var text12 =
        "•	On “Start,”, press the Start timer on FallSA using your other hand while standing up from the chair.";
    var text13 =
        "•	Walk to the end of the line at your normal walking pace or safe and comfortable walking speed.";
    var text14 =
        "•	Turn around at the 3 meter end point and walk back to the chair and sit down again.";
    var text15 =
        "•	Press the STOP timer on FallSA when your buttock touch the seat.";
    var text16 =
        "•	Check your performance based on the normal range in the Timed up and Go chart.";
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // SizedBox(height: size.height * 0.06),
                Stack(
                  //alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/images/green_top.png",
                      width: 130,
                    ),
                    // Stroked text as border.
                    // Solid text as fill.
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 80, 10, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   "Test your mobility and balance performance.",
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 30,
                          //     color: Colors.black,
                          //   ),
                          //   textAlign: TextAlign.center,
                          // ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Instruction',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Align(
                                  child: audioIsOn
                                      ? IconButton(
                                          icon: Icon(Icons.stop),
                                          disabledColor: Colors.green[900],
                                          iconSize: 48,
                                          onPressed: () {
                                            _stopFile();
                                          },
                                        )
                                      : IconButton(
                                          icon: Icon(Icons.volume_up_sharp),
                                          disabledColor: Colors.green[900],
                                          iconSize: 48,
                                          onPressed: () {
                                            _playFile();
                                          },
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
                // Divider(
                //   height: 20,
                //   thickness: 5,
                // ),
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 15,
                  endIndent: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text1}",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text2}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text3}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text5}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text6}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text7}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text8}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text10}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text11}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text12}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text13}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text14}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text15}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${text16}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  indent: 15,
                  endIndent: 15,
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  child: audioIsOn
                      ? IconButton(
                          icon: Icon(Icons.stop),
                          disabledColor: Colors.green[900],
                          iconSize: 48,
                          onPressed: () async {
                            _stopFile();
                          },
                        )
                      : IconButton(
                          icon: Icon(Icons.volume_up_sharp),
                          disabledColor: Colors.green[900],
                          iconSize: 48,
                          onPressed: () {
                            _playFile();
                          },
                        ),
                ),
                Text(
                  "Click here to listen",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),

                ElevatedButton(
                  child: Text(
                    'Start Test',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.green[400],
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  ),
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      _stopFile();
                    });
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FirstAttempt(
                            walkingAid: widget.walkingAid,
                          );
                        },
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(240, 0, 0, 0),
                  child: Image.asset(
                    "assets/images/green_bottom.png",
                    width: 180,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[400],
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black), label: "Main Menu"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.black),
            label: 'Introduction',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

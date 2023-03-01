import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../MainMenu/nav.dart';
import 'fall_risk_introduction.dart';

class FallRiskVideo extends StatefulWidget {
  final int walkingAid;
  // final String gender;
  FallRiskVideo({
    Key? key,
    required this.walkingAid,
    // required this.gender,
  }) : super(key: key);

  @override
  State<FallRiskVideo> createState() => _FallRiskVideoState();
}

class _FallRiskVideoState extends State<FallRiskVideo> {
  final url = "https://youtu.be/WQn3m1BSStM";
  late YoutubePlayerController _controller;
  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        ));
  }

  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[];
  void _onItemTapped(int index) {
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
  void initState() {
    super.initState();
    runYoutubePlayer();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();

    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // SizedBox(height: size.height * 0.06),
                Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/green_top.png",
                      width: 130,
                    ),
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
                          Text(
                            "Test your mobility and balance performance.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),
                Center(
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _controller,
                    ),
                    builder: (context, player) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Instructional Video",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 38,
                                //fontFamily: 'Raleway',
                                color: Colors.black,
                              ),
                            ),
                            Divider(
                              height: 20,
                              thickness: 5,
                              indent: 15,
                              endIndent: 15,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "How to perform Timed Up GO (TUG) test.",
                              style: TextStyle(
                                //color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: player,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Text(
                  "Click here to view instructional video",
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
                    'Next',
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FallRiskIntroduction(
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

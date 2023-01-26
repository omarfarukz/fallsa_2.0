import 'package:fallsa/screens/components/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Quiz/1stQuiz/quiz1.dart';

class EducationVideoScreenFirst extends StatefulWidget {
  final url = "https://youtu.be/Zzwz0L2b3tU";
  @override
  _EducationVideoScreen createState() => _EducationVideoScreen();
}

class _EducationVideoScreen extends State<EducationVideoScreenFirst> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: false,
        ));
  }

  @override
  void initState() {
    super.initState();
    runYoutubePlayer();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  youTube(context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Center(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 220, 0),
                        child: Image.asset(
                          "assets/images/green_top.png",
                          width: 180,
                        ),
                      ),
                      Text(
                        "Falls Prevention Education",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 44,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Divider(
                        height: 20,
                        thickness: 5,
                        indent: 15,
                        endIndent: 15,
                      ),

                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "In this section, you are provided a quiz to test your knowledge about falls prevention. After which, you are required to watch an educational video that includes a few main aspects of falls prevention among older people. This video is evidence based and easy to understand. You are required to retest your knowledge by retaking the quiz about falls prevention after watching the video.",
                            style: TextStyle(
                              fontSize: 24,
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

                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(30),
                      //   child: player,
                      // ),

                      // Center(
                      //   child: YoutubePlayerBuilder(
                      //     player: YoutubePlayer(
                      //       controller: _controller,
                      //     ),
                      //     builder: (context, player) {
                      //       return Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(10),
                      //           child: player,
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),
                      RoundedButton(
                        text: "Next",
                        press: () {
                          deactivate();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Quiz1Screen();
                              },
                            ),
                          );
                        },
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(240, 70, 0, 0),
                      //   child: Image.asset(
                      //     "assets/images/green_bottom.png",
                      //     width: 180,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        child: youTube(context),
      ),
    );
  }
}

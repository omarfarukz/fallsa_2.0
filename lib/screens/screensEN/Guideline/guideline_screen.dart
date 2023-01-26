import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:fallsa/screens/screensEN/MainMenu/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GuidelineScreen extends StatefulWidget {
  //GuidelineScreen({Key? key}) : super(key: key);
  final url = "https://youtu.be/q2E1eFuX-8k";

  @override
  _GuidelineScreenState createState() => _GuidelineScreenState();
}

class _GuidelineScreenState extends State<GuidelineScreen> {
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
    runYoutubePlayer();

    super.initState();
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
      //margin: EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.center,
        children: [
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
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
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
                          "User Guidelines",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
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
                          height: 30,
                        ),
                        Text(
                          "How to Use FallSA",
                          style: TextStyle(
                            //color: Colors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: player,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            deactivate();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return NavScreen();
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.skip_next, color: Colors.black),
                          label: Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                            ),
                            primary: Colors.green[400],
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
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

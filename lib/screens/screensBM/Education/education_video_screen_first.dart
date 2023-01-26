import 'package:fallsa/screens/screensBM/Quiz/1stQuiz/quiz1.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_button.dart';

class EducationVideoScreenFirstBM extends StatefulWidget {
  // final url = "https://youtu.be/Zzwz0L2b3tU";
  @override
  _EducationVideoScreen createState() => _EducationVideoScreen();
}

class _EducationVideoScreen extends State<EducationVideoScreenFirstBM> {
  // YoutubePlayerController _controller;

  // void runYoutubePlayer() {
  //   _controller = YoutubePlayerController(
  //       initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
  //       flags: YoutubePlayerFlags(
  //         enableCaption: false,
  //         isLive: false,
  //         autoPlay: false,
  //       ));
  // }

  @override
  void initState() {
    super.initState();
    // runYoutubePlayer();
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // _controller.pause();
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 230, 0),
                        child: Image.asset(
                          "assets/images/green_top.png",
                          width: 180,
                        ),
                      ),
                      Text(
                        "Pendidikan mengenai Pencegahan Jatuh",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
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
                            "Dalam bahagian ini, anda disediakan kuiz untuk menguji pengetahuan anda tentang pencegahan jatuh. Selepas itu, anda dikehendaki menonton video pendidikan yang merangkumi beberapa aspek utama pencegahan jatuh dalam kalangan warga emas. Video ini berasaskan bukti dan mudah difahami. Anda dikehendaki menguji semula pengetahuan anda dengan mengulang kuiz tentang pencegahan jatuh selepas menonton video tersebut.",
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
                        text: "Seterusnya",
                        press: () {
                          deactivate();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Quiz1ScreenBM();
                              },
                            ),
                          );
                        },
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(240, 0, 0, 0),
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

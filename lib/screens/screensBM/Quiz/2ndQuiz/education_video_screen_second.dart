import 'package:fallsa/screens/components/rounded_button.dart';
import 'package:fallsa/screens/screensBM/Quiz/2ndQuiz/quiz1.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EducationVideoScreenSecondBM extends StatefulWidget {
  //GuidelineScreen({Key? key}) : super(key: key);
  final url = "https://youtu.be/fhZ_TJsVLNU";
  final quiz1Score;

  const EducationVideoScreenSecondBM({Key? key, this.quiz1Score})
      : super(key: key);

  @override
  _EducationVideoScreen createState() => _EducationVideoScreen();
}

class _EducationVideoScreen extends State<EducationVideoScreenSecondBM> {
  bool doneVideo = false;
  late YoutubePlayerController _controller;
  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: YoutubePlayerFlags(
          enableCaption: false,
          isLive: false,
          autoPlay: true,
          hideControls: true,
        ));
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
    Future.delayed(Duration(seconds: 451), () {
      setState(() {
        doneVideo = true;
      });
    });
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
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                  ),
                  builder: (context, player) {
                    return Container(
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
                            "Pendidikan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
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
                            height: 10,
                          ),
                          Center(
                            child: YoutubePlayerBuilder(
                              player: YoutubePlayer(
                                controller: _controller,
                              ),
                              builder: (context, player) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: player,
                                  ),
                                );
                              },
                            ),
                          ),
                          // Container(
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text(
                          //       "FallSA (Permohonan Saringan Jatuh) menawarkan kepada warga emas alat pemeriksaan kendiri untuk memaklumkan kajian berasaskan risiko jatuh yang dijalankan di Malaysia. Aplikasi ini berpotensi untuk mewujudkan kesedaran di kalangan warga emas tentang kepentingan saringan risiko awal jatuh supaya dapat membantu dalam proses rawatan dan pencegahan awal. Data dalam aplikasi mudah alih ini akan dikendalikan sebagai rekod perubatan seperti yang dinyatakan dalam Penafian Perlindungan Data dan Undang-undang Malaysia AKTA 709; Akta Perlindungan Data Peribadi 2010. Aplikasi mudah alih hanya memberitahu risiko kejatuhan dan tidak membuat diagnosis atau mencadangkan perubahan dos ubat semasa.",
                          //       style: TextStyle(
                          //         fontSize: 22,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //       textAlign: TextAlign.justify,
                          //     ),
                          //   ),
                          // ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          Text(
                            "Sila tonton video pendidikan. Anda tidak boleh melangkau video ini.",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Text(
                          //     "Tonton video berikut untuk belajar",
                          //     style: TextStyle(
                          //       //color: Colors.blue,
                          //       fontSize: 22,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          Divider(
                            height: 20,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(30),
                          //   child: player,
                          // ),
                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            child: doneVideo
                                ? RoundedButton(
                                    text: "Seterusnya",
                                    press: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return Quiz1ScreenBM2(
                                              quiz1Score: widget.quiz1Score,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  )
                                : Text(
                                    "",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
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

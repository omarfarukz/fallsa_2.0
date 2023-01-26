import 'package:fallsa/screens/components/rounded_button.dart';
import 'package:fallsa/screens/screensBM/StrengthTest/strength_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class StrengthTestIntroductionBM extends StatefulWidget {
  //GuidelineScreen({Key? key}) : super(key: key);
  final url = "https://youtu.be/GE6Com9DcDw";
  final quiz1Score;
  final String one = "test";

  const StrengthTestIntroductionBM({Key? key, this.quiz1Score})
      : super(key: key);

  @override
  _StrengthTestIntroduction createState() => _StrengthTestIntroduction();
}

class _StrengthTestIntroduction extends State<StrengthTestIntroductionBM> {
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
                    var text1 =
                        "1. 30 saat duduk dan bangun menguji kekuatan anggota bawah badan.";
                    var text2 =
                        "2. Untuk melakukan ujian ini, anda memerlukan sebuah kerusi dan jam randik di FallSA.";
                    var text3 =
                        "3. Rapatkan kerusi ke dinding supaya tidak bergerak ke belakang.";
                    var text4 =
                        "4. Duduk sedikit ke hadapan kerusi dan lipat lengan ke dada.";
                    var text5 =
                        "5. Pastikan kaki anda rata di atas lantai dan duduk dengan posisi tegak.";
                    var text6 =
                        "6. Pemeriksa akan mulakan pemasa di FallSA dan apabila terdengar bunyi bip, berdiri tegak/sepenuhnya dan kemudian duduk semula secepat yang anda boleh. (Berdiri secara tidak betul tidak akan dikira.)";
                    var text7 = "7. Ulang pergerakan ini dalam tempoh 30 saat.";
                    var text8 =
                        "8. Sekiranya anda perlu rehat, anda boleh berbuat demikian tetapi masa akan terus berjalan.";
                    var text9 =
                        "9. Sekiranya anda tidak dapat berdiri walaupun sekali, skor ujian adalah '0' (kosong).";
                    var text10 =
                        "10. Sekiranya anda berada separah berdiri pada akhir tempoh 30 saat, hitung sebagai satu kiraan berdiri.";
                    var text11 =
                        "11. Masukkan bilangan berdiri dalam tempoh 30 saat di FallSA untuk menyemak prestasi anda berdasarkan carta julat normal dalam ujian duduk dan bangun.";
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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Uji kekuatan otot anggota bawah anda.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "${text1}",
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
                                "${text4}",
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
                                "${text9}",
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
                          Divider(
                            height: 20,
                            thickness: 1,
                            indent: 15,
                            endIndent: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Tonton video berikut untuk belajar",
                              style: TextStyle(
                                //color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: player,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RoundedButton(
                            text: "Seterusnya",
                            press: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CountDownTimerBM();
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

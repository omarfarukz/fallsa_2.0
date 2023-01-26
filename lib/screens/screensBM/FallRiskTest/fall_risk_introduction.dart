import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../MainMenu/nav.dart';
import 'first_attempt.dart';

class FallRiskIntroductionBM extends StatefulWidget {
  final int walkingAid;
  final url = "https://youtu.be/TUDr3On4iPc";
  const FallRiskIntroductionBM({
    required this.walkingAid,
  });
  @override
  _FallRiskIntroductionState createState() => _FallRiskIntroductionState();
}

class _FallRiskIntroductionState extends State<FallRiskIntroductionBM> {
  late AudioCache _audioCache;
  late AudioPlayer playerAudio;
  bool audioIsOn = false;
  late YoutubePlayerController _controller;

  void _playFile() async {
    // playerAudio = await _audioCache.play('tugbm.mp3'); // assign player here
    // playerAudio = await _audioCache.loadAsFile('tugbm.mp3');

    setState(() {
      audioIsOn = true;
    });
  }

  void _stopFile() {
    playerAudio.stop();
    setState(() {
      audioIsOn = false;
    });
    // stop the file like this
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
          builder: (context) => NavScreenBM(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    _audioCache = AudioCache(
      prefix: "audio/",
      // fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP),
    );
  }

  @override
  Widget build(BuildContext context) {
    var text1 = "fungsi pergerakan";
    var text2 =
        "• Untuk menjalankan ujian ini, anda memerlukan sebuah kerusi piawai, pita pengukur untuk menandakan jarak laluan 3 meter, dan sebuah botol untuk menandakan titik akhir 3 meter.";
    var text3 =
        "• Anda juga memerlukan pemasa FallSA anda. Gunakan kasut yang biasa anda pakai.";
    var text4 =
        "• Gunakan alat bantuan berjalan sekiranya anda sedia ada mengunakan alat tersebut.";
    var text5 =
        "• Gunakan alat bantu berjalan sekiranya anda sedia ada mengunakan alat tersebut.";
    var text6 =
        "• Rapatkan bahagian belakang kerusi pada dinding supaya tidak bergerak ke belakang.";
    var text7 = "• Ukur 3 meter dari bahagian depan kerusi.";
    var text8 =
        "• Tandakan jarak 3 meter dengan pita dan letakkan botol pada pita tersebut.";
    var text9 =
        "• Duduk di kerusi dengan selesa. Pastikan kaki anda rata di atas lantai dan duduk tegak";
    var text10 = "• Pegang telefon bimbit anda di tangan yang tidak dominan.";
    var text11 =
        "• Pada 'Mula', tekan pemasa Mula di FallSA menggunakan tangan sebelah sambil berdiri dari kerusi.";
    var text12 =
        "•	Berjalan ke hujung garisan akhir dengan langkah berjalan biasa atau kelajuan berjalan yang selamat dan selesa.";
    var text13 =
        "•	Pusing pada titik akhir 3 meter dan berjalan kembali ke kerusi dan duduk semula.";
    var text14 =
        "•	Tekan pemasa TAMAT pada FallSA ketika punggung anda menyentuh tempat duduk.";
    var text15 =
        "•	Periksa prestasi anda berdasarkan julat normal dalam carta Timed up and Go.";
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
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
                            height: 20,
                          ),
                          // Text(
                          //   "Uji prestasi mobiliti dan kestabilan badan anda.",
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 30,
                          //     color: Colors.black,
                          //   ),
                          //   textAlign: TextAlign.center,
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Arahan',
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
                Divider(
                  height: 20,
                  thickness: 5,
                  indent: 15,
                  endIndent: 15,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "• Ujian",
                        style: TextStyle(
                          //color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        "  Timed   Up  and  Go",
                        style: TextStyle(
                          //color: Colors.blue,
                          fontSize: 22,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        "   menguji",
                        style: TextStyle(
                          //color: Colors.blue,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      "fungsi  pergerakan",
                      style: TextStyle(
                        //color: Colors.blue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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
                Text(
                  "Klik di sini untuk mendengar",
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
                    'Mulakan Ujian',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                    primary: Colors.green[400],
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  ),
                  onPressed: () {
                    _stopFile();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return FirstAttemptBM(
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
              icon: Icon(Icons.home, color: Colors.black), label: "Menu utama"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.black),
            label: 'Pengenalan',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

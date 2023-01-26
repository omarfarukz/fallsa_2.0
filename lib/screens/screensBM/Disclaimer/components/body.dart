import 'package:fallsa/screens/screensBM/Guideline/guideline_screen.dart';
import 'package:fallsa/screens/screensEN/Disclaimer/disclaimer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../screensEN/Disclaimer/components/background.dart';

class BodyBM extends HookWidget {
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
                        "BM",
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
                                builder: (context) => DisclaimerScreen()));
                      },
                      child: Text(
                        "/  EN",
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
                    "Penafian",
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "FallSA (Saringan Risiko Jatuh) menawarkan kepada warga emas alat pemeriksaan kendiri untuk memaklumkan risiko jatuh berdasarkan kajian yang dijalankan di Malaysia. Aplikasi ini berpotensi untuk mewujudkan kesedaran dalam kalangan warga emas tentang kepentingan pemeriksaan awal risiko jatuh supaya dapat membantu dalam proses rawatan dan pencegahan awal. Data dalam aplikasi mudah alih ini akan dikendalikan sebagai rekod perubatan seperti yang dinyatakan dalam Penafian Perlindungan Data dan Undang-Undang Malaysia AKTA 709; Akta Perlindungan Data Peribadi 2010. Aplikasi mudah alih hanya memberitahu risiko jatuh dan tidak membuat diagnosis atau mencadangkan perubahan dos ubat semasa. Data dalam aplikasi ini akan digunakan untuk tujuan penyelidikan.",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.justify,
                              // overflow: TextOverflow.visible,
                            ),
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
                            return GuidelineScreenBM();
                          },
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.check_box_outlined,
                      color: Colors.black,
                    ),
                    label: Text(
                      "Setuju dan teruskan",
                      style: TextStyle(color: Colors.black, fontSize: 22),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      primary: Colors.green[400],
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

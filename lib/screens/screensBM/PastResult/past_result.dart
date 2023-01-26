import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/screensBM/PastResult/pasDb.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PastResultScreenBM extends StatefulWidget {
  @override
  _PastResultScreen createState() => _PastResultScreen();
}

class _PastResultScreen extends State<PastResultScreenBM> {
  final List<String> imgList = [
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
    'https://static.bhphoto.com/images/images500x500/Savage_46_12_107_x_12yds_Background_1157995639_45497.jpg',
  ];
  List data = [];
  List strengthData = [];

  // final DateTime now = DateTime.now();
  late DateTime dateTime;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  late String formatted;
  // String uid;
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    // User user = FirebaseAuth.instance.currentUser;
    getData();
    // getUID();
    PastDb().getData(user!.uid).then((QuerySnapshot docs) {
      // print(docs);
      // if (docs.docs.isNotEmpty) {
      //   test = docs.docs[0].data();

      setState(() {
        data = docs.docs;
      });
      //
      // print(data[1]['correct']);
      // print(data.length);

      // }
    });
    //Strength Data
    PastDb().getStrength(user.uid).then((QuerySnapshot docs) {
      // print(docs);
      // if (docs.docs.isNotEmpty) {
      //   test = docs.docs[0].data();
      try {
        setState(() {
          strengthData = docs.docs;
        });

        // print(strengthData[1]['score']);
        //print(strengthData.length);
      } catch (e) {
        print(e);
      }

      // }
    });
    Future.delayed(Duration(seconds: 1), () {
      super.initState();
    });
  }

  getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final ic = sharedPreferences.getString("ic");
    final name = sharedPreferences.getString("name");
    print(name);
    print(ic);
  }

  // Future getUID() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainUID = sharedPreferences.getString("uid");
  //   setState(() {
  //     uid = obtainUID;
  //     print("Here is the UID : $uid");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // formatted=formatter.format(now);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.lightGreen[50],
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green[300],
            title: Text(
              "Keputusan lepas",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                  fontWeight: FontWeight.bold),
            ),
            leading: BackButton(
              color: Colors.black,
            ),
          ),
          body: Column(
            children: [
              TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      'Keputusan risiko jatuh',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Ujian kekuatan   otot',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(16.0),
                      ),
                      child: Ink(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Ink(
                                child: Container(
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    color: Colors.green[200],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // need total three values, 1.Date, 2. Score, 3. Based on the score we display the risk factor
                                      Text(
                                        // formatted,
                                        DateFormat('yyyy-MM-dd').format(
                                            data[index]["dateTime"].toDate()),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index]['score'].toString(),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data[index]['risk'],
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Ink(
                        child: ListView.builder(
                          itemCount: strengthData.length,
                          itemBuilder: (ctx, index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Ink(
                                child: Container(
                                  decoration: new BoxDecoration(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    color: Colors.green[200],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      // need total two values, 1.Date, 2. Score
                                      Text(
                                        // formatted,
                                        DateFormat('yyyy-MM-dd').format(
                                            strengthData[index]["dateTime"]
                                                .toDate()),
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${strengthData[index]['score'].toString()} Times",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

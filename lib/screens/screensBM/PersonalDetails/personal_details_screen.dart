import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/backgroundGeneral.dart';

class PersonalDetailsScreen extends StatefulWidget {
  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  // String uid;
  // //const PersonalDetailsScreen({Key? key}) : super(key: key);
  // Future getUID() async {
  //   final SharedPreferences sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   var obtainUID = sharedPreferences.getString("uid");
  //   setState(() {
  //     uid = obtainUID;
  //     print("Here is the UID : $uid");
  //   });
  // }
  User? user = FirebaseAuth.instance.currentUser;
  String name = '';
  String id = "";
  String ic = "";
  String phone = '';
  String doctor = "";
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    // getUID();
    readGender();
    super.initState();
  }

  readGender() async {
    User? user = FirebaseAuth.instance.currentUser;
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('userDetails')
        .doc(user?.uid); //reading the current user uid
    print(documentReference);
    await documentReference.get().then((value) {
      final data = value;

      setState(() {
        name = data['name'];
        ic = data['ic'];
        id = data["uid"];
        phone = data['number'];
        doctor = data['dUid'];
      });
    });
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: BackgroundGeneral(
        child: ListView(
          children: [
            isLoading
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 120),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.green[700]!,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipOval(
                              child: Image(
                                height: 100,
                                width: 100,
                                image: AssetImage(
                                  "assets/images/img_avatar2.png",
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   "User Full Name",
                            //   style: TextStyle(
                            //     fontSize: 22,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   "IC No: 983565545646",
                            //   style: TextStyle(
                            //     fontSize: 22,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Text(
                            //   "Age: 58",
                            //   style: TextStyle(
                            //     fontSize: 22,
                            //     fontWeight: FontWeight.bold,
                            //   ),
                            // ),
                            // Center(
                            //   child: FutureBuilder(
                            //       future: FirebaseFirestore.instance
                            //           .collection('userDetails')
                            //           .doc(user.uid)
                            //           .get(),
                            //       builder: (context, snapshot) {
                            //         if (snapshot.connectionState ==
                            //                 ConnectionState.waiting ||
                            //             !snapshot.hasData) {
                            //           return Text('Loading...');
                            //         }
                            //         if (!snapshot.hasData) {
                            //           CircularProgressIndicator();
                            //         }
                            //         return Column(children: [
                            //           Text(
                            //             snapshot.data['name'],
                            //             style: TextStyle(
                            //                 fontWeight: FontWeight.bold,
                            //                 fontSize: 24),
                            //           ),
                            //           Text(
                            //             snapshot.data['ic'],
                            //             style: TextStyle(
                            //               fontSize: 22,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //           Text(
                            //             "Age: 58",
                            //             style: TextStyle(
                            //               fontSize: 22,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ]);
                            //       }),
                            // ),
                            Center(
                              child: Column(children: [
                                Text(
                                  "Name: $name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "IC: $ic",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Patiant id: $id",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Contact:$phone",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  "Doctor Id: $doctor",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                              ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   color: Colors.green[500],
            //   height: 35,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 16),
            //     child: Text(
            //       "Recent Test",
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: 80,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(
            //         color: Colors.green[700],
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Icon(
            //               Icons.history,
            //               size: 80,
            //             ),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   "Fall Risk",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 25),
            //                 ),
            //                 Text(
            //                   "Date",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 18),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Text(
            //                 "High",
            //                 style: TextStyle(
            //                     color: Colors.green[500],
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 25),
            //               ),
            //               Text(
            //                 "87%",
            //                 style: TextStyle(
            //                     color: Colors.green[500],
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 25),
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8, right: 8),
            //   child: Container(
            //     height: 80,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(
            //         color: Colors.green[700],
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Icon(
            //               Icons.elderly,
            //               size: 80,
            //             ),
            //             Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   "Strength ",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 25),
            //                 ),
            //                 Text(
            //                   // DateFormat('dd-MM-yyyy').format(dateTime),
            //                   "Date",
            //                   style: TextStyle(
            //                       fontWeight: FontWeight.bold, fontSize: 18),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8),
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //             children: [
            //               Text(
            //                 "Low",
            //                 style: TextStyle(
            //                     color: Colors.red,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 25),
            //               ),
            //               Text(
            //                 "67%",
            //                 style: TextStyle(
            //                     color: Colors.red,
            //                     fontWeight: FontWeight.bold,
            //                     fontSize: 25),
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   width: 10,
            //   alignment: Alignment.center,
            //   color: Colors.green[700],
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Icon(Icons.logout),
            //       Text(
            //         "LogOut",
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            //       ),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class $ {}

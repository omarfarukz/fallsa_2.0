//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fallsa/screens/PastResult/pasDb.dart';
// import 'package:flutter/material.dart';
//
//
// class PastTest extends StatefulWidget {
//   // const PasrtTest({Key? key}) : super(key: key);
//
//   @override
//   _PastTestState createState() => _PastTestState();
// }
//
// class _PastTestState extends State<PastTest> {
//   var test;
//   @override
//   void initState() {
//     super.initState();
//     PastDb()
//         .getData('a6Zto5xnPcP5WE6yLHzcRq4i9Qn1')
//         .then((QuerySnapshot docs) {
//           print(docs);
//       // if (docs.docs.isNotEmpty) {
//       //   test = docs.docs[0].data();
//       test=docs.docs;
//
//         print(test[1]['correct']);
//         print(test.length);
//
//       // }
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//     children:[
//       Expanded(
//     child:ListView.builder(
//     itemCount: test.length,
//     //     itemBuilder:(context,index){
//     //   return Text(test[index]['correct'].toString());
//     // }
//       itemBuilder: (ctx, index) {
//         return Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Ink(
//             child: Container(
//               decoration: new BoxDecoration(
//                 borderRadius:
//                 new BorderRadius.circular(20.0),
//                 color: Colors.green[200],
//               ),
//               child: Row(
//                 mainAxisAlignment:
//                 MainAxisAlignment.spaceAround,
//                 children: [
//                   // need total three values, 1.Date, 2. Score, 3. Based on the score we display the risk factor
//                   Text(
//                     // formatted,
//                     test[index]["prequiz"].toString(),
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     test[index]["correct"].toString(),
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     test[index]["wrong"].toString(),
//                     style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 50,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//
//     ),
//     ),
//     //   Text(test['correct'].toString()),
//
//
//
//         ]
//
//     ),
//
//     )
//     );
//   }
// }

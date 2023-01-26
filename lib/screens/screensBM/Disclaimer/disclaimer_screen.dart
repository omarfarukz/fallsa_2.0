import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class DisclaimerScreenBM extends StatefulWidget {
  @override
  State<DisclaimerScreenBM> createState() => _DisclaimerScreenState();
}

class _DisclaimerScreenState extends State<DisclaimerScreenBM> {
  @override
  void initState() {
    print("Here");
    syncData();
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;
  syncData() async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('userDetails').doc(user!.uid);
    //reading the current user uid
    await documentReference.get().then((value) {
      final data = value;

      final name = data['name'];
      final ic = data['ic'];
      Future.delayed(Duration(seconds: 1), () async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("name", name.toString());
        sharedPreferences.setString("ic", ic.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.lightGreen[50],
        body: BodyBM(),
      ),
    );
  }
}

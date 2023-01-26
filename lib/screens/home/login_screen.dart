import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fallsa/screens/screensEN/Disclaimer/disclaimer_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/loading.dart';
import 'already_have_an_account.dart';
import 'home_screen.dart';
import 'signup_scree.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  TextEditingController pincontroller = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;
  bool isLoading = false;
  List<dynamic> docs = [];

  @override
  void initState() {
    super.initState();
  }

  _showdialog() {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text(
          'You Are Not Registered',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        content: Text(
          "Please register first before login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      // _scaffoldKey.currentState!
      //     .showSnackBar(SnackBar(content: Text(e.message)));//check here
    }
  }

  phoneAuth() async {
    await _auth.verifyPhoneNumber(
      phoneNumber: "+6${phoneController.text}",
      timeout: const Duration(seconds: 120),
      verificationCompleted: (PhoneAuthCredential credential) async {
        setState(() {
          isLoading = true;
        });
        var result = await _auth.signInWithCredential(credential);

        User? user = result.user;
        final document =
            FirebaseFirestore.instance.collection("userDetails").doc(user?.uid);

        final documentSnapshot = await document.get();

        if (!documentSnapshot.exists) {
          setState(() {
            isLoading = false;
          });
          _showdialog();
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          });
        } else {
          if (user != null) {
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setString("uid", user.uid.toString());
            setState(() {
              isLoading = false;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => DisclaimerScreen()));
          }
        }
      },
      verificationFailed: (FirebaseAuthException excption) {
        print(excption);
      },
      codeSent: (verificationID, resendToken) async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('OTP'),
                content: Column(
                  children: [
                    TextField(
                      controller: pincontroller,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var smscode = pincontroller.text;
                        setState(() {
                          isLoading = true;
                        });
                        PhoneAuthCredential phoneAuthCredential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationID,
                                smsCode: smscode);
                        var result = await _auth
                            .signInWithCredential(phoneAuthCredential);
                        User? user = result.user;
                        final document = FirebaseFirestore.instance
                            .collection("userDetails")
                            .doc(user?.uid);
                        final documentSnapshot = await document.get();

                        if (!documentSnapshot.exists) {
                          setState(() {
                            isLoading = false;
                          });
                          _showdialog();
                          Future.delayed(const Duration(seconds: 3), () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          });
                        } else {
                          if (user != null) {
                            final SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setString(
                                "uid", user.uid.toString());
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DisclaimerScreen()));
                          }
                        }
                      },
                      child: const Text("Submit"),
                    ),
                  ],
                ),
              );
            });
      },
      codeAutoRetrievalTimeout: (String verificationID) {},
    );
  }

  getMobileFormWidget(context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/green_top.png",
              width: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 450, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/ukm_logo.png",
                  width: 160,
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "assets/images/hcare_logo.png",
                  width: 160,
                ),
              ],
            ),
          ),
          Center(
            child: ListView(
              children: [
                const Center(child: SizedBox(height: 50)),
                const SizedBox(height: 50),
                Image.asset(
                  "assets/images/menu_yellow_jacket.png",
                  width: 0,
                  height: 220,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    autofocus: false,
                    enabled: true,
                    controller: phoneController,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.fromLTRB(20, 0, 0, 0),
                      hintText: "Phone Number",
                      hintStyle: const TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[50],
                    ),
                    style: const TextStyle(fontSize: 22.0, color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   isLoading = true;
                      // });
                      phoneAuth();
                    },
                    // ignore: sort_child_properties_last
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        primary: Colors.green[400],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        textStyle: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 170,
                ),
                const Center(
                  child: Text(
                    "©️ ALL RIGHTS RESERVED",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Center(
                  child: Text(
                    "UNIVERSITI KEBANGSAAN MALAYSIA 2022",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        const Spacer(),
        TextField(
          controller: otpController,
          decoration: const InputDecoration(
            hintText: "Enter OTP",
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        TextButton(
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          // color: Colors.blue,
          // textColor: Colors.white,
          style: TextButton.styleFrom(
              foregroundColor: Colors.blue,
              textStyle: const TextStyle(color: Colors.white)),
          child: const Text("VERIFY"),
        ),
        const Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loading(
            key: null,
          )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.lightGreen[50],
            key: _scaffoldKey,
            body: Container(
              child: showLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : currentState ==
                          MobileVerificationState.SHOW_MOBILE_FORM_STATE
                      ? getMobileFormWidget(context)
                      : getOtpFormWidget(context),
              // padding: const EdgeInsets.all(16),
            ));
  }
}

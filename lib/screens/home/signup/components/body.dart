import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../components/rounded_button.dart';
import '../../../components/rounded_input_field.dart';
import '../../../screensEN/Guideline/guideline_screen.dart';
import '../../already_have_an_account.dart';
import '../../login_screen.dart';
import 'background.dart';
import 'custom_drop_down.dart';
import 'custom_drop_down_education.dart';
import 'custom_drop_down_states.dart';

User? user;
bool isLoading = false;

class Body extends HookWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController name = useTextEditingController(text: "");
    final TextEditingController ic = useTextEditingController(text: "");
    final TextEditingController phoneNumber =
        useTextEditingController(text: "");
    final TextEditingController state = useTextEditingController();
    final TextEditingController gender = useTextEditingController();
    final TextEditingController education = useTextEditingController();
    final TextEditingController address1 = useTextEditingController(text: "");
    final TextEditingController address2 = useTextEditingController(text: "");
    final TextEditingController postCode = useTextEditingController(text: "");
    final List<String> states = [
      "Johor",
      "Kedah",
      "Kelantan",
      "Malacca",
      "Negeri",
      "Sembilan",
      "Pahang",
      "Perak",
      "Perlis",
      "Sabah",
      "Sarawak",
      "Selangor",
      "Terengganu",
      "Federal Territory of KL",
      "Federal Territory of Labuan",
      "Federal Territory of Putrajaya"
    ];
    final List<String> genders = ["Male", "Female"];
    final List<String> educations = [
      "Primary",
      "Secondary",
      "Tertiary",
      "No Education"
    ];

    final auth = FirebaseAuth.instance;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    // final AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    final Size size = MediaQuery.of(context).size;
    TextEditingController pincontroller = TextEditingController();

    phoneAuth() async {
      // isLoading = true;
      await auth.verifyPhoneNumber(
        phoneNumber: "+6" + phoneNumber.text.toString(),
        timeout: const Duration(seconds: 120),
        verificationCompleted: (PhoneAuthCredential credential) async {
          var result = await auth.signInWithCredential(credential);
          User? user = result.user;
          if (user != null) {
            final SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            sharedPreferences.setString(
              "uid",
              user.uid.toString(),
            );
            sharedPreferences.setString(
              "name",
              name.text.toString(),
            );
            sharedPreferences.setString(
              "ic",
              ic.text.toString(),
            );
            await FirebaseFirestore.instance
                .collection('userDetails')
                .doc(user.uid)
                .set({
              'number': phoneNumber.text,
              'name': name.text,
              'ic': ic.text,
              'dob': ic.text.substring(0, 6),
              'gander': gender.text,
              'adress1': address1.text,
              'adress2': address2.text,
              'phonenumber': phoneNumber.text,
              'postcode': postCode.text,
              'state': state.text,
              'education': education.text,
              'dUid': "Not assign yet",
              'uid': user.uid,
            });
            isLoading = false;
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => GuidelineScreen()));
          }
        },
        verificationFailed: (FirebaseAuthException excption) {
          print(excption);
        },
        codeSent: (verificationID, resendToken) {
          isLoading = false;
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Enter the code'),
                  content: Column(
                    children: [
                      TextField(
                        controller: pincontroller,
                      ),
                      ElevatedButton(
                          child: const Text('Submit'),
                          onPressed: () async {
                            var smscode = pincontroller.text;
                            PhoneAuthCredential phoneAuthCredential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationID,
                                    smsCode: smscode);
                            var result = await auth
                                .signInWithCredential(phoneAuthCredential);
                            User? user = result.user;
                            if (user != null) {
                              await FirebaseFirestore.instance
                                  .collection('userDetails')
                                  .doc(user.uid)
                                  .set({
                                'number': phoneNumber.text,
                                'name': name.text,
                                'ic': ic.text,
                                'dob': ic.text.substring(0, 6),
                                'gander': gender.text,
                                'adress1': address1.text,
                                'adress2': address2.text,
                                'phonenumber': phoneNumber.text,
                                'postcode': postCode.text,
                                'state': state.text,
                                'education': education.text,
                                'dUid': "Not assign yet",
                                'uid': user.uid,
                              });
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => GuidelineScreen()));
                            }
                          })
                    ],
                  ),
                );
              });
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
      );
    }

    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: AssetImage("assets/images/oldlady.png"),
                ),
              ),
              RoundedInputField(
                name,
                hintText: "Full name",
              ),
              RoundedInputField(
                ic,
                hintText: "IC number",
              ),
              CustomDropDown(
                colors: Colors.black,
                options: genders,
                title: "Gender",
                controller: gender,
              ),
              CustomDropDownEdu(
                colors: Colors.black,
                options: educations,
                title: "Education",
                controller: education,
              ),
              RoundedInputField(
                address1,
                hintText: "Address 1",
                inputType: InputFieldType.address1,
              ),
              RoundedInputField(
                address2,
                hintText: "Address 2",
                inputType: InputFieldType.address2,
              ),
              RoundedInputField(
                phoneNumber,
                hintText: "Phone Number",
                inputType: InputFieldType.phone,
              ),
              RoundedInputField(
                postCode,
                hintText: "Post Code",
              ),
              CustomDropDownStates(
                colors: Colors.black,
                options: states,
                title: "States",
                controller: state,
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () async {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Sending data to database")));
                  isLoading = true;

                  phoneAuth();
                },
              ),
              SizedBox(height: size.height * 0.01),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}

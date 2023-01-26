import 'package:fallsa/screens/screensEN/MainMenu/nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: child,
        );
      },

      child: const InitializerWidget(),
    );
  }
}

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({super.key});

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  bool isLoading = true;
  String uid = "4";
  @override
  void initState() {
    super.initState();
    // _auth = FirebaseAuth.instance;
    // var _auth;
    // _user = _auth.currentUser;
    getUID();
    isLoading = false;
  }

  Future getUID() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainUID = sharedPreferences.getString("uid");
    setState(() {
      uid = obtainUID!;
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   // return LoginScreen();
  //   if (isLoading) {
  //     return const Scaffold(
  //       body: Center(
  //         child: CircularProgressIndicator(),
  //       ),
  //     );
  //   } else {
  //     // if (uid == null) {
  //     return LoginScreen();
  //     // } else {
  //     //   return NavScreen();
  //     // }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : uid == null
            ? LoginScreen()
            : NavScreen();
  }
}

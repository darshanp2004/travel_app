import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/bottom_navigation_screen.dart';
import 'package:travel_app/login_screen.dart';
import 'package:travel_app/utils/imageResources.dart';
import 'package:travel_app/utils/string.dart';
import 'main.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => SplashscreenState();
}

class SplashscreenState extends State<splashScreen> {
  static const String KEYLOGIN = loginKey;

  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Image.asset(
        splash_image,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Timer(Duration(seconds: 3), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => bottomNavigationbarScreen()),
          );
        }
        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => loginScreen()),
          );
        }
      }
      else{
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => loginScreen()),
        );
      }
    });
  }
}

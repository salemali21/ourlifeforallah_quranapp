import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourlifeforallah/screens/main_screen.dart';
import 'package:ourlifeforallah/screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool alreadyUsed = false;

  void getData()async{
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    alreadyUsed = prefs.getBool("alreadyUsed") ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    Timer(Duration(seconds: 5), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      return alreadyUsed ? mainScreen() : OnBoardingScreen(); })));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Text(
                'لا إله إلا الله محمد رسول الله',
                style: TextStyle(color: Colors.green, fontSize: 30),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('lib/assets/islamic.png'),
            ),
          ],
        ),
      ),
    );
  }
}

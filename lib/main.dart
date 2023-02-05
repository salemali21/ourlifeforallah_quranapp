import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ourlifeforallah/constants/constants.dart';
import 'package:ourlifeforallah/models/surah.dart';
import 'package:ourlifeforallah/screens/juz_screen.dart';
import 'package:ourlifeforallah/screens/splash_screen.dart';
import 'package:ourlifeforallah/models/sajda.dart';
import 'package:ourlifeforallah/models/juz.dart';
import 'package:ourlifeforallah/screens/surah_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Our Life For Allah',
        theme: ThemeData(
        primarySwatch: Constants.kSwatchColor,
        fontFamily: 'Lateef'
    ),
    home: SplashScreen(),
      routes: {
        JuzScreen.id:(context)=>JuzScreen(),
        Surahdetail.id:(context)=>Surahdetail(),
      },
    );
  }
}
 

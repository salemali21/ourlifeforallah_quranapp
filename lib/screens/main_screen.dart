import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ourlifeforallah/constants/constants.dart';
import 'package:ourlifeforallah/screens/home_screen.dart';
import 'package:ourlifeforallah/screens/prayer_screen.dart';
import 'package:ourlifeforallah/screens/qari_screen.dart';
import 'package:ourlifeforallah/screens/quran_screen.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({Key? key}) : super(key: key);

  @override
  State<mainScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<mainScreen> {
  int selectindex = 0;
  List<Widget> _widgetsList = [
    homeScreen(),
    QuranScreen(),
    QariListScreen(),
    prayerScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: _widgetsList[selectindex],
            bottomNavigationBar: ConvexAppBar(items: [
              TabItem(icon: Image.asset('lib/assets/home.png'), title: 'الرئيسية'),
              TabItem(icon: Image.asset('lib/assets/holyQuran.png'), title: 'القرآن الكريم'),
              TabItem(icon: Image.asset('lib/assets/audio.png'), title: 'الصوتيات'),
              TabItem(icon: Image.asset('lib/assets/mosque.png'), title: 'الصلوات'),
      ], initialActiveIndex: 0, onTap: updateIndex,
              backgroundColor: Constants.kPrimary,
              activeColor: Constants.kPrimary,
            )
        )
    );
  }
  void updateIndex(index){
    setState(() {
      selectindex = index;
    });
  }
}

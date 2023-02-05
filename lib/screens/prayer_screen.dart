import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class prayerScreen extends StatefulWidget {
  const prayerScreen({Key? key}) : super(key: key);

  @override
  State<prayerScreen> createState() => _prayerScreenState();
}

class _prayerScreenState extends State<prayerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Text('Prayer Screen'),
        ),
      ),
    );
  }
}

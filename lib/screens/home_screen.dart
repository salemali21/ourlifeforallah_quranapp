import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:ourlifeforallah/models/aya_of_the_day.dart';
import 'package:ourlifeforallah/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  ApiServices _apiServices = ApiServices();
  void setData()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("alreadyUsed", true);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    var _hijri = HijriCalendar.now();
    HijriCalendar.setLocal('ar');
    var day = DateTime.now();
    var format = DateFormat('EEE , d MMM yyyy');
    var formatted = format.format(day);
    return SafeArea(
      child: Scaffold(
          body: Column(
           children: [
             Container(
              height: _size.height * 0.22,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/assets/background_img.jpg'))),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatted,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    RichText(
                      text: TextSpan(children: <InlineSpan>[
                        WidgetSpan(
                          style: TextStyle(fontSize: 25),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.hDay.toString(),
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Text(
                              _hijri.longMonthName,
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: EdgeInsets.all(4),
                            child: Text(
                              '${_hijri.hYear} هجريا ',
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                          ),
                          style: TextStyle(fontSize: 25),
                        ),
                      ]),
                    ),
                  ]))
              ,Expanded(
              child: SingleChildScrollView(
              padding: EdgeInsetsDirectional.only(top :10,bottom: 20 ),
                child: Column(
                  children: [
                    FutureBuilder<AyaOfTheDay>(
                      future: _apiServices.getAyaOfTheDay(),
                      builder: (context,snapshot){
                        switch(snapshot.connectionState){
                          case ConnectionState.none:
                            return Icon(Icons.sync_problem);
                          case ConnectionState.waiting:
                          case ConnectionState.active:
                            return CircularProgressIndicator();
                          case ConnectionState.done:
                            return  Container(
                                margin: EdgeInsetsDirectional.all(16),
                                padding: EdgeInsetsDirectional.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.green,
                                  boxShadow : [
                                  BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: Offset(0,1),
                                  )
                                ]
                                ),
                                child: Column(
                                    children: [Text("أيه اليوم",
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                      Divider(color: Colors.white,thickness: 0.5,),
                                      Text(snapshot.data!.arText!,
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,),
                                      Divider(color: Colors.white,thickness: 0.5,),
                                      Text(snapshot.data!.enTran!,
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,),
                                      Divider(color: Colors.white,thickness: 0.5,),
                                      RichText(
                                        text: TextSpan(
                                            children: <InlineSpan>[
                                              WidgetSpan(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(snapshot.data!.surArName!,selectionColor: Colors.white,),
                                                ),
                                              ),
                                              WidgetSpan(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Text(snapshot.data!.surNumber!.toString(),selectionColor: Colors.white,),
                                                ),
                                              ),
                                            ]
                                        ),
                                      )
                                    ]
                                )
                            );
                        }
                    },
                    )
                  ],
                ),

              ),
              )],
      )),
    );
  }
}

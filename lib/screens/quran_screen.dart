import 'package:flutter/material.dart';
import 'package:ourlifeforallah/constants/constants.dart';
import 'package:ourlifeforallah/models/surah.dart';
import 'package:ourlifeforallah/screens/juz_screen.dart';
import 'package:ourlifeforallah/screens/surah_detail.dart';
import 'package:ourlifeforallah/services/api_services.dart';
import 'package:ourlifeforallah/widgets/surah_custom_tile.dart';

import '../models/sajda.dart';
import '../widgets/sajda_custom_tile.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: 0,
        child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text('القرأن الكريم'),
                centerTitle: true,
                bottom: TabBar(
                  tabs: [
                    Text(
                      'السورة',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    Text(
                      'سجدة',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    Text(
                      'الجزء',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                  children: <Widget>[
               FutureBuilder(
              future: apiServices.getSurah(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Surah>> snapshot) {
                if (snapshot.hasData) {
                  List<Surah>? surah = snapshot.data;
                  return ListView.builder(
                    itemCount: surah!.length,
                    itemBuilder: (context, index) =>
                        SurahCustomListTile(
                            surah: surah[index],
                            context: context,
                            ontap: () {
                              setState(() {
                                Constants.surahIndex = (index + 1);
                              });
                              Navigator.pushNamed(context, Surahdetail.id);
                            }),
                  );
                }
                return Center(child: CircularProgressIndicator(),);
              },
            ),
               FutureBuilder(
                 future: apiServices.getSajda(),
                 builder: (context,AsyncSnapshot<SajdaList> snapshot){
                   if (snapshot.hasError){
                     return Center(child: Text('حدث خطأ ما'),);
                   }
                   if(snapshot.connectionState == ConnectionState.waiting){
                     return Center(child: CircularProgressIndicator(),);
                   }
                   return ListView.builder(
                   itemCount: snapshot.data!.sajdaAyahs.length,
                   itemBuilder: (context , index) => SajdaCustomTile(snapshot.data!.sajdaAyahs[index], context),
                   );
                 },
               ),
               GestureDetector(
                child: Container(
                 padding: EdgeInsets.all(8.0),
                 child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: 30, itemBuilder: (context,index) {
                       return GestureDetector(
                       onTap: (){
                       setState(() {
                       Constants.juzIndex = (index + 1);
                       });
                       Navigator.pushNamed(context, JuzScreen.id);
                       },
                          child: Card(
                            elevation: 4,
                            color: Colors.green,
                            child: Center(
                               child:  Text('${index+1}',style: TextStyle(color: Colors.white,fontSize: 20),),
                            ),
                          ),
                        );
                      }
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

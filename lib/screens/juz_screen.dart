import 'package:flutter/material.dart';
import 'package:ourlifeforallah/constants/constants.dart';
import 'package:ourlifeforallah/models/juz.dart';
import 'package:ourlifeforallah/services/api_services.dart';
import 'package:ourlifeforallah/widgets/juz_custom_tile.dart';

class JuzScreen extends StatelessWidget {
  static const String id = 'juz_screen';
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<JuzModel>(
            future: apiServices.getJuz(Constants.juzIndex!),
            builder: (context, AsyncSnapshot<JuzModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(),);
              } else if (snapshot.hasData) {
                print('${snapshot.data!.juzAyahs.length} length');
                return ListView.builder(
                  itemCount: snapshot.data!.juzAyahs.length,
                  itemBuilder: (context, index) {
                    return JuzCustomTile(list: snapshot.data!.juzAyahs, index: index,);
                  },
                );
              } else {
                return Center(
                  child: Text('خطأ فى جلب البيانات'),
                );
              }
            }),
      ),
    );
  }
}

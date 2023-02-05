import 'dart:convert';
import 'dart:math';
import 'package:ourlifeforallah/models/aya_of_the_day.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:ourlifeforallah/models/qari.dart';
import 'package:ourlifeforallah/models/surah.dart';
import 'package:ourlifeforallah/models/translation.dart';
import '../models/sajda.dart';
import 'package:ourlifeforallah/models/juz.dart';

class ApiServices {
  final endPointUrl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<AyaOfTheDay> getAyaOfTheDay() async {
    String url =
        "http://api.alquran.cloud/v1/ayah/${random(1, 6236)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print("مشكله فى التحميل");
      throw Exception("مشكله فى نحميل البيانات");
    }
  }
  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async {
    Response res = await http.get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      print('ol ${list.length}');
      return list;
    }else{
      throw ('هناك عطل فى جلب البيانات');
    }
  }
  Future<SajdaList> getSajda() async{
        String url = "http://api.alquran.cloud/v1/sajda/en.asad";
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 200){
          return SajdaList.fromJSON(json.decode(response.body));
        } else {
          print("مشكله فى التحميل");
          throw Exception("مشكله فى نحميل البيانات");
        }
  }
  Future<JuzModel> getJuz(int index) async{
    String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response = await http.get(Uri.parse(url));
    print (response.body);
    if (response.statusCode == 200){
     return JuzModel.fromJSON(json.decode(response.body));
    }
    else{
      print("مشكله فى التحميل");
      throw Exception("مشكله فى نحميل البيانات");
    }
  }
  Future<SurahTranslationList> getTranslation(int index) async{
    final url = "https://quranenc.com/api/v1/translation/sura/english_saheeh/$index";
    var res = await http.get(Uri.parse(url));
    return SurahTranslationList.fromJson(json.decode(res.body));
  }


  List<Qari> qarilist = [];

  Future<List<Qari>> getQariList()async{
    final url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));

    jsonDecode(res.body).forEach((element){
      if(qarilist.length<20)
        qarilist.add(Qari.fromjson(element));
    });
    qarilist.sort((a,b)=>a.name!.compareTo(b.name!));
    return qarilist;
  }


}

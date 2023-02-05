import 'package:flutter/material.dart';
import 'package:ourlifeforallah/constants/constants.dart';
import 'package:ourlifeforallah/models/translation.dart';

class TranslationTile extends StatelessWidget {
  final int index;
  final SurahTranslation surahTranslation;
TranslationTile({required this.index,required this.surahTranslation});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1
            ),
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(children: [
              Container(
                decoration: BoxDecoration(
                  color:Constants.kPrimary,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(8),
                  topRight: Radius.circular(8)),
                ),
                padding: EdgeInsets.all(16),
                width: double.infinity,
              ),
              Positioned(
                top: 3,
                left: 12,
                child: Container(
                  padding: EdgeInsets.all(6),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black
                  ),
                  child: Text(surahTranslation.aya!,
                  style: TextStyle(color: Colors.white,fontSize: 16),
                  )
                ),
              ),
            ],),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(surahTranslation.arabic_text!,
                  textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                  Text(surahTranslation.translation!,
                  textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

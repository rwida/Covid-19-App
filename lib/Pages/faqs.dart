import 'package:covid19/data_sorce.dart';
import 'package:covid19/localization/localization_methods.dart';
import 'package:flutter/material.dart';
import '../data_sorce.dart';

class FAQSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'FAQS')),
      ),
      body: ListView.builder(itemCount: Datasorce.questionAnswers.length,itemBuilder: (context,index){
        return ExpansionTile(
          title: Text(getLangCode(context) == ARABIC ? Datasorce.questionAnswersAr[index]['question'] : Datasorce.questionAnswers[index]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(getLangCode(context) == ARABIC ? Datasorce.questionAnswersAr[index]['answer'] : Datasorce.questionAnswers[index]['answer']),
            ),
          ],
          );
      }),
    );
  }
}
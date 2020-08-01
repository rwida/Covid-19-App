import 'package:covid19/localization/localization_methods.dart';

import '../Pages/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context){return FAQSPage();}));
              },
              child: Container(
              height: 40,
              color: Colors.indigo[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(getTranslated(context, "FAQS"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 1)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Icon(Icons.arrow_forward,color: Colors.white,),
                )
              ],),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              launch("https://covid19responsefund.org/en/");
            },
              child: Container(
              height: 40,
              color: Colors.indigo[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(getTranslated(context, "DONATE"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 1)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Icon(Icons.arrow_forward,color: Colors.white,),
                )
              ],),
            ),
          ),
          SizedBox(height: 10),
          GestureDetector(
              onTap: (){
                launch("https://www.who.int/indonesia/news/novel-coronavirus/mythbusters");
              },
              child: Container(
              height: 40,
              color: Colors.indigo[800],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Text(getTranslated(context, "MYTH BUSTERS"),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,letterSpacing: 1)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10,left: 10),
                  child: Icon(Icons.arrow_forward,color: Colors.white,),
                )
              ],),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
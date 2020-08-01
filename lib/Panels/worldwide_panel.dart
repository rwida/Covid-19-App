import 'package:covid19/localization/localization_methods.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldwide;

  const WorldWidePanel({this.worldwide});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2,
    ),
    children: <Widget>[
      StatusPanel(
        title: getTranslated(context, 'Confirmed'),
        panelcolor: Colors.red[100],
        txtColor: Colors.red,
        count: worldwide['cases'].toString(),
      ),
      StatusPanel(
        title: getTranslated(context, 'Active'),
        panelcolor: Colors.blue[100],
        txtColor: Colors.blue[900],
        count: worldwide['active'].toString(),
      ),
      StatusPanel(
        title: getTranslated(context, 'Recovered'),
        panelcolor: Colors.green[100],
        txtColor: Colors.green,
        count: worldwide['recovered'].toString(),
      ),
      StatusPanel(
        title: getTranslated(context, 'Deaths'),
        panelcolor: Colors.grey[400],
        txtColor: Colors.grey[900],
        count: worldwide['deaths'].toString(),
      )
    ],
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelcolor;
  final Color txtColor; 
  final String title;
  final String count;
  

  const StatusPanel({this.panelcolor, this.txtColor, this.title, this.count});


  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var high = MediaQuery.of(context).size.height;

    return Container(
      height: high * 0.8,
      width: width / 2,
      margin: EdgeInsets.all(10),
      color: panelcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,style: TextStyle(color: txtColor,fontWeight: FontWeight.bold,fontSize: 18),
          ),
          Text(
            count,
            style: TextStyle(color: txtColor,fontWeight: FontWeight.bold,fontSize: 16),
          )
        ],
      ),
    );
  }
}
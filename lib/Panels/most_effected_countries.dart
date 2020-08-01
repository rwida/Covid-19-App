import 'package:flutter/material.dart';

class MostEffectedPanel extends StatelessWidget {

  final List contryData;

  const MostEffectedPanel({this.contryData});

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,itemBuilder: (context,index){
        return Container(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 15),
                child: Image.network(contryData[index]['countryInfo']['flag'].toString(),height: 40,width: 50,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Text(contryData[index]['country'].toString(),style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              Text(contryData[index]['deaths'].toString(),style: TextStyle(fontSize: 15,color: Colors.red),)
            ],
          ),
        );
      }),
    );
  }
}
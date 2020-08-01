import 'dart:convert';
import 'package:covid19/localization/localization_methods.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countriesData;

  fetchCountriesData() async {
    var url = "https://corona.lmao.ninja/v2/countries?sort=cases";
    var response = await http.get(url);
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCountriesData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'Countries Deathes by Corona')),
        backgroundColor: Colors.indigo[800],
      ),
      body: countriesData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: countriesData == null ? 0 : countriesData.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  color: Colors.grey[400],
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 15),
                        child: Image.network(
                          countriesData[index]['countryInfo']['flag']
                              .toString(),
                          height: 40,
                          width: 50,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                          padding: const EdgeInsets.only(right: 10,left: 10),
                          child: Text(
                              countriesData[index]['country'].toString(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20,left: 10),
                        child: Text(
                          countriesData[index]['deaths'].toString(),
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}

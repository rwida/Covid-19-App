import 'dart:convert';
import './Pages/country-page.dart';
import 'package:covid19/Panels/info_panel.dart';
import 'package:covid19/Panels/most_effected_countries.dart';
import 'package:covid19/Panels/worldwide_panel.dart';
import 'package:flutter/material.dart';
import 'Models/language.dart';
import 'data_sorce.dart';
import 'package:http/http.dart' as http;
import 'localization/localization_methods.dart';
import 'main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map worldData;

  fetchworlwideData() async {
    var url = "https://corona.lmao.ninja/v2/all";
    var response = await http.get(url);
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    fetchworlwideData();
    fetchCountriesData();
  }

  List countriesData;

  fetchCountriesData() async {
    var url = "https://corona.lmao.ninja/v2/countries?sort=cases";
    var response = await http.get(url);
    setState(() {
      countriesData = json.decode(response.body);
    });
  }

   void _changeLanguage(Language lang) async {
    Locale _temp = await setLocale(lang.languageCode);
    MyApp.setLocale(context, _temp);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        title: Text(getTranslated(context, 'Covid-19 Panel')),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: DropdownButton(
              underline: SizedBox(),
              icon: Icon(Icons.language, color: Colors.white),
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                        value: lang,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              lang.flag,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(lang.name)
                          ],
                        ),
                      ))
                  .toList(),
              onChanged: (Language lang) {
                _changeLanguage(lang);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 80,
              color: Colors.orange[100],
              child: Padding(
                padding: EdgeInsets.only(top: 10, left: 8 ,right: 8),
                child: Text(
                 getLangCode(context) == ARABIC ? Datasorce.quoteAr : Datasorce.quote,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    getTranslated(context, "World Wide"),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.indigo[800],
                      ),
                      padding: EdgeInsets.all(12),
                      child: Text(
                        getTranslated(context, "Regional"),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            worldData == null
                ? CircularProgressIndicator()
                : WorldWidePanel(worldwide: worldData),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                getTranslated(context, "Most Effected Countries"),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            countriesData == null
                ? CircularProgressIndicator()
                : MostEffectedPanel(contryData: countriesData),
            SizedBox(height: 15),
            InfoPanel(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'home_page.dart';
import 'localization/localization_methods.dart';
import 'localization/set_localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }


  @override
  _MyAppState createState() => _MyAppState();
}
    

class _MyAppState extends State<MyApp> {
  Locale _local;

  void setLocale(Locale locale) {
    setState(() {
      _local = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._local = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_local == null) {
      return Container(child: Center(child: CircularProgressIndicator()));
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        locale: _local,
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
        localizationsDelegates: [
          SetLoacalization.localizationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (deviceLocal, supportedLocales) {
          for (var local in supportedLocales) {
            if (local.languageCode == deviceLocal.languageCode &&
                local.countryCode == deviceLocal.countryCode) {
              return deviceLocal;
            }
          }
          return supportedLocales.first;
        },
      );
    }
  }
}

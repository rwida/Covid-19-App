import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SetLoacalization {
  final Locale locale;

  SetLoacalization(this.locale);

  static SetLoacalization of(BuildContext context) {
    return Localizations.of<SetLoacalization>(context, SetLoacalization);
  }

  static const LocalizationsDelegate<SetLoacalization> localizationsDelegate =
      _GetLocalizationDelegate();

  Map<String, String> _localizedValue;

  Future load() async {
    String jsonStringValue =
        await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedjson = json.decode(jsonStringValue);
    _localizedValue =
        mappedjson.map((key, value) => MapEntry(key, value.toString()));
  }

  String getTranslateValue(String key) {
    return _localizedValue[key];
  }

  String getCurrentCode() {
    return locale.languageCode;
  }
}

class _GetLocalizationDelegate extends LocalizationsDelegate<SetLoacalization> {
  const _GetLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<SetLoacalization> load(Locale locale) async {
    SetLoacalization loacalization = new SetLoacalization(locale);
    await loacalization.load();
    return loacalization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<SetLoacalization> old) {
    return false;
  }
}

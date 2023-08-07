import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  late final Locale _locale;

  AppLocalization(this._locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  late Map<String, String> _localizedValues;

  Future loadLanguange() async {
    String jsonStringValues =
        await rootBundle.loadString("assets/lang/${_locale.languageCode}.json");

    Map<String, dynamic> mappedValues = json.decode(jsonStringValues);

    _localizedValues =
        mappedValues.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getTranslate(String key) => _localizedValues[key];

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "id"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization appLocalization = AppLocalization(locale);
    await appLocalization.loadLanguange();
    return appLocalization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}

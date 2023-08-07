import 'dart:ui';

class Language {
  final String name;
  final String flag;
  final String languageCode;

  Language(this.name, this.flag, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language("English", "US", "en"),
      Language("Bahasa", "ID", "id"),
    ];
  }
}

const String ENGLISH = "en";
const String INDONESIA = "id";
//Function for selecting the language from the given option
Locale changeLanguage(Language language, context) {
  Locale _a;
  switch (language.languageCode) {
    case ENGLISH:
      _a = Locale(language.languageCode, "US");
      break;
    case INDONESIA:
      _a = Locale(language.languageCode, "ID");
      break;
    default:
      _a = Locale(language.languageCode, 'US');
  }
  return _a;
}

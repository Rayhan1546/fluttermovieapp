import 'package:flutter/cupertino.dart';

class MainViewmodel {
  static MainViewmodel? mainViewmodel;

  static getInstance() {
    mainViewmodel ??= MainViewmodel();
    return mainViewmodel;
  }

  ValueNotifier<Language> language = ValueNotifier(Language.english);
}

enum Language {
  english,
  bangla;

  String getLocal() {
    switch (this) {
      case Language.english:
        return 'en';
      case Language.bangla:
        return 'bn';
    }
  }
}

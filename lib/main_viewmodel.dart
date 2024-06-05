import 'package:flutter/material.dart';
import 'data/local/language_data_source.dart';
import 'features/settings_page/widgets/enums.dart';

class MainViewmodel {
  static MainViewmodel? mainViewmodel;

  static MainViewmodel getInstance() {
    mainViewmodel ??= MainViewmodel();
    return mainViewmodel!;
  }

  MainViewmodel() {
    _loadLanguage();
  }

  ValueNotifier<Language> language = ValueNotifier(Language.English);

  void _loadLanguage() async {
    Language? savedLanguage = await LanguagePreferences.getLanguage();
    if (savedLanguage != null) {
      language.value = savedLanguage;
    }
  }

  void onClickSetLanguage(Language language) {
    this.language.value = language;
    LanguagePreferences.setLanguage(language);
  }
}

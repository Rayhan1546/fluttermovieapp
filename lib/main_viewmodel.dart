import 'package:flutter/material.dart';
import 'package:mymovieapp/Auth/Auth_service.dart';
import 'package:mymovieapp/data/local/theme_data_source.dart';
import 'data/local/language_data_source.dart';
import 'features/settings_page/widgets/enums.dart';
import 'package:mymovieapp/common/enums/themes.dart';

class MainViewmodel {
  static MainViewmodel? mainViewmodel;

  static MainViewmodel getInstance() {
    mainViewmodel ??= MainViewmodel();
    return mainViewmodel!;
  }

  MainViewmodel() {
    _loadLanguage();
    _loadTheme();
  }

  ValueNotifier<Language> language = ValueNotifier(Language.English);
  ValueNotifier<Themes> theme = ValueNotifier(Themes.dark);

  AuthService authService = AuthService.getInstance();

  void _loadLanguage() async {
    Language? savedLanguage = await LanguageDataSource.getLanguage();
    if (savedLanguage != null) {
      language.value = savedLanguage;
    }
  }

  void _loadTheme() async {
    Themes? savedThemes = await ThemeDataSource.getThemeMode();
    if (savedThemes != null) {
      theme.value = savedThemes;
    }
  }

  void onClickSetTheme(Themes theme) {
    this.theme.value = theme;
    ThemeDataSource.saveThemeMode(theme);
  }

  void onClickSetLanguage(Language language) {
    this.language.value = language;
    LanguageDataSource.setLanguage(language);
  }

  void logoutUser() async {
    await authService.signout();
  }
}

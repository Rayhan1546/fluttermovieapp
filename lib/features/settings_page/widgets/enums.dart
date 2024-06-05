enum Language {
  English,
  Bangla;

  String getLocal() {
    switch (this) {
      case Language.English:
        return 'en';
      case Language.Bangla:
        return 'bn';
    }
  }

  String getLanguageName() {
    switch (this) {
      case Language.English:
        return 'English';
      case Language.Bangla:
        return 'Bangla';
    }
  }
}

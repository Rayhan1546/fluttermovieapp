import 'package:mymovieapp/features/settings_page/widgets/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageDataSource {
  static const String _key = 'language';

  static Future<Language?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? index = prefs.getInt(_key);
    if (index != null) {
      return Language.values.elementAt(index);
    }
    return null;
  }

  static Future<void> setLanguage(Language language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key, language.index);
  }
}

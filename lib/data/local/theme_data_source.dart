import 'package:mymovieapp/common/enums/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataSource {
  static const String _themeKey = 'theme';

  static Future<void> saveThemeMode(Themes theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, theme.index);
  }

  static Future<Themes?> getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? index = prefs.getInt(_themeKey);
    if (index != null) {
      return Themes.values.elementAt(index);
    }
    return null;
  }
}

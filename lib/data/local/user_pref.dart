import 'dart:convert';
import 'package:mymovieapp/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref {
  static const String _userKey = 'user';

  static Future<void> saveUserToSharedPreferences(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, json.encode(user.toJson()));
  }

  static Future<UserModel?> loadUserFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return UserModel.fromJson(json.decode(userJson));
    }
    return null;
  }

  static Future<void> clearUserFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_userKey);
  }
}

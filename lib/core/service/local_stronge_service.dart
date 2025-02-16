import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setString(String user, String value) async {
    return await _sharedPreferences.setString(user, value);
  }


  static Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }

  static String? getString(String key) {
    return _sharedPreferences.getString(key);
  }

  static Future<bool> remove(String key) async{
    return await _sharedPreferences.remove(key);
  }

}
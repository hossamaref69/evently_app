import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user.dart';
import '../constants/local_storage_keys.dart';

class LocalStorageService {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool(String key, bool value) async {
    return await _sharedPreferences.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _sharedPreferences.getBool(key);
  }


  static Future<void> saveUserData(UserDM user) async {
    await _sharedPreferences.setString(LocalStorageKeys.userIdKey, user.id);
    await _sharedPreferences.setString(LocalStorageKeys.userNameKey, user.name);
    await _sharedPreferences.setString(LocalStorageKeys.userEmailKey, user.email);
  }

  static String? getUserId() {
    return _sharedPreferences.getString(LocalStorageKeys.userIdKey);
  }

  static String? getUserName() {
    return _sharedPreferences.getString(LocalStorageKeys.userNameKey);
  }

  static String? getUserEmail() {
    return _sharedPreferences.getString(LocalStorageKeys.userEmailKey);
  }

  static Future<void> clearUserData() async {
    await _sharedPreferences.remove(LocalStorageKeys.userIdKey);
    await _sharedPreferences.remove(LocalStorageKeys.userNameKey);
    await _sharedPreferences.remove(LocalStorageKeys.userEmailKey,);
  }

  static Future<void> remove(String key) async {
    await _sharedPreferences.remove(key);
  }

}

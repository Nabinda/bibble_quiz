import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();
  static SharedPreferences? sharedPreferences;
  SharedPreferences get instance =>
      sharedPreferences ?? (throw Exception("Not Initialized"));

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String getString(String key) {
    try {
      return sharedPreferences?.getString(key) ?? "";
    } catch (e) {
      throw Exception('There is a problem in getting string $key: $e');
    }
  }

  static Future<bool?> setString(String key, String value) async {
    try {
      return sharedPreferences?.setString(key, value);
    } catch (e) {
      throw Exception('There is a problem in setting string $key: $e');
    }
  }

  static bool getBool(String key) {
    try {
      return sharedPreferences?.getBool(key) ?? true;
    } catch (e) {
      throw Exception('There is a problem in getting bool $key: $e');
    }
  }

  static Future<bool?> setBool(String key, bool value) async {
    try {
      return sharedPreferences?.setBool(key, value);
    } catch (e) {
      throw Exception('There is a problem in setting bool $key: $e');
    }
  }

  static Future<bool?> delete(String key) async {
    try {
      return sharedPreferences?.remove(key);
    } catch (e) {
      throw Exception('There is a problem in deleteing $key: $e');
    }
  }

  static Future<bool?> deleteAll() async {
    try {
      return sharedPreferences?.clear();
    } catch (e) {
      throw Exception('There is a problem in deleteing all data $e');
    }
  }
}

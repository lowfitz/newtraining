import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static late SharedPreferences sharedPreferences;

  static Future cacheInitiolization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> insertData(
      {required String key, required String value}) async {
    return sharedPreferences.setString(key, value);
  }

  static String getCachedData({required String key}) {
    return sharedPreferences.getString(key) ?? "";
  }

  static Future<bool> deleteCachedItem({required String key}) async {
    return sharedPreferences.remove(key);
  }
}

class Utils {
  static String token = "";

  static getToken() {
    token = LocalData.getCachedData(key: "token");
  }

  static setToken(String t) async {
    await LocalData.insertData(key: "token", value: t);
    token = t;
  }

  static removeToken() {
    token = "";
    LocalData.deleteCachedItem(key: "token");
  }

  bool validPhoneNumber(String input) {
    const reg =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (RegExp(reg).hasMatch(input)) {
      return true;
    } else {
      return false;
    }
  }
}

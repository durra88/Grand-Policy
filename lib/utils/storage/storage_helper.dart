import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static SharedPreferences? sharedPreferences;

  static Future getInstance() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static Future<String?> get(String key) async {
    await getInstance();
    return sharedPreferences!.getString(key);
  }

  static Future set(String key, dynamic value) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString(key, value);
  }

  static void remove(String key) async {
    getInstance();
    sharedPreferences!.remove(key);
  }

  static void clear() async {
    getInstance();
    sharedPreferences!.clear();
  }

  static void savePayloadInfo(Map<String, dynamic> payload) {}
}

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future setData(String key, String value) async {
    // await storage.write(key: key, value: value);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString(key, value);
  }

  static Future getData(String key) async {
    // await storage.read(key: key);
    // await Future.sync(() async => null)

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.get(key);
  }
}

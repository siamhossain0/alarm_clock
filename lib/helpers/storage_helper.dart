import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class StorageHelper {
  static late SharedPreferences _prefs;


  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  static Future<bool> saveBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }


  static bool? getBool(String key) {
    return _prefs.getBool(key);
  }


  static Future<bool> saveString(String key, String value) async {
    return await _prefs.setString(key, value);
  }


  static String? getString(String key) {
    return _prefs.getString(key);
  }


  static Future<bool> saveInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }


  static int? getInt(String key) {
    return _prefs.getInt(key);
  }


  static Future<bool> saveDouble(String key, double value) async {
    return await _prefs.setDouble(key, value);
  }


  static double? getDouble(String key) {
    return _prefs.getDouble(key);
  }


  static Future<bool> saveStringList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }


  static List<String>? getStringList(String key) {
    return _prefs.getStringList(key);
  }


  static Future<bool> saveObject(String key, Object value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }


  static dynamic getObject(String key) {
    String? jsonString = _prefs.getString(key);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }


  static bool containsKey(String key) {
    return _prefs.containsKey(key);
  }


  static Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }


  static Future<bool> clear() async {
    return await _prefs.clear();
  }
}
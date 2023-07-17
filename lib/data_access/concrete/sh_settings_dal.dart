import 'dart:developer' as developer;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:template_first/data_access/abstract/settings_dal.dart';

class ShSettingsDal extends ISettingsDal {
  @override
  Future updateLocale(String key, String? value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (value != null) {
      preferences.setString(key, value);
    } else if (preferences.containsKey(key)) {
      preferences.remove(key);
    }
  }

  @override
  Future updateThemeMode(String key, bool? value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (value != null) {
      preferences.setBool(key, value);
    } else if (preferences.containsKey(key)) {
      preferences.remove(key);
    }
  }

  @override
  Future<String?> readLocale(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      return preferences.getString(key);
    } catch (e) {
      developer.log('SharedPreferences has exception: ${e.toString()}');
      return null;
    }
  }

  @override
  Future<bool?> readThemeMode(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    try {
      return preferences.getBool(key);
    } catch (e) {
      developer.log('SharedPreferences has exception: ${e.toString()}');
      return null;
    }
  }
}

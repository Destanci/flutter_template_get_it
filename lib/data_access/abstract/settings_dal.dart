abstract class ISettingsDal {
  Future<bool?> readThemeMode(String key);
  Future updateThemeMode(String key, bool? value);

  Future<String?> readLocale(String key);
  Future updateLocale(String key, String? value);
}

import 'package:flutter/material.dart';

abstract class ISettingsService {
  Future<ThemeMode> get themeMode;
  Future<void> updateThemeMode(ThemeMode theme);

  Future<Locale> get locale;
  Future<void> updateLocale(Locale? locale);
}

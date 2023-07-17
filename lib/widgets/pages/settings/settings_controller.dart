import 'package:flutter/material.dart';

import '../../../business/abstract/settings_service.dart';

class SettingsController with ChangeNotifier {
  final ISettingsService _settingsService;

  SettingsController(this._settingsService);

  Future<void> loadSettings() async {
    _themeMode = (await _settingsService.themeMode);
    _locale = (await _settingsService.locale);
  }

  // #region Theme

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null || newThemeMode == _themeMode) return;

    await _settingsService.updateThemeMode(newThemeMode);
    themeMode = await _settingsService.themeMode;
  }

  // #endregion

  // #region Locale

  late Locale _locale;
  Locale get locale => _locale;
  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }

  Future<void> updateLocale(Locale? newLocale) async {
    if (newLocale == _locale) return;

    await _settingsService.updateLocale(newLocale);
    locale = await _settingsService.locale;
  }

  // #endregion
}

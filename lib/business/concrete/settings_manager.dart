import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:template_first/data_access/abstract/settings_dal.dart';
import 'package:template_first/src/utils/localization.dart';

import '../abstract/settings_service.dart';

class SettingsManager extends ISettingsService {
  final ISettingsDal _settingsDal;
  final Locale? Function()? getDeviceLocale;

  SettingsManager(this._settingsDal, {this.getDeviceLocale});

  // #region [Theme]

  static const themeKey = 'theme';

  @override
  Future<ThemeMode> get themeMode async {
    var darkMode = await _settingsDal.readThemeMode(themeKey);
    if (darkMode != null) {
      if (darkMode) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Future<void> updateThemeMode(ThemeMode theme) async {
    developer.log('Theme mode updated (${theme.name.toString()})');

    switch (theme) {
      case ThemeMode.system:
        await _settingsDal.updateThemeMode(themeKey, null);
        break;
      case ThemeMode.light:
        await _settingsDal.updateThemeMode(themeKey, false);
        break;
      case ThemeMode.dark:
        await _settingsDal.updateThemeMode(themeKey, true);
        break;
    }
  }

  // #endregion

  // #region [Locale]

  static const localeKey = 'locale';

  @override
  Future<Locale> get locale async {
    var languageCode = await _settingsDal.readLocale(localeKey);
    if (languageCode != null) {
      var locale = Locale(languageCode);
      if (Localization.isSupported(locale)) {
        return locale;
      }
    } else {
      var deviceLocale = getDeviceLocale?.call();
      if (deviceLocale != null && Localization.isSupported(deviceLocale)) {
        return deviceLocale;
      }
    }

    return const Locale('en');
  }

  @override
  Future<void> updateLocale(Locale? locale) async {
    developer.log('Locale updated (${locale?.languageCode ?? 'system'})');

    _settingsDal.updateLocale(localeKey, locale?.languageCode);
  }

  // #endregion
}

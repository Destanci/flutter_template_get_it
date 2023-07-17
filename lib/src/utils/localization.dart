import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class Localization {
  static AppLocalizations of(BuildContext context) => AppLocalizations.of(context)!;
  static List<Locale> get supportedLocales => AppLocalizations.supportedLocales;
  static bool isSupported(Locale locale) => AppLocalizations.delegate.isSupported(locale);

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = AppLocalizations.localizationsDelegates;

  static String getNativeNameOf(Locale locale) {
    var nativeList = LocaleNamesLocalizationsDelegate.nativeLocaleNames;
    if (nativeList.containsKey(locale.languageCode)) {
      return nativeList[locale.languageCode]!;
    }
    return locale.languageCode;
  }
}

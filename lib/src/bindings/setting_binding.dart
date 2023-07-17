import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../business/abstract/settings_service.dart';
import '../../business/concrete/settings_manager.dart';
import '../../data_access/abstract/settings_dal.dart';
import '../../data_access/concrete/sh_settings_dal.dart';
import '../../widgets/pages/settings/settings_controller.dart';

var getIt = GetIt.instance;

class SettingBinding {
  static initLocator() {
    getIt.registerSingleton<ISettingsDal>(ShSettingsDal());
    getIt.registerSingleton<ISettingsService>(SettingsManager(
      getIt.get(),
      getDeviceLocale: () {
        var localeName = Platform.localeName;
        if (localeName.isNotEmpty) {
          return Locale(localeName.substring(0, 2));
        }
        return null;
      },
    ));
    getIt.registerSingleton(SettingsController(getIt.get()));
  }
}

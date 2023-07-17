import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'src/bindings/application_bindings.dart';
import 'src/bindings/setting_binding.dart';

import 'app.dart';
import 'widgets/pages/settings/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SettingBinding.initLocator();
  await GetIt.I.get<SettingsController>().loadSettings();

  ApplicationBindings.initLocator();
  runApp(GetIt.I.get<MyApp>());
}

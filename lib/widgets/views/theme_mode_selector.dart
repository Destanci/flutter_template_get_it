import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../pages/settings/settings_controller.dart';

class ThemeModeSelector extends StatelessWidget {
  ThemeModeSelector({super.key, this.onChanged});

  final void Function(ThemeMode value)? onChanged;

  final SettingsController controller = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () => controller.updateThemeMode(ThemeMode.light),
          color: controller.themeMode == ThemeMode.light
              ? Theme.of(context).primaryColor
              : Theme.of(context).iconTheme.color,
          icon: controller.themeMode == ThemeMode.light
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.light_mode_outlined),
        ),
        IconButton(
          onPressed: () => controller.updateThemeMode(ThemeMode.dark),
          color: controller.themeMode == ThemeMode.dark
              ? Theme.of(context).primaryColor
              : Theme.of(context).iconTheme.color,
          icon: controller.themeMode == ThemeMode.dark
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.dark_mode_outlined),
        ),
        IconButton(
          onPressed: () => controller.updateThemeMode(ThemeMode.system),
          color: controller.themeMode == ThemeMode.system
              ? Theme.of(context).primaryColor
              : Theme.of(context).iconTheme.color,
          icon: controller.themeMode == ThemeMode.system
              ? const Icon(Icons.auto_mode)
              : const Icon(Icons.auto_mode_outlined),
        )
      ],
    );
  }
}

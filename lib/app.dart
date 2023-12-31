import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get_it/get_it.dart';

import 'widgets/pages/settings/settings_page.dart';
import 'widgets/pages/sample_details/sample_details_page.dart';
import 'widgets/pages/sample_list/sample_list_page.dart';
import 'widgets/pages/settings/settings_controller.dart';
import 'src/utils/localization.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final SettingsController controller = GetIt.I.get();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return MaterialApp(
          restorationScopeId: 'template_app',

          // Localization (Will Automatically generated by .arb files)
          localizationsDelegates: const [
            ...Localization.localizationsDelegates,
            LocaleNamesLocalizationsDelegate(),
          ],
          supportedLocales: Localization.supportedLocales,
          locale: controller.locale,
          localeResolutionCallback: (locale, supportedLocales) {
            if (!supportedLocales.contains(locale)) return const Locale('en');
            return locale;
          },

          // App Title from locale
          onGenerateTitle: (BuildContext context) => Localization.of(context).appTitle,

          // Theme
          theme: FlexThemeData.light(scheme: FlexScheme.materialBaseline),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.materialBaseline),
          themeMode: controller.themeMode,

          // Named Route:
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsPage.routeName:
                    return SettingsPage();
                  case SampleItemDetailsView.routeName:
                    return SampleItemDetailsView();
                  case SampleListPage.routeName:
                  default:
                    return SampleListPage();
                }
              },
            );
          },
        );
      },
    );
  }
}

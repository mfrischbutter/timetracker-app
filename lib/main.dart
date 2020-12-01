import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/utils/routes.dart';

void main() {
  runApp(EasyLocalization(
    supportedLocales: [Locale('de', 'DE')],
    path: 'assets/translations',
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Timetracker',
      theme: AppTheme.light,
      routes: Routes.routes,
      initialRoute: Routes.login,
    );
  }
}

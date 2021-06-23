import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/config/app_theme.dart';
import 'package:timetracker_app/provider/activties.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/provider/customers.dart';
import 'package:timetracker_app/provider/project_activities.dart';
import 'package:timetracker_app/provider/projects.dart';
import 'package:timetracker_app/utils/routes.dart';
import 'services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  initServices();
  await services.allReady();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(
        value: services.get<AuthProvider>(),
      ),
      ChangeNotifierProvider.value(
        value: services.get<ActivitiesProvider>(),
      ),
      ChangeNotifierProvider.value(
        value: services.get<CustomersProvider>(),
      ),
      ChangeNotifierProvider.value(
        value: services.get<ProjectActivitiesProvider>(),
      ),
      ChangeNotifierProvider.value(
        value: services.get<ProjectsProvider>(),
      ),
    ],
    child: EasyLocalization(
      supportedLocales: [Locale('de', 'DE')],
      path: 'assets/translations',
      startLocale: Locale('de', 'DE'),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(100, 100),
      builder: () => MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Timetracker',
        theme: defaultTheme,
        routes: Routes.routes,
        initialRoute: _getInitialRoute(context),
      ),
    );
  }

  _getInitialRoute(context) {
    switch (services.get<AuthProvider>().status) {
      case AuthStatus.Authenticated:
        return Routes.dashboard;
        break;
      default:
        return Routes.login;
    }
  }
}

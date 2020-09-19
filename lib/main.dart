import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/provider/data.dart';
import 'package:timetracker_app/provider/timer.dart';
import 'package:timetracker_app/styles/styles.dart';
import 'package:timetracker_app/views/dashboard.dart';
import 'package:timetracker_app/views/detail_tracker.dart';
import 'package:timetracker_app/views/loading.dart';
import 'package:timetracker_app/views/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => DataProvider(
              Provider.of<AuthProvider>(_, listen: false),
            ),
          ),
          ChangeNotifierProvider(
            create: (_) => TimerProvider(
              Provider.of<AuthProvider>(_, listen: false),
            ),
          )
        ],
        child: MaterialApp(
          initialRoute: '/',
          theme: ThemeData(
            primaryColor: Styles.primaryColor,
            accentColor: Styles.primaryColor,
          ),
          onGenerateRoute: (settings) {
            final arguments = settings.arguments;
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (context) => Router());
              case '/login':
                return MaterialPageRoute(builder: (context) => LogInScreen());
              case '/details':
                return MaterialPageRoute(
                    builder: (context) => DetailTrackerScreen(
                          isEdit: true,
                          id: arguments,
                        ));
              default:
                return null;
            }
          },
        ),
      ),
    ),
  );
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, user, child) {
        switch (user.status) {
          case Status.Uninitialized:
            return LoadingScreen();
          case Status.Unauthenticated:
            return LogInScreen();
          case Status.Authenticated:
            return DashboardScreen();
          default:
            return LogInScreen();
        }
      },
    );
  }
}

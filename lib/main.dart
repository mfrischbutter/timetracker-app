import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/provider/customers.dart';
import 'package:timetracker_app/provider/items.dart';
import 'package:timetracker_app/provider/projects.dart';
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
          ChangeNotifierProvider<ItemsProvider>(
            create: (_) => ItemsProvider(
              Provider.of<AuthProvider>(_, listen: false),
            ),
          ),
          ChangeNotifierProvider<CustomersProvider>(
            create: (_) => CustomersProvider(
              Provider.of<AuthProvider>(_, listen: false),
            ),
          ),
          ChangeNotifierProvider<ProjectsProvider>(
            create: (_) => ProjectsProvider(
              Provider.of<AuthProvider>(_, listen: false),
            ),
          ),
        ],
        child: MaterialApp(
          initialRoute: '/',
          theme: ThemeData(
            primaryColor: Styles.primaryColor,
            accentColor: Styles.primaryColor,
          ),
          routes: {
            '/': (context) => Router(),
            '/login': (context) => LogInScreen(),
            '/details': (context) => DetailTrackerScreen(),
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

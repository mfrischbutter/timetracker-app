import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/provider/items.dart';
import 'package:timetracker_app/styles/styles.dart';
import 'package:timetracker_app/views/dashboard.dart';
import 'package:timetracker_app/views/loading.dart';
import 'package:timetracker_app/views/login.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Router(),
          '/login': (context) => LogInScreen()
        },
      ),
    ),
  );
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return Consumer<AuthProvider>(
      builder: (context, user, child) {
        switch (user.status) {
          case Status.Uninitialized:
            return LoadingScreen();
          case Status.Unauthenticated:
            return LogInScreen();
          case Status.Authenticated:
            return ChangeNotifierProvider(
              create: (context) => ItemsProvider(authProvider),
              child: DashboardScreen(),
            );
          default:
            return LogInScreen();
        }
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services/api.dart';

class DashboardProvider with ChangeNotifier {
  ApiService apiService;
  AuthProvider authProvider;

  DashboardProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;
  }
}

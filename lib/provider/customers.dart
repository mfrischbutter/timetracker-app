import 'package:flutter/material.dart';
import 'package:timetracker_app/models/customers.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services/api.dart';
import 'package:timetracker_app/utils/customers_response.dart';
import 'package:timetracker_app/utils/exceptions.dart';

class CustomersProvider with ChangeNotifier {
  bool _initialized = false;

  ApiService apiService;
  AuthProvider authProvider;

  List<Customers> _customers = List<Customers>();

  bool get initialized => _initialized;
  List<Customers> get customers => _customers;

  CustomersProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    getCustomers();
  }

  void getCustomers() async {
    try {
      CustomersResponse getCustomersResponse = await apiService.getCustomers();

      _initialized = true;
      _customers = getCustomersResponse.customers;

      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }
}

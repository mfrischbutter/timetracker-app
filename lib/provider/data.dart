import 'package:flutter/material.dart';
import 'package:timetracker_app/models/activities.dart';
import 'package:timetracker_app/models/customers.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services/api.dart';
import 'package:timetracker_app/utils/activities_response.dart';
import 'package:timetracker_app/utils/customers_response.dart';
import 'package:timetracker_app/utils/exceptions.dart';
import 'package:timetracker_app/utils/items_response.dart';
import 'package:timetracker_app/utils/projects_response.dart';

class DataProvider with ChangeNotifier {
  bool _initialized = false;

  ApiService apiService;
  AuthProvider authProvider;

  Items _selectedItem;
  List<Items> _items = List<Items>();
  List<Projects> _projects = List<Projects>();
  List<Customers> _customers = List<Customers>();
  List<Activities> _activities = List<Activities>();

  // Getters
  bool get initialized => _initialized;
  Items get selectedItem => _selectedItem;
  List<Items> get items => _items;
  List<Projects> get projects => _projects;
  List<Customers> get customers => _customers;
  List<Activities> get activities => _activities;

  DataProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    getItems();
    getProjects();
    getCustomers();
    getActivities();
    _initialized = true;
    notifyListeners();
  }

  void getItems() async {
    try {
      ItemsResponse getItemsResponse = await apiService.getItems();

      _items = getItemsResponse.items;
      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }

  void selectItem(int id) {
    _selectedItem = _items.firstWhere((element) => element.id == id);
  }

  void createNewItem() {}

  void getProjects() async {
    try {
      ProjectsResponse getProjectsResponse = await apiService.getProjects();

      _projects = getProjectsResponse.projects;

      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so session expired.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }

  void getCustomers() async {
    try {
      CustomersResponse getCustomersResponse = await apiService.getCustomers();

      _customers = getCustomersResponse.customers;

      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }

  void getActivities() async {
    try {
      ActivitiesResponse getActivitiesResponse =
          await apiService.getActivities();

      _activities = getActivitiesResponse.activities;

      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }
}

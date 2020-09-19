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

enum DataStatus {
  Uninitialized,
  NoData,
  Loading,
  Done,
}

class DataProvider with ChangeNotifier {
  ApiService apiService;
  AuthProvider authProvider;

  DataStatus _status = DataStatus.Uninitialized;
  List<Items> _items = List<Items>();
  List<Projects> _projects = List<Projects>();
  List<Customers> _customers = List<Customers>();
  List<Activities> _activities = List<Activities>();

  // Getters
  DataStatus get status => _status;
  List<Items> get items => _items;
  List<Projects> get projects => _projects;
  List<Customers> get customers => _customers;
  List<Activities> get activities => _activities;

  DataProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    getProjects();
    getCustomers();
    getActivities();
    getItems(false);
    notifyListeners();
  }

  void getItems(refresh) async {
    try {
      if (!refresh) {
        _status = DataStatus.Loading;
        notifyListeners();
      }

      ItemsResponse getItemsResponse = await apiService.getItems();

      _items = getItemsResponse.items;
      _status = DataStatus.Done;
      if (_items.isEmpty) {
        _status = DataStatus.NoData;
      }
      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }

  Future<void> postItem(BuildContext context, Items item) async {
    try {
      await apiService.saveItem(context, item);
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }

  Items getCustomer(int id) {
    //needed this workaround because some weird binding were happening between the list and the returned object
    Items item = _items.firstWhere((element) => element.id == id);
    return Items(
      activity: item.activity,
      customer: item.customer,
      id: item.id,
      date: item.date,
      description: item.description,
      duration: item.duration,
      end: item.end,
      start: item.start,
      itemClass: item.itemClass,
      project: item.project,
      ticket: item.ticket,
      user: item.user,
    );
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

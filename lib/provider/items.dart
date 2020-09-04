import 'package:flutter/material.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services/api.dart';
import 'package:timetracker_app/utils/exceptions.dart';
import 'package:timetracker_app/utils/items_response.dart';

class ItemsProvider with ChangeNotifier {
  bool _initialized = false;

  ApiService apiService;
  AuthProvider authProvider;

  List<Items> _items = List<Items>();

  bool get initialized => _initialized;
  List<Items> get items => _items;

  ItemsProvider(AuthProvider authProvider) {
    this.apiService = ApiService(authProvider);
    this.authProvider = authProvider;

    getItems();
  }

  void getItems() async {
    try {
      ItemsResponse getItemsResponse = await apiService.getItems('3');

      _initialized = true;
      _items = getItemsResponse.items;

      notifyListeners();
    } on AuthException {
      // API returned a AuthException, so user is logged out.
      await authProvider.logOut(true);
    } catch (Exception) {
      print(Exception);
    }
  }
}

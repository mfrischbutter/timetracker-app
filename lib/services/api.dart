import 'package:http/http.dart' as http;
import 'package:timetracker_app/models/items.dart';
import 'dart:async';
import 'dart:convert';

import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/utils/items_response.dart';
import 'package:timetracker_app/utils/exceptions.dart';

class ApiService {
  AuthProvider authProvider;
  String sessionId;

  // The AuthProvider is passed in when this class instantiated.
  // This provides access to the user token required for API calls.
  // It also allows us to log out a user when their token expires.
  ApiService(AuthProvider authProvider) {
    this.authProvider = authProvider;
    this.sessionId = authProvider.sessionId;
  }

  final String api = 'https://tt.mogic.com';

  void validateResponse(http.Response response) {
    try {
      json.decode(response.body);
    } on FormatException {
      throw new AuthException("401", "Unauthorized");
    }
  }

  // Returns a list of items.
  Future<ItemsResponse> getItems(String status, {String url = ''}) async {
    final response = await http.get(
      api + '/getData/days/3',
      headers: {
        'cookie': sessionId,
      },
    );

    validateResponse(response);
    List<dynamic> apiResponse = json.decode(response.body);
    List<Items> items = itemsFromResponse(apiResponse);
    return ItemsResponse(items);
  }
}

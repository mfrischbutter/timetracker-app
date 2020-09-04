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

  /*
  * Validates the response code from an API call.
  * A 401 indicates that the token has expired.
  * A 200 or 201 indicates the API call was successful.
  */
  void validateResponseStatus(int status, int validStatus) {
    if (status == 401) {
      throw new AuthException("401", "Unauthorized");
    }

    if (status != validStatus) {
      throw new ApiException(status.toString(), "API Error");
    }
  }

  // Returns a list of items.
  Future<ItemsResponse> getItems(String status, {String url = ''}) async {
    final response = await http.get(
      api + '/getData/days/3',
      headers: {'cookie': sessionId},
    );

    validateResponseStatus(response.statusCode, 200);
    List<dynamic> apiResponse = json.decode(response.body);
    print(apiResponse);
    List<Items> items = itemsFromResponse(apiResponse);
    print(items);
    return ItemsResponse(items);
  }
}

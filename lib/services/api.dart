import 'package:http/http.dart' as http;
import 'package:timetracker_app/models/activities.dart';
import 'package:timetracker_app/models/customers.dart';
import 'package:timetracker_app/models/items.dart';
import 'package:timetracker_app/models/projects.dart';
import 'dart:async';
import 'dart:convert';

import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/utils/activities_response.dart';
import 'package:timetracker_app/utils/customers_response.dart';
import 'package:timetracker_app/utils/items_response.dart';
import 'package:timetracker_app/utils/exceptions.dart';
import 'package:timetracker_app/utils/projects_response.dart';

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
  Future<ItemsResponse> getItems() async {
    final response = await http.get(
      api + '/getData/days/7',
      headers: {
        'cookie': sessionId,
      },
    );

    validateResponse(response);
    List<dynamic> apiResponse = json.decode(response.body);
    List<Items> items = itemsFromResponse(apiResponse);
    return ItemsResponse(items);
  }

  void saveItem(Items item) async {
    final response = await http.post(
      api + '/tracking/save',
      headers: {
        'cookie': sessionId,
      },
      body: {
        'date': item.date,
        'start': item.date,
        'end': item.date,
        'user': item.date,
        'customer': item.date,
        'project': item.date,
        'activity': item.date,
        'description': item.date,
        'ticket': item.date,
        'duration': item.date,
        'class': item.date,
      },
    );

    validateResponse(response);
  }

  Future<CustomersResponse> getCustomers() async {
    final response = await http.get(
      api + '/getAllCustomers',
      headers: {
        'cookie': sessionId,
      },
    );

    validateResponse(response);
    List<dynamic> apiResponse = json.decode(response.body);
    List<Customers> customers = customersFromResponse(apiResponse);
    return CustomersResponse(customers);
  }

  Future<ProjectsResponse> getProjects() async {
    final response = await http.get(
      api + '/getAllProjects',
      headers: {
        'cookie': sessionId,
      },
    );

    validateResponse(response);
    List<dynamic> apiResponse = json.decode(response.body);
    List<Projects> projects = projectsFromResponse(apiResponse);
    return ProjectsResponse(projects);
  }

  Future<ActivitiesResponse> getActivities() async {
    final response = await http.get(
      api + '/getActivities',
      headers: {
        'cookie': sessionId,
      },
    );

    validateResponse(response);
    List<dynamic> apiResponse = json.decode(response.body);
    List<Activities> activties = activitiesFromResponse(apiResponse);
    return ActivitiesResponse(activties);
  }
}

import 'package:timetracker_app/api/api_reponse.dart';
import 'package:timetracker_app/config/env.dart';
import 'package:http/http.dart' as http;
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/provider/settings.dart';
import 'package:timetracker_app/services.dart';

class ApiService {
  final _api = Env.api;

  Future<ApiResponse> fetchActivities() async {
    String _sessionId = services.get<AuthProvider>().sessionId;
    int days =
        services.get<SettingsProvider>().daysToFilterActivities.getValue();

    switch (days) {
      case 0:
        days = 3;
        break;
      case 1:
        days = 7;
        break;
      case 2:
        days = 31;
    }
    final response = await http.get(
      Uri.parse(_api + '/getData/days/' + days.toString()),
      headers: {
        'cookie': _sessionId,
      },
    );

    return ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> fetchCustomers() async {
    String _sessionId = services.get<AuthProvider>().sessionId;
    final response = await http.get(
      Uri.parse(_api + '/getCustomers'),
      headers: {
        'cookie': _sessionId,
      },
    );

    return ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> fetchProjectActivities() async {
    String _sessionId = services.get<AuthProvider>().sessionId;
    final response = await http.get(
      Uri.parse(_api + '/getActivities'),
      headers: {
        'cookie': _sessionId,
      },
    );

    return ApiResponse.fromResponse(response);
  }

  Future<ApiResponse> fetchProjects() async {
    String _sessionId = services.get<AuthProvider>().sessionId;
    final response = await http.get(
      Uri.parse(_api + '/getProjects'),
      headers: {
        'cookie': _sessionId,
      },
    );

    return ApiResponse.fromResponse(response);
  }
}

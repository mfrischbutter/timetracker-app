import 'dart:convert';

import 'package:timetracker_app/api/api_reponse.dart';
import 'package:timetracker_app/config/env.dart';
import 'package:http/http.dart' as http;
import 'package:timetracker_app/provider/auth.dart';
import 'package:timetracker_app/services.dart';

class ApiService {
  final _api = Env.api;

  Future<ApiResponse> fetchActivities() async {
    String _sessionId = services.get<AuthProvider>().sessionId;
    final response = await http.get(
      _api + '/getData/days/3',
      headers: {
        'cookie': _sessionId,
      },
    );

    return ApiResponse.fromResponse(response);
  }
}

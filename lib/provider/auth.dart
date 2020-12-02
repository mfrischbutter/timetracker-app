import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:timetracker_app/api/login_request.dart';

enum AuthStatus {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}

class AuthProvider with ChangeNotifier {
  AuthStatus _status = AuthStatus.Uninitialized;
  String _sessionId;
  FlutterSecureStorage _storage = new FlutterSecureStorage();

  AuthStatus get status => _status;
  String get sessionId => _sessionId;

  final String api = 'https://tt.mogic.com';

  init() async {
    await _getSessionId();
    bool loginValid = await checkLoginStatus();
    if (_sessionId != null && loginValid) {
      _status = AuthStatus.Authenticated;
    } else {
      _status = AuthStatus.Unauthenticated;
    }
    notifyListeners();

    return this;
  }

  _getSessionId() async {
    _sessionId = await _storage.read(key: 'sessionId');
  }

  _storeSessionId(String value) async {
    _sessionId = value;
    await _storage.write(key: 'sessionId', value: value);
  }

  Future<bool> checkLoginStatus() async {
    http.Response response = await http.get(
      api + '/status/check',
      headers: {'cookie': _sessionId},
    );
    var status = json.decode(response.body);
    if (status['loginStatus'] == true) {
      return true;
    }
    return false;
  }

  Future<bool> login(LoginRequest data) async {
    _status = AuthStatus.Authenticating;
    notifyListeners();

    http.Response response = await http.post(
      api + '/login',
      body: data.toMap(),
    );

    if (response.statusCode == 302) {
      await _storeSessionId(response.headers['set-cookie']);

      _status = AuthStatus.Authenticated;
      notifyListeners();

      return true;
    }

    if (response.body.contains('text: \'Login\',')) {
      _status = AuthStatus.Unauthenticated;
      notifyListeners();
      return false;
    }

    _status = AuthStatus.Unauthenticated;
    notifyListeners();
    return false;
  }

  logOut([bool tokenExpired = false]) async {
    _status = AuthStatus.Unauthenticated;
    if (tokenExpired == true) {}
    notifyListeners();

    await _storage.delete(key: 'sessionId');
  }
}

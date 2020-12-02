import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:timetracker_app/api/login_request.dart';
import 'package:timetracker_app/models/user.dart';

enum AuthStatus {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}

class AuthProvider with ChangeNotifier {
  AuthStatus _status = AuthStatus.Uninitialized;
  String _sessionId;
  String _username;
  FlutterSecureStorage _storage = new FlutterSecureStorage();

  AuthStatus get status => _status;
  String get sessionId => _sessionId;
  UserModel get user => UserModel(
        username: _username,
        sessionId: sessionId,
      );

  final String api = 'https://tt.mogic.com';

  init() async {
    await _getUserModel();
    bool loginValid = await checkLoginStatus();
    if (_sessionId != null && loginValid) {
      _status = AuthStatus.Authenticated;
    } else {
      _status = AuthStatus.Unauthenticated;
    }
    notifyListeners();

    return this;
  }

  _getUserModel() async {
    _sessionId = await _storage.read(key: 'sessionId');
    _username = await _storage.read(key: 'username');
  }

  _storeUserModel(String session, String username) async {
    _sessionId = session;
    _username = username;
    await _storage.write(key: 'sessionId', value: session);
    await _storage.write(key: 'username', value: username);
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
      await _storeUserModel(response.headers['set-cookie'], data.username);

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
    await _storage.delete(key: 'username');
  }
}

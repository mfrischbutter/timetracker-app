import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:timetracker_app/widgets/notification_text.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {
  Status _status = Status.Uninitialized;
  String _sessionId;
  NotificationText _notification;
  FlutterSecureStorage _storage = new FlutterSecureStorage();

  Status get status => _status;
  String get sessionId => _sessionId;
  NotificationText get notification => _notification;

  final String api = 'https://tt.mogic.com';

  initAuthProvider() async {
    String sessionId = await _getSessionId();
    if (sessionId != null) {
      _sessionId = sessionId;
      _status = Status.Authenticated;
    } else {
      _status = Status.Unauthenticated;
    }
    notifyListeners();
  }

  //Store
  _getSessionId() async {
    _sessionId = await _storage.read(key: 'sessionId');
  }

  _storeSessionId(String value) async {
    await _storage.write(key: 'sessionId', value: value);
  }

  Future<bool> login(String username, String password) async {
    _status = Status.Authenticating;
    _notification = null;
    notifyListeners();

    Map<String, String> body = {
      'username': username,
      'password': password,
    };
    http.Response response = await http.post(api + '/login', body: body);

    if (response.statusCode == 302) {
      _storeSessionId(response.headers['set-cookie']);

      _status = Status.Authenticated;
      notifyListeners();

      return false;
    }

    if (response.body.contains('text: \'Login\',')) {
      _status = Status.Unauthenticated;
      _notification =
          NotificationText('Der Nutzername oder das Passwort ist falsch.');
      notifyListeners();
      return false;
    }

    _status = Status.Unauthenticated;
    _notification = NotificationText('Es ist ein Fehler aufgetreten.');
    notifyListeners();
    return false;
  }

  storeUserData(apiResponse) async {}

  logOut([bool tokenExpired = false]) async {
    _status = Status.Unauthenticated;
    if (tokenExpired == true) {
      _notification = NotificationText(
          'Sitzung ist abgelaufen, bitte melde dich erneut an.',
          type: 'info');
    }
    notifyListeners();

    await _storage.delete(key: 'sessionId');
  }
}

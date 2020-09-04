import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Api {
  final String _url = 'https://tt.mogic.com';
  var sessionId;
  final storage = new FlutterSecureStorage();

  //Store
  _getSessionId() async {
    sessionId = await storage.read(key: 'sessionId');
  }

  _storeSessionId(String value) async {
    await storage.write(key: 'sessionId', value: value);
  }

  //Auth
  login(data, apiUrl) async {
    http.Response response = await http.post(_url + '/login', body: data);
    _storeSessionId(response.headers['set-cookie']);
  }

  //Data
  getData() async {
    String cookie = await _getSessionId();
    return await http.get(_url + '/getData/days/3', headers: _setHeaders(cookie));
  }

  //Helper
  _setHeaders(cookies) => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Cookie': cookies
  };
 }

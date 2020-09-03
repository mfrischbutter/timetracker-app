import 'package:http/http.dart' as http;

class Auth {
  get(String url, Map<String, String> headers) async {
    http.Response response = await http.get(url, headers: headers);
    print(headers);
    print(response.body);
  }

  post(String url, dynamic data, Map<String, String> headers) async {
    http.Response response = await http.post(url, body: data, headers: headers);
    print(headers);
    return updateCookie(response);
  }

  updateCookie(http.Response response) {
    String rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      var headers = {
        'cookie': (index == -1) ? rawCookie : rawCookie.substring(0, index)
      };
      return headers;
    }
  }
}

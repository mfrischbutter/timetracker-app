import 'package:http/http.dart' as http;

class ApiResponse {
  dynamic data;
  int statusCode;

  ApiResponse({
    this.data,
    this.statusCode,
  });

  get isOkay => (statusCode < 300 && statusCode >= 200);

  factory ApiResponse.fromResponse(http.Response response) {
    return ApiResponse(
      data: response.body,
      statusCode: response.statusCode,
    );
  }
}

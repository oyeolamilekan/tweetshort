import 'package:http/http.dart' as http;

import '../const/api_const.dart';
import 'api/api_error.dart';

class HttpClient {
  Future<http.Response> get(
    String url, {
    baseUrl = ApiConstants.BASE_URL,
  }) async {
    final response = await http.get(
      Uri.parse("$baseUrl$url"),
    );
    ApiError.checkResponse(response.statusCode);
    return response;
  }
}

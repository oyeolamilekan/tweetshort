import 'dart:convert';

import '../http.dart';
import '../../setup.dart';

class ApiClient {
  final HttpClient _client = locator<HttpClient>();

  Future<Map<String, dynamic>> getTweet(String tweetId) async {
    final response = await _client.get(tweetId);
    final responseDecoded = json.decode(response.body);
    return responseDecoded;
  }
}

import 'dart:io';

import 'package:http/http.dart' as http;

import 'dart:convert';

// Get token from Reddit API
Future<http.Response> getToken(String username, String password) {
  String apiUrl = Platform.environment['FLUTTER_APP_API_URL'] ?? "";
  String clientId = Platform.environment['FLUTTER_APP_CLIENT_ID'] ?? "";
  String clientSecret = Platform.environment['FLUTTER_APP_CLIENT_SECRET'] ?? "";

  return http.post(Uri.parse('$apiUrl/access_token'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization":
            "Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}"
      },
      body: "grant_type=password&username=$username&password=$password");
}

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// Get token from Reddit API
Future<String> getToken(String username, String password) async {
  String apiUrl = dotenv.env['FLUTTER_APP_API_URL'] ?? "";
  String clientId = dotenv.env['FLUTTER_APP_CLIENT_ID'] ?? "";
  String clientSecret = dotenv.env['FLUTTER_APP_CLIENT_SECRET'] ?? "";

  var response = await http.post(Uri.parse('$apiUrl/access_token'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization":
            "Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}"
      },
      body: "grant_type=password&username=$username&password=$password");

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to load token from API');
  }
}

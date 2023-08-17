import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:reddit/providers/secrets_provider.dart';
import 'dart:convert';

import 'package:reddit/providers/token_manager_provider.dart';

// Get token from Reddit API
Future<Map<String, dynamic>> login(String username, String password) async {
  SecretsProvider secretsProvider = SecretsProvider();
  String apiUrl = secretsProvider.apiUrl;
  String clientId = secretsProvider.clientId;
  String clientSecret = secretsProvider.clientSecret;

  final response = await http.post(Uri.parse('$apiUrl/access_token'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": "flutter:alessandro.sh",
        "Authorization":
            "Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}"
      },
      body: "grant_type=password&username=$username&password=$password");

  if (response.statusCode == 200) {
    TokenManagerProvider.setToken(jsonDecode(response.body)['access_token']);
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load token from API');
  }
}

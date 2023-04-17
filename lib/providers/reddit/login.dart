import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:reddit/providers/storage.dart';

import '../../models/storage.dart';

// Get token from Reddit API
Future<Map<String, dynamic>> login(String username, String password) async {
  String apiUrl = dotenv.env['FLUTTER_APP_API_URL'] ?? "";
  String clientId = dotenv.env['FLUTTER_APP_CLIENT_ID'] ?? "";
  String clientSecret = dotenv.env['FLUTTER_APP_CLIENT_SECRET'] ?? "";
  final StorageService storage = StorageService();

  final response = await http.post(Uri.parse('$apiUrl/access_token'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization":
            "Basic ${base64.encode(utf8.encode('$clientId:$clientSecret'))}"
      },
      body: "grant_type=password&username=$username&password=$password");

  if (response.statusCode == 200) {
    storage.write(StorageItem(
        key: 'token', value: jsonDecode(response.body)['access_token']));
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load token from API');
  }
}

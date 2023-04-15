import 'package:http/http.dart' as http;
import 'dart:convert';

// Get token from Reddit API
Future<http.Response> getToken(String username, String password) {
  return http.post(Uri.parse('https://www.reddit.com/api/v1/access_token'),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization":
            "Basic ${base64.encode(utf8.encode('bfSlAm8fCHItpWQYhFpzKw:39539Agg7yf0zzY7volu4RoMCPVLPg'))}"
      },
      body: "grant_type=password&username=$username&password=$password");
}
